package com.detail.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.detail.cart.CartVO;
import com.shoporder.model.ShopOrderService;
import com.shoporder.model.ShopOrderVO;

public class ShopOrderServlet extends HttpServlet{


	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
		
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("addshoporder".equals(action)) {// 來自listallpro.jsp的請求
			System.out.println("進入shoporderservice");
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				String str = req.getParameter("ADDRESS");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入地址");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/MasterOrder/addshoporder.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				ShopOrderVO shopOrderVO=new ShopOrderVO();
				shopOrderVO.setCustomer_address(req.getParameter("ADDRESS"));
				shopOrderVO.setCustomer_name(req.getParameter("NAME"));
				shopOrderVO.setCustomer_phone(req.getParameter("PHONE"));
				shopOrderVO.setMemberno(req.getParameter("MEMNO"));
				shopOrderVO.setItemno(new Integer(req.getParameter("ITEMNO")));
				shopOrderVO.setOrdercount(new Integer(req.getParameter("ORDERCOUNT")));
				
				System.out.println("1");


				/*************************** 2.開始新增資料 *****************************************/
				ShopOrderService shopOrderSvc = new ShopOrderService();
				ShopOrderVO shopordervo =shopOrderSvc.addShopOrder(shopOrderVO);
//				if (proVO == null) {
//					errorMsgs.add("查無資料");
//				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/MasterOrder/addshoporder.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("shopordervo", shopordervo); 
				System.out.println("2");
				String url = "/MasterOrder/listallOrder.jsp";
				System.out.println("3");
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
				System.out.println("4");
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/MasterOrder/addshoporder.jsp");
				failureView.forward(req, res);
			}
		}if("CONFIRM".equals(action)){//來自CHECK.JSP的請求
			HttpSession session=req.getSession();
			Vector<CartVO> buylist = (Vector<CartVO>) session.getAttribute("shoppingcart");
			
			}
		else {
		}
			System.out.println("功能尚未連結到 ShopOrderServlet.java");
		}
	}

