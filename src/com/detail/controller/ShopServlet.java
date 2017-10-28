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

		if ("getOne_For_Display".equals(action)) {// �Ӧ�mainpage.jsp���ШD
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/

				String str = req.getParameter("ITEMNO");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("	<div class='alert alert-danger alert-dismissible' role='alert'>"
							+ "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>"+
							"&times;</span></button>�S����J�����r</div>");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/textforjsp.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				Integer empno = null;
				try {
					empno = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("�ӫ~�s���榡�����T");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/mainpage.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				ShopService empSvc = new ShopService();
				ShopVO shopVO = empSvc.getOneEmp(empno);
				if (shopVO == null) {
					errorMsgs.add("�d�L���");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/mainpage.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("shopVO", shopVO); // ��Ʈw���X��shopVO����,�s�Jreq
				String url = "/listone.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/mainpage.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Display2".equals(action)) {// �Ӧ�mainpage.jsp���ШD
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				String str = req.getParameter("ITEMNO");
				System.out.println(str);
				ShopService empSvc = new ShopService();
				ShopVO shopVO = empSvc.getOneEmpbyString(str);
				if (shopVO == null) {
					errorMsgs.add("�d�L���");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/mainpage.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("shopVO", shopVO); // ��Ʈw���X��shopVO����,�s�Jreq
				String url = "/listone.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/mainpage.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // �Ӧ�addshop.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer ITEMNO = new Integer(req.getParameter("ITEMNO"));
				
				/***************************2.�}�l�d�߸��****************************************/
				ShopService empSvc = new ShopService();
				ShopVO shopVO = empSvc.getOneEmp(ITEMNO);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("shopVO", shopVO);         // ��Ʈw���X��shopVO����,�s�Jreq
				String url = "/update_emp_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_emp_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				System.out.println("�����F");
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/ShowAll.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update".equals(action)) {	// �Ӧ�update_emp_input.jsp���ШD
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				Integer ITEMNO = new Integer(req.getParameter("ITEMNO").trim());
				String NAME = req.getParameter("NAME").trim();
				int STOCK = new Integer(req.getParameter("STOCK").trim());
				String DES = req.getParameter("DES").trim();
				
			
				int PRICE = 0;
				try {
					PRICE =new Integer(req.getParameter("PRICE").trim());
				} catch (NumberFormatException e) {
					PRICE = 0;
					errorMsgs.add("��J���~����");
				}
				ShopVO shopVO = new ShopVO();
				shopVO.setITEMNO(ITEMNO);
				shopVO.setNAME(NAME);;
				shopVO.setSTOCK(STOCK);
				shopVO.setDES(DES);
				shopVO.setPRICE(PRICE);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("shopVO", shopVO); // �t����J�榡���~��shopVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/update_emp_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				ShopService empSvc = new ShopService();
				shopVO = empSvc.updateEmp(ITEMNO, STOCK, PRICE, NAME, DES);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("shopVO", shopVO); // ��Ʈwupdate���\��,���T����shopVO����,�s�Jreq
				String url = "/listone.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/update_emp_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("delete".equals(action)) { // �Ӧ�addshop.do

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				Integer ITEMNO = new Integer(req.getParameter("ITEMNO"));
				
				/***************************2.�}�l�R�����***************************************/
				ShopService empSvc = new ShopService();
				empSvc.deleteEmp(ITEMNO);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/ShowAll.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/ShowAll.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("shelf".equals(action)) { // �Ӧ�addshop.do

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				Integer ITEMNO = new Integer(req.getParameter("ITEMNO"));
				Integer STATE = new Integer(req.getParameter("STATE"));
				/***************************2.�}�l�R�����***************************************/
				ShopService empSvc = new ShopService();
				if(STATE==1) {
					empSvc.changeState(ITEMNO,2);
				}else if(STATE==2){
					empSvc.changeState(ITEMNO,1);
				}

				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/listAll.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/ShowAll.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
