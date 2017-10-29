package com.shoporder.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.shop.model.ShopVO;

public class ShopOrderDAO implements ShopOrderDAO_interface{
	private static final String GET_ALL_NO="SELECT ORDERNO FROM SHOPORDER";
	private static final String GET_ALL="SELECT ORDERNO ,MEM_NO,ORDER_DATE,CUSTOMER_NAME FROM SHOPORDER";
	private static final String GET_ONE_BY_ORDERNO="SELECT  OT.ORDERNO,ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME FROM ORDERDETAIL OT JOIN SHOPORDER S ON (OT.ORDERNO = S.ORDERNO) WHERE OT.orderno=?";	
	private static final String GET_ONE_BY_MEMNO="SELECT  OT.ORDERNO,ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME FROM ORDERDETAIL OT JOIN SHOPORDER S ON (OT.ORDERNO = S.ORDERNO) WHERE MEM_NO=?";	
	private static final String GET_SALES_BY_ITEMNO="SELECT  OT.ORDERNO,ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME FROM ORDERDETAIL OT JOIN SHOPORDER S ON (OT.ORDERNO = S.ORDERNO) WHERE ITEMNO=?";
	private static final String ADD_SHOPORDER="INSERT INTO SHOPORDER(ORDERNO,ORDER_DATE,MEM_NO,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),CURRENT_TIMESTAMP,?,?,?,?)";
	private static final String ADD_ORDERDETAIL="INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(?,?,?)";
	//修改某訂單明細的數量
	private static final String UPDATE_EXIST_ORDERDETAIL="UPDATE  ORDERDETAIL SET  ORDERCOUNT=700 WHERE ORDERNO='20171027-000001' AND ITEMNO=4;";		
			
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	@Override
	public List<ShopOrderVO> getAllByOrderNo(String orderno) {
		List<ShopOrderVO> list = new ArrayList<ShopOrderVO>();
		ShopOrderVO shoporderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(GET_ONE_BY_ORDERNO);
			pstmt.setString(1, orderno);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				shoporderVO=new ShopOrderVO();
				shoporderVO.setOrderno(rs.getString("ORDERNO"));
				list.add(shoporderVO);
			}
			
		} catch (SQLException e) {
			System.out.println("GET_ONE_BY_ORDERNO錯誤 :"+e);

		}
		return list;
	}
	
	@Override
	public List<ShopOrderVO> getOneByMenNO(String menno) {
		List<ShopOrderVO> list = new ArrayList<ShopOrderVO>();
		ShopOrderVO shoporderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(GET_ONE_BY_MEMNO);
			pstmt.setString(1, menno);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				shoporderVO=new ShopOrderVO();
				shoporderVO.setOrderno(rs.getString("orderno"));
				shoporderVO.setCustomer_address(rs.getString("customer_address"));
				shoporderVO.setCustomer_name(rs.getString("customer_name"));
				shoporderVO.setCustomer_phone(rs.getString("customer_phone"));
				shoporderVO.setOrdercount(rs.getInt("ordercount"));
				shoporderVO.setItemno(rs.getInt("itemno"));
				shoporderVO.setMemberno(rs.getString("MEM_NO"));
				shoporderVO.setOrder_date(rs.getDate("order_date"));
				
				list.add(shoporderVO);
			}
			
		} catch (SQLException e) {
			System.out.println("GET_ALL_NO錯誤 :"+e);

		}
		return list;
	}
	
	@Override
	public List<ShopOrderVO> getOneByItemNo(Integer itemno) {
	
		List<ShopOrderVO> list = new ArrayList<ShopOrderVO>();
		ShopOrderVO shoporderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(GET_SALES_BY_ITEMNO);
			pstmt.setInt(1, itemno);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				shoporderVO=new ShopOrderVO();
				shoporderVO.setOrderno(rs.getString("orderno"));
				shoporderVO.setCustomer_address(rs.getString("customer_address"));
				shoporderVO.setCustomer_name(rs.getString("customer_name"));
				shoporderVO.setCustomer_phone(rs.getString("customer_phone"));
				shoporderVO.setOrdercount(rs.getInt("ordercount"));
				shoporderVO.setItemno(rs.getInt("itemno"));
				shoporderVO.setMemberno(rs.getString("MEM_NO"));
				shoporderVO.setOrder_date(rs.getDate("order_date"));	
				list.add(shoporderVO);
			}
		} catch (SQLException e) {
			System.out.println("GET_ONE_BY_ORDERNO錯誤 :"+e);
		}
		return list;
	}
	


	@Override
	public void addShopOrder(ShopOrderVO shoporderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(ADD_SHOPORDER);
			pstmt.setString(1, shoporderVO.getMemberno());
			System.out.println("DB1");
			pstmt.setString(2, shoporderVO.getCustomer_address());
			System.out.println("DB2");
			pstmt.setString(3, shoporderVO.getCustomer_phone());
			System.out.println("DB3");
			pstmt.setString(4, shoporderVO.getCustomer_name());
			System.out.println("DB4");
			pstmt.executeUpdate();
			pstmt.clearParameters();
			pstmt = con.prepareStatement(ADD_ORDERDETAIL);
			System.out.println("DB5");
			//須取得自增主鍵來一次完成
			pstmt.setString(1,"20171027-000001");
			System.out.println("DB6");
			pstmt.setInt(2, shoporderVO.getItemno());
			System.out.println("DB7");
			pstmt.setInt(3, shoporderVO.getOrdercount());
			System.out.println("DB8");
			pstmt.executeUpdate();			

		} catch (SQLException e) {
			
			e.printStackTrace();
			System.out.println("addShopOrder錯誤");
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}
	@Override
	public List<ShopOrderVO> getAllOrder() {
		List<ShopOrderVO> list = new ArrayList<ShopOrderVO>();
		ShopOrderVO shoporderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(GET_ALL);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				shoporderVO=new ShopOrderVO();
				shoporderVO.setOrderno(rs.getString("orderno"));
				shoporderVO.setMemberno(rs.getString("MEM_NO"));
				shoporderVO.setOrder_date(rs.getDate("ORDER_DATE"));
				shoporderVO.setCustomer_name(rs.getString("CUSTOMER_NAME"));
				list.add(shoporderVO);
			}
		} catch (SQLException e) {
			System.out.println("GET_ONE_BY_ORDERNO錯誤 :"+e);
		}
		return list;
	}

	@Override
	public List<ShopOrderVO> updateShopOrder() {
		// TODO Auto-generated method stub
		return null;
	}
		
}
