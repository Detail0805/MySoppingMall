
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import com.shop.model.*;
public class Test {

	public static void main(String[] args) {
		
		System.out.println(new java.sql.Date(1508170997424L));
		System.out.println(new java.sql.Date(1871222400L));

		System.out.println(new java.sql.Date(System.currentTimeMillis()));
		System.out.println(new java.sql.Date(System.currentTimeMillis()).getTime());
		
		ShopVO shopvo;
		ShopVO shopvo2;
		
		Vector<ShopVO> list =new Vector<ShopVO>();
		Vector<ShopVO> list2 =new Vector<ShopVO>();
		ArrayList<String> words = new ArrayList<String>();
		
		for(int i=0;i<5;i++){
			shopvo=new ShopVO();
			shopvo.setDES("測試"+i);
			shopvo.setITEMNO(0);
			list.add(shopvo);
			list.setElementAt(shopvo, i);
		}
		System.out.println(list.get(1).getDES());
		shopvo2=new ShopVO();
		shopvo2.setDES("測試0");
		shopvo2.setITEMNO(0);
		
		System.out.println(list.removeElement(shopvo2));
		System.out.println(list.size());
		System.out.println(list.get(0));
		System.out.println(list.get(1));
		System.out.println(list.get(2));
		System.out.println(list.get(3));
		System.out.println(list.get(4));
		//刪除成功
	}

}
