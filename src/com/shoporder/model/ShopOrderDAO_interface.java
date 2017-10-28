package com.shoporder.model;

import java.util.List;

public interface ShopOrderDAO_interface {

	//���o�q��s���̪��Ҧ��ӫ~
	public List<ShopOrderVO> getAllByOrderNo(String orderno);
	//���o�q�ʸӰӫ~�s�����Ҧ��H����
	public List<ShopOrderVO> getOneByItemNo(Integer pk);
	//���o�ӷ|�����ʶR���ӫ~
	public List<ShopOrderVO> getOneByMenNO(String menno);
	//���o�Ҧ����q��&�������|��
	public List<ShopOrderVO>getAllOrder();
	//�s�W�ӫ~�Ω���
	public void addShopOrder(ShopOrderVO shoporderVO);
	//��s�q��
	public List<ShopOrderVO> updateShopOrder();
	
}
