package shop;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import com.shop.model.ShopVO;

import java.io.InputStream;

@WebServlet("/addshop.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class addshop extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static DataSource ds = null;
	static {

		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();

		}
	}
	private static final String INSERT_STMT = "INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES ,PICTURE1,PICTURE2,PICTURE3)  VALUES (FORSHOPITEM.Nextval,?,?,?,?,?,?,?,?,?)";

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8"); // 處理中文檔名
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		System.out.println("ContentType=" + req.getContentType()); // 測試用
		ShopVO empVO=new ShopVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		Part part = req.getPart("upfile1");
		Part part2 = req.getPart("upfile2");
		Part part3 = req.getPart("upfile3");
		InputStream part11 = (InputStream) part.getInputStream();
		InputStream part22 = (InputStream) part2.getInputStream();
		InputStream part33 = (InputStream) part3.getInputStream();
		//很奇怪只有setbyte才會在資料庫出現blob
		byte[] part111=InputStreamToByte(part11);
		byte[] part222=InputStreamToByte(part22);
		byte[] part333=InputStreamToByte(part33);
		String key = null;
		
		
		//取得上一個網頁的資訊(目前無法新增中文...)
		//int ITEMNO = Integer.parseInt(req.getParameter("ITEMNO"));
		int CLASSNO = Integer.parseInt(req.getParameter("CLASSNO"));
		int STOCK = Integer.parseInt(req.getParameter("STOCK"));
		int PRICE = Integer.parseInt(req.getParameter("PRICE"));
		//STATE
		String NAME = req.getParameter("NAME");
		String DES = req.getParameter("DES");
		
		try {
			String[] cols = { "ITEMNO" };
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT,cols);
			//pstmt.setInt(1, ITEMNO);
			pstmt.setInt(1, STOCK);
			pstmt.setInt(2, PRICE);
			pstmt.setInt(3, 1);//STATE暫時都先給1
			pstmt.setInt(4, CLASSNO);
			pstmt.setString(5,NAME);
			pstmt.setString(6, DES);
			pstmt.setBytes(7, part111);
			pstmt.setBytes(8, part222);
			pstmt.setBytes(9, part333);
			System.out.println("我倒了嗎0");
			pstmt.executeUpdate();
			
			ResultSet rs = pstmt.getGeneratedKeys();
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnCount = rsmd.getColumnCount();
			if (rs.next()) {
				do {
					for (int i = 1; i <= columnCount; i++) {
						key = rs.getString(i);
						System.out.println("自增主鍵值 = " + key +"(剛新增成功的員工編號)");
					}
				} while (rs.next());
			} else {
				System.out.println("NO KEYS WERE GENERATED.");
			}
			
			rs.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		out.append(
				"<h1 align=center>上傳成功！</h1>"+
				"\r\n" + 
				"<table border='1' bordercolor='#CCCCFF' width='1500' align='center'>\r\n" + 
				"	<tr>\r\n" + 
				"		<th>商品圖片</th>\r\n" + 
				"		<th>商品編號</th>\r\n" + 
				"		<th>商品類別</th>\r\n" + 
				"		<th>商品名稱</th>\r\n" + 
				"		<th>商品數量</th>\r\n" + 
				"		<th>商品價格</th>\r\n" + 
				"		<th>商品描述</th>\r\n" + 
				"		<th>修改</th>\r\n" + 
				"		<th>刪除</th>\r\n" + 
				"	</tr>\r\n" + 
				"	<tr>\r\n" + 
				"		<th>"+"<img src='DBPicReader?ITEMNO="+key+"' height='150px'>"+
				"<img src='DBPicReader2?ITEMNO="+key+"' height='150px'>"+
				"<img src='DBPicReader3?ITEMNO="+key+"' height='150px'>"+"</th>\r\n" + 
				"		<th>"+key+"</th>\r\n" + 
				"		<th>"+CLASSNO+"</th>\r\n" + 
				"		<th>"+NAME+"</th>\r\n" + 
				"		<th>"+STOCK+"</th>\r\n" + 
				"		<th>"+PRICE+"</th>\r\n" + 
				"		<th>"+DES+"</th>\r\n" + 
				"<td>\r\n" + 
				"			  <form name=\"empnoForm\" method=\"post\" action=\"emp.do\">\r\n" + 
				"			     <input type=\"submit\" value=\"修改\">\r\n" + 
				"			     <input type=\"hidden\" name=\"ITEMNO\" value='"+key+"'>"+ 
				"				 <input type=\"hidden\" name=\"action\"	value=\"getOne_For_Update\">" + 
				"			</form>\r\n</td>\r\n" + 
				"			<td>\r\n" + 
				"			  <form name=\"empnoForm\" method=\"post\" action=\"emp.do\">\r\n" + 
				"			    <input type=\"submit\" value=\"刪除\">\r\n" + 
				"			    <input type=\"hidden\" name=\"ITEMNO\" value='"+key+"'>" + 
				"				 <input type=\"hidden\" name=\"action\"	value=\"delete\">" + 
				"			</form>\r\n</td>\r\n" + 
				"			</td>"+
				"	</tr>\r\n" + 
				"</table>"+
				"<div align='center'><a href=\"javascript:history.go(-1);\"><font size=\"5\">回上一頁</font></a></div>\r\n"
				
				);
			
		}
		
	
	
//把inputstream轉成byte[]
	private byte[] InputStreamToByte(InputStream is) throws IOException {
		ByteArrayOutputStream bytestream = new ByteArrayOutputStream();

		int ch;
		while ((ch = is.read()) != -1) {
		bytestream.write(ch);
		}
		byte imgdata[] = bytestream.toByteArray();
		bytestream.close();
		return imgdata;
		
	}
	
	// 取出上傳的檔案名稱 (因為API未提供method,所以必須自行撰寫)
	public String getFileNameFromPart(Part part) {
		String header = part.getHeader("content-disposition");
		System.out.println("header=" + header); // 測試用
		String filename = new File(header.substring(header.lastIndexOf("."), header.length() - 1)).getName();
		System.out.println("filename=" + filename); // 測試用
		if (filename.length() == 0) {
			return null;
		}
		return filename;
	}
}

