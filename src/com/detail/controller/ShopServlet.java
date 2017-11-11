package com.detail.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.model.ShopService;
import com.shop.model.ShopVO;

public class ShopServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
		
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {// 來自mainpage.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				String str = req.getParameter("ITEMNO");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("	<div class='alert alert-danger alert-dismissible' role='alert'>"
							+ "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>"+
							"&times;</span></button>沒有輸入任何文字</div>");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/textforjsp.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer empno = null;
				try {
					empno = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("商品編號格式不正確");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/mainpage.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				ShopService empSvc = new ShopService();
				ShopVO shopVO = empSvc.getOneEmp(empno);
				if (shopVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/mainpage.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("shopVO", shopVO); // 資料庫取出的shopVO物件,存入req
				String url = "/Shop/listone.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/mainpage.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Display2".equals(action)) {// 來自mainpage.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				String str = req.getParameter("ITEMNO");
				System.out.println(str);
				ShopService empSvc = new ShopService();
				ShopVO shopVO = empSvc.getOneEmpbyString(str);
				if (shopVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/mainpage.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("shopVO", shopVO); // 資料庫取出的shopVO物件,存入req
				String url = "/Shop/listone.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/mainpage.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自addshop.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				Integer ITEMNO = new Integer(req.getParameter("ITEMNO"));
				
				/***************************2.開始查詢資料****************************************/
				ShopService empSvc = new ShopService();
				ShopVO shopVO = empSvc.getOneEmp(ITEMNO);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("shopVO", shopVO);         // 資料庫取出的shopVO物件,存入req
				String url = "/Shop/update_emp_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				System.out.println("跳錯了");
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/ShowAll.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update".equals(action)) {	// 來自update_emp_input.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer ITEMNO = new Integer(req.getParameter("ITEMNO").trim());
				String NAME = req.getParameter("NAME").trim();
				int STOCK = new Integer(req.getParameter("STOCK").trim());
				String DES = req.getParameter("DES").trim();
				
			
				int PRICE = 0;
				try {
					PRICE =new Integer(req.getParameter("PRICE").trim());
				} catch (NumberFormatException e) {
					PRICE = 0;
					errorMsgs.add("填入產品價格");
				}
				ShopVO shopVO = new ShopVO();
				shopVO.setITEMNO(ITEMNO);
				shopVO.setNAME(NAME);;
				shopVO.setSTOCK(STOCK);
				shopVO.setDES(DES);
				shopVO.setPRICE(PRICE);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("shopVO", shopVO); // 含有輸入格式錯誤的shopVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/update_emp_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				ShopService empSvc = new ShopService();
				shopVO = empSvc.updateEmp(ITEMNO, STOCK, PRICE, NAME, DES);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("shopVO", shopVO); // 資料庫update成功後,正確的的shopVO物件,存入req
				String url = "/listone.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/update_emp_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("delete".equals(action)) { // 來自addshop.do

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				Integer ITEMNO = new Integer(req.getParameter("ITEMNO"));
				
				/***************************2.開始刪除資料***************************************/
				ShopService empSvc = new ShopService();
				empSvc.deleteEmp(ITEMNO);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/ShowAll.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/ShowAll.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("shelf".equals(action)) { // 來自addshop.do

			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				Integer ITEMNO = new Integer(req.getParameter("ITEMNO"));
				Integer STATE = new Integer(req.getParameter("STATE"));
				/***************************2.開始刪除資料***************************************/
				ShopService empSvc = new ShopService();
				if(STATE==1) {
					empSvc.changeState(ITEMNO,2);
				}else if(STATE==2){
					empSvc.changeState(ITEMNO,1);
				}

				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/Shop/listAll.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/ShowAll.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Update".equals(action)) { // 來自addshop.jsp的請求
			
			System.out.println("進入getOne_For_Update");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				Integer ITEMNO = new Integer(req.getParameter("ITEMNO"));
				
				/***************************2.開始查詢資料****************************************/
				ShopService empSvc = new ShopService();
				ShopVO shopVO = empSvc.getOneEmp(ITEMNO);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("shopVO", shopVO);         // 資料庫取出的shopVO物件,存入req
				String url = "/Shop/update_emp_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				System.out.println("跳錯了");
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/ShowAll.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("checkone".equals(action)) {	// 來自update_emp_input.jsp的請求
			System.out.println("checkone");

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer ITEMNO = new Integer(req.getParameter("ITEMNO").trim());
				ShopVO shopVO=null;
				/***************************2.開始修改資料*****************************************/
				ShopService empSvc = new ShopService();
				shopVO = empSvc.getOneEmp(ITEMNO);

				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("shopVO", shopVO); // 資料庫update成功後,正確的的shopVO物件,存入req
				String url = "/Shop/ShopPage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Shop/ShopPage.jsp");
				failureView.forward(req, res);
			}
		}
		
		
	}

}
