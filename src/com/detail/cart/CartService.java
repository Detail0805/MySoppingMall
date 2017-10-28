package com.detail.cart;

public class CartService {

	
	private CartDAO_Interface dao;
	
	public CartService() {
		dao=new CartDAO();
	}
	//一般商品查詢
	public CartVO findshop(Integer number,Integer quantity) {
		return dao.findshop(number,quantity);
	}
	//促銷活動商品查詢
	public CartVO findshopbypro(Integer number,Integer quantity) {
		return dao.findshopbypro(number,quantity);
	}
}
