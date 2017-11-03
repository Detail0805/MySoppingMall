package com.detail.controller;

import java.io.IOException;
import java.util.ArrayList;
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

		if ("addshoporder".equals(action)) {// 來自ListAllPropro.jsp的請求
			System.out.println("進入ShopOrderSevlet");
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
				String url = "/MasterOrder/ListAllProOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/MasterOrder/addshoporder.jsp");
				failureView.forward(req, res);
			}
		}
		if ("CONFIRM".equals(action)) {// 來自CHECK.JSP的請求
			
			
			HttpSession session = req.getSession();
			Vector<CartVO> buylist = (Vector<CartVO>) session.getAttribute("shoppingcart");
			Integer Point=null;

			for(int i=0;i<buylist.size();i++){
				CartVO cartVO = buylist.get(i);
				cartVO.setQUANTITY(new Integer(req.getParameter("quantity"+i)));
				System.out.println("所改變的數量 :"+req.getParameter("quantity"+i));
			}
			
			List<ShopOrderVO> list = new ArrayList<ShopOrderVO>();
			ShopOrderService shopOrSvc = new ShopOrderService();
			
			Integer amount=(int) (Float.parseFloat(req.getParameter("amount")));
			String MEMNO=req.getParameter("MEMNO");
			Point=shopOrSvc.returnPoint(MEMNO);
			ShopOrderVO shopOrderVO = null;
			//這邊要先查詢一次這位會員的POINT有沒有低於總金額在執行下面動做
			if(Point>=amount) {
				System.out.println("餘額足夠");
			for (int i = 0; i < buylist.size(); i++) {
				CartVO cartVO = buylist.get(i);
				shopOrderVO = new ShopOrderVO();
//				System.out.println("第 " + i + "次取出BEAN的值作測試");
//				System.out.println("cartVO.getNAME()" + cartVO.getNAME());
				shopOrderVO.setItemno(cartVO.getITEMNO());
				shopOrderVO.setMemberno(MEMNO);
//				System.out.println("shopOrderVO.setItemno:" + shopOrderVO.getItemno());
//				System.out.println("cartVO.getITEMNO()" + cartVO.getITEMNO());
//				System.out.println("cartVO.getQUANTITY()" + cartVO.getQUANTITY());
				shopOrderVO.setOrdercount(cartVO.getQUANTITY());
				// 第一次的時候還需要設置用戶訂單地址，但那可以從會原那邊撈這邊先不實做
//				System.out.println("shopOrderVO.getOrdercount():" + shopOrderVO.getOrdercount());
//				System.out.println("cartVO.getDES()" + cartVO.getDES().substring(0, 5));
//				System.out.println("cartVO.getPRICE()" + cartVO.getPRICE());
				//兩種版本目前用LIST版本實做，傳過去為LIST<ShopOrderVO>
				list.add(shopOrderVO);
				// shopOrSvc.addShopOrder(shopOrderVO);
				}
			}else{
				System.out.println("餘額不足訂單未成立");
			}

			Integer NowPoint=shopOrSvc.returnAfterShoppingPoint(amount, MEMNO);
			shopOrSvc.addShopCartOrder(list);
			System.out.println("消費前點數 :"+Point+",消費後點數"+NowPoint);
			String url = "/MasterOrder/listallOrder.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
																			// ListAllProOrder.jsp
			successView.forward(req, res);

		} 
		if ("DELETE".equals(action)) {// 來自CHECK.JSP的請求

			try {
				String ORDERID = (String) req.getParameter("ORDERID");
				String MEMBERNO = (String) req.getParameter("MEMBERNO");

				ShopOrderService shopOrderSvc = new ShopOrderService();
				shopOrderSvc.delete(ORDERID, MEMBERNO);

				String url = "/MasterOrder/listallOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
																				// ListAllProOrder.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				System.out.println("ShopOrderServlet.java DELETE失敗 :" + e);
			}
		}
		
		if ("UPDATE_ORDERID".equals(action)) {// 來自CHECK.JSP的請求

			System.out.println("進入ShopOrderServlet.java.UPdate_orderid邏輯運算");
			String orderid = req.getParameter("ORDERID");
			String memberno = req.getParameter("MEMBERNO");
			Integer total=0;
			List<ShopOrderVO> FinishShopOrderVO = null;
			ShopOrderService shopOrderSvc = new ShopOrderService();
			// liatinpromotion訂單中有特價的商品為哪些(多一個VO屬性newprice)
			List<ShopOrderVO> ListAllOrderShop = shopOrderSvc.getPriceByOrderNoIfHave(orderid);
			System.out.println("搜尋全部商品時的ListAllOrderShop.size() :"+ListAllOrderShop.size());
			System.out.println("-----------------------------------------------");
			// ListAllPro是全部訂購商品的明細
			List<ShopOrderVO> ListAllPro = shopOrderSvc.getPriceByOrderNo(orderid);
			System.out.println("搜尋全部商品時的ListAllPro.size() :"+ListAllPro.size());
			// 雙迴圈比對是否有促銷價格，有的話覆蓋到ListAllPro
			for (int i = 0; i < ListAllOrderShop.size(); i++) {
				ShopOrderVO ListShopVO = ListAllOrderShop.get(i);
				for (int j = 0; j < ListAllPro.size(); j++) {
					ShopOrderVO ListShopProVO = ListAllPro.get(j);
					if (ListShopVO.getItemno() == ListShopProVO.getItemno()) {
						System.out.println("原本ListShopProVO.getPrice() :" + ListShopProVO.getPrice());
						System.out.println("原本ListShopVO.getPrice() :" + ListShopVO.getPrice());
						ListShopVO.setPrice(ListShopProVO.getPrice());
						System.out.println( "ListShopVO.setPrice(ListShopProVO.getPrice()):" + ListShopProVO.getPrice());
						System.out.println("兩屬性值相同表是改變成功。");
					}
				}
			}
			//算出此筆訂單的總金額
			for (int i = 0; i < ListAllPro.size(); i++) {
				total+=ListAllPro.get(i).getPrice();
				System.out.println("ListAllPro.size() :" + ListAllPro.size());
				System.out.println("ListAllPro.get(i).getPrice() :" + ListAllPro.get(i).getPrice());
				System.out.println("ListAllPro.get(i).getItemno() :"+ListAllPro.get(i).getItemno());
				System.out.println("ListAllPro.get(i).getItemno() :"+ListAllPro.get(i).getCustomer_name());
				System.out.println("ListAllPro.get(i).getItemno() :"+ListAllPro.get(i).getPrice());
			}
			System.out.println("總金額 :"+total);
			try {
				req.setAttribute("total", total);
				req.setAttribute("OrderList", ListAllOrderShop);
				String url = "/MasterOrder/Update_one_order.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
																				// Update_one_order.jsp
				successView.forward(req, res);
			} catch (Exception e) {
				System.out.println("ShopOrderServlet.java DELETE失敗 :" + e);
			}
		}

	}
}

