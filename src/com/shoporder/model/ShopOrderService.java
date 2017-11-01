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
		return dao.getAllByMenNO(menno);
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
			dao.addShopCartOrder(shoporderVO);
		return shoporderVO;
	}
	public void delete(String orderno,String memno){
		dao.delete(orderno, memno);
	}
	public Integer returnPoint(String memno) {
		return dao.returnPoint(memno);
	}
	public Integer returnAfterShoppingPoint(Integer total,String memno) {
		return dao.returnAfterShoppingPoint(total, memno);
	}
	public Integer returnPointback(String orderno) {
		return dao.returnPointback(orderno);
	}
	
	public List<ShopOrderVO> getPomotionPriceByOrderNoIfHave(String orderno){
		return dao.getPomotionPriceByOrderNoIfHave(orderno);
	}
	public List<ShopOrderVO> getPriceByOrderNo(String orderno){
		return dao.getPriceByOrderNo(orderno);
	}
	
}
