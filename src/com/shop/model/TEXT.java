package com.shop.model;

import java.util.List;

public class TEXT {

	public static void main(String[] args) {

		ShopService sss= new ShopService();
		List s=sss.getAll();
				System.out.println(s);
	}

}
