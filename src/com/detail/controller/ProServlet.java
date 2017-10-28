package com.detail.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.detail.promotion.ProService;
import com.detail.promotion.ProVO;
import com.shop.model.ShopService;
import com.shop.model.ShopVO;

public class ProServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
		
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {// �Ӧ�listallpro.jsp���ШD
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/

				String str = req.getParameter("ITEMNO");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�ӫ~�s��");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/mainforpro.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}



				/*************************** 2.�}�l�d�߸�� *****************************************/
				ProService proSvc = new ProService();
				List<ProVO> proVO =  proSvc.getOneEmpbyString(str);
				if (proVO == null) {
					errorMsgs.add("�d�L���");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/mainforpro.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("proVO", proVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/listonepro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/mainforpro.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Display2".equals(action)) {// �Ӧ�listallpro.jsp���ШD
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/

				String str = req.getParameter("ITEMNO");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�ӫ~�s��");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/mainforpro.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}



				/*************************** 2.�}�l�d�߸�� *****************************************/
				ProService proSvc = new ProService();
				ProVO proVO =  proSvc.getOneEmpForStringName(str);
				if (proVO == null) {
					errorMsgs.add("�d�L���");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/mainforpro.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("proVO", proVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/listoneProForName.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/mainforpro.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Display3".equals(action)) {// �Ӧ�listallpro.jsp���ШD
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/

				String str = req.getParameter("PRONO");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�ӫ~�s��");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/mainforpro.jsp");
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
							.getRequestDispatcher("/mainforpro.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}


				/*************************** 2.�}�l�d�߸�� *****************************************/
				ProService proSvc = new ProService();
				ProVO proVO =  proSvc.getOneOnItemNO(empno);
				if (proVO == null) {
					errorMsgs.add("�d�L���");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/mainforpro.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("proVO", proVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/listoneProForName.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/mainforpro.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllPro.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer PRONO = new Integer(req.getParameter("ITEMNO"));
				
				/***************************2.�}�l�d�߸��****************************************/
				ProService proSvc = new ProService();
				ProVO proVO = proSvc.getOneEmp(PRONO);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("proVO", proVO);         // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/update_pro_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_pro_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				System.out.println("getOne_For_Update�����F");
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/listAllPro.jsp");
				failureView.forward(req, res);
			}
		}
		//��ثe�����٨S���Ǥ���i�h�n�O�o�갵
		if ("update".equals(action)) {	// �Ӧ�update_pro_input.jsp���ШD
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String NAME = req.getParameter("NAME").trim();
				Integer ITEMNO =new Integer(req.getParameter("ITEMNO"));
				//�r����Integer�A��Long
				Long BEGINDATE = new Long(req.getParameter("BEGINDATE"));
				Long ENDDATE = new Long(req.getParameter("ENDDATE"));
			
				Integer PROMOTIOMNO=new Integer(req.getParameter("PROMOTIOMNO"));
				
				int PRICE = 0;
				try {
					PRICE =new Integer(req.getParameter("PRICE").trim());
				} catch (NumberFormatException e) {
					PRICE = 0;
					errorMsgs.add("��J���~����");
				}
				ProVO proVO = new ProVO();
				//���ݭnimport�g�k
				proVO.setBEGINDATE(new java.sql.Date(BEGINDATE*1000L));
				proVO.setENDDATE(new java.sql.Date(ENDDATE*1000L));
				proVO.setNAME(NAME);
				proVO.setPRICE(PRICE);
				proVO.setITEMNO(ITEMNO);
				proVO.setPROMOTIOMNO(PROMOTIOMNO);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("proVO", proVO); // �t����J�榡���~��proVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/update_pro_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				//���ư��קK�⦸���~�P�ɲ��Ϳ�X�r��榡�����T
				if(BEGINDATE>ENDDATE) {
					
					errorMsgs.add("����榡�����T:�}�l�ɶ��񵲧��ɶ���");
				}
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("proVO", proVO); // �t����J�榡���~��proVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/update_pro_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				ProService proSvc = new ProService();
				System.out.println("pro�ק��ƫe");
				proVO = proSvc.updateEmp(NAME, PROMOTIOMNO, PRICE, ITEMNO,new java.sql.Date(BEGINDATE*1000L),new java.sql.Date(ENDDATE*1000L));
				System.out.println("pro�ק��ƫ�");
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("proVO", proVO); // ��Ʈwupdate���\��,���T����proVO����,�s�Jreq
				String url = "/listoneProForName.jsp";
				System.out.println("PROSERVLET���\FORWARED TO  LISTONEPRO");
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);
				

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				System.out.println("�i�J�F*��L�i�઺���~�B�z*");
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/update_pro_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("addpromotion".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println("�i�Jaddpromotion");
			
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				
				String NAME = req.getParameter("NAME");
				if (NAME == null || (NAME.trim()).length() == 0) {
					errorMsgs.add("�п�J�ӫ~�W��");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/addpromotion.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				//�r����Integer�A��Long
				Long BEGINDATE = new Long(req.getParameter("BEGINDATE"));
				Long ENDDATE = new Long(req.getParameter("ENDDATE"));
			
				ProVO proVO = new ProVO();
				//���ݭnimport�g�k
				proVO.setBEGINDATE(new java.sql.Date(BEGINDATE*1000L));
				proVO.setENDDATE(new java.sql.Date(ENDDATE*1000L));
				proVO.setNAME(NAME);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("proVO", proVO); // �t����J�榡���~��proVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/addpromotion.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				//���ư��קK�⦸���~�P�ɲ��Ϳ�X�r��榡�����T
				if(BEGINDATE>ENDDATE) {
					errorMsgs.add("����榡�����T:�}�l�ɶ��񵲧��ɶ���");
				}
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("proVO", proVO); // �t����J�榡���~��proVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/addpromotion.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				ProService proSvc = new ProService();
				//�ǤJ�O��� DATE*1000L
				proVO = proSvc.addPro(NAME, new java.sql.Date(BEGINDATE*1000L),new java.sql.Date(ENDDATE*1000L));
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("proVO", proVO); // ��Ʈwupdate���\��,���T����proVO����,�s�Jreq
				String url = "/listAllPromotion.jsp";
				System.out.println("PROSERVLET���\FORWARED TO  listAllPro");
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);
				

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				System.out.println("�i�J�F*��L�i�઺���~�B�z*");
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/addpromotion.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		if ("delete".equals(action)) { // �Ӧ�listAllPro.do,listonepro.jsp

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
				String url = "/listAllPro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/listAllPro.jsp");
				failureView.forward(req, res);
			}
		}
		
	}

}