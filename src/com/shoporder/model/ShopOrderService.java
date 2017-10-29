package com.shoporder.model;

import java.util.List;

public class ShopOrderService {

	ShopOrderDAO_interface dao;
	
	public ShopOrderService() {
		dao=new ShopOrderDAO();
	}
	
	public List<ShopOrderVO> getAllByOrderNo(String orderno){
		return dao.getAllByOrderNo(orderno);
	}
	
	public List<ShopOrderVO> getOneByItemNo(Integer pk){
		return dao.getOneByItemNo(pk);
	}
	
	public List<ShopOrderVO> getOneByMenNO(String menno){
		return dao.getOneByMenNO(menno);
	}
	public List<ShopOrderVO>getAllOrder(){
		return dao.getAllOrder();
	}
	public ShopOrderVO addShopOrder(ShopOrderVO shoporderVO) {
		dao.addShopOrder(shoporderVO);
		return shoporderVO;
	}
	public List<ShopOrderVO> updateShopOrder(){
		return dao.updateShopOrder();
	}
	public List<ShopOrderVO> addShopCartOrder(List<ShopOrderVO> shoporderVO){
		return dao.updateShopOrder();
	}
}
