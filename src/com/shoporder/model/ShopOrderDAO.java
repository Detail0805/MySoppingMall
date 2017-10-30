package com.shoporder.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Savepoint;
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
	//�ק�Y�q����Ӫ��ƶq
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
			System.out.println("GET_ONE_BY_ORDERNO���~ :"+e);

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
			System.out.println("GET_ALL_NO���~ :"+e);

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
			System.out.println("GET_ONE_BY_ORDERNO���~ :"+e);
		}
		return list;
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
			System.out.println("GET_ONE_BY_ORDERNO���~ :"+e);
		}
		return list;
	}

	@Override
	public List<ShopOrderVO> updateShopOrder() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addShopOrder(ShopOrderVO shoporderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String key = null;
		try {
			String[] cols = { "ORDERNO" };
			con = ds.getConnection();
			pstmt = con.prepareStatement(ADD_SHOPORDER,cols);
			pstmt.setString(1, shoporderVO.getMemberno());
			pstmt.setString(2, shoporderVO.getCustomer_address());
			pstmt.setString(3, shoporderVO.getCustomer_phone());
			pstmt.setString(4, shoporderVO.getCustomer_name());
			pstmt.executeUpdate();
			
			ResultSet rs = pstmt.getGeneratedKeys();
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnCount = rsmd.getColumnCount();
			
			if (rs.next()) {
				do {
					for (int i = 1; i <= columnCount; i++) {
						key = rs.getString(i);
						System.out.println("�ۼW�D��� = " + key +"(��s�W���\�����u�s��)");
					}
				} while (rs.next());
			} else {
				System.out.println("NO KEYS WERE GENERATED.");
			}
			
			rs.close();
			
			pstmt.clearParameters();
			pstmt = con.prepareStatement(ADD_ORDERDETAIL);
			System.out.println("DB5");
			//�����o�ۼW�D��Ӥ@������
			pstmt.setString(1,key);
			System.out.println("DB6");
			pstmt.setInt(2, shoporderVO.getItemno());
			System.out.println("DB7");
			pstmt.setInt(3, shoporderVO.getOrdercount());
			System.out.println("DB8");
			pstmt.executeUpdate();			
	
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("addShopOrder���~");
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
	public void addShopCartOrder(List<ShopOrderVO> shoporderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		Savepoint savePoint = null;
		String key = null;
		try {
			String[] cols = { "ORDERNO" };
			con = ds.getConnection();
			//���ʪ������F��s�W�i�h���o�����A�ҥH����AUTOCOMMIT
			con.setAutoCommit(false);
			//�x�s�I
			savePoint = con.setSavepoint(); 
			pstmt = con.prepareStatement(ADD_SHOPORDER,cols);
			//�U���o�@�q�u�n�s�W�@���N�i�H�A�q�|����ƨ��o�D�e�����
			pstmt.setString(1, "MEM0001");
			pstmt.setString(2, "�a�}");
			pstmt.setString(3, "�q��");
			pstmt.setString(4, "�m�W");
			pstmt.executeUpdate();
			System.out.println("DB01");
			
			// ���o�������ۼW�D���
			ResultSet rs = pstmt.getGeneratedKeys();
			System.out.println("DB02");
			ResultSetMetaData rsmd = rs.getMetaData();
			System.out.println("DB03");
			int columnCount = rsmd.getColumnCount();
			if (rs.next()) {
				System.out.println("DB04");
				do {
					for (int i = 1; i <= columnCount; i++) {
						key = rs.getString(i);
						System.out.println("�ۼW�D��� = " + key +"(��s�W���\���q��s��)");
					}
				} while (rs.next());
			} else {
				System.out.println("NO KEYS WERE GENERATED.");
			}
			System.out.println("DB05");
			rs.close();
			System.out.println("DB06");
			pstmt.clearParameters();
			System.out.println("DB07");
			// �A�P�ɷs�W�q����Ӥ��e
			for(int i=0;i<shoporderVO.size();i++){
				pstmt = con.prepareStatement(ADD_ORDERDETAIL);
				System.out.println("DB5");
				// �����o�ۼW�D��Ӥ@������
				pstmt.setString(1, key);
				pstmt.setInt(2, shoporderVO.get(i).getItemno());
				pstmt.setInt(3, shoporderVO.get(i).getOrdercount());
				pstmt.executeUpdate();
				System.out.println("��"+i+" ���s�W");
			}
			System.out.println("commit�e");
			con.commit();
			System.out.println("commit��");
			con.setAutoCommit(true);
			System.out.println("setAutoCommit��");
		} catch (SQLException e) {
			try {
				con.rollback();
				System.out.println("ShopOrderDAO.java�s�W�q����~,����rollback :"+e);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
			System.out.println("ShopOrderDAO���~");
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
		
}
