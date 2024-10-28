package com.example.vitabuddy.service;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.vitabuddy.dao.ICartListDAO;
import com.example.vitabuddy.model.CartListVO;
import com.example.vitabuddy.model.OrderInfoVO;


@Service
public class CartListService implements ICartListService {
	
	@Autowired 
	@Qualifier("ICartListDAO")
	ICartListDAO dao;
	
	 @Autowired
	 PasswordEncoder pwdEncoder;

	@Override
	public ArrayList<CartListVO> cartList(String userId) {
		
		ArrayList<CartListVO> cartLists = dao.cartList(userId);
		
		for (CartListVO cartList : cartLists) {
		    try {
		        if (cartList.getSupImg() != null) {
		            String base64Img = Base64.getEncoder().encodeToString(cartList.getSupImg());
		            cartList.setBase64SupImg(base64Img); // Base64로 인코딩된 이미지 설정
		        }
		    } catch (Exception e) {
		        System.out.println("Error encoding image for supplement: " + cartList.getSupName());
		        e.printStackTrace();
		    }
		}
		
		
		return cartLists; 
	}

	@Override
	public int checkSupInCart(int supId, String userId) {
		HashMap<String, Object> map = new HashMap<>();
	    map.put("supId", supId);   // int 타입인 supId
	    map.put("userId", userId); // String 타입인 userId
		int count = dao.checkSupInCart(map);
		return count;
	}

	@Override
	public void addCartList(CartListVO vo) {
		dao.addCartList(vo);
		
	}

	@Override
	public void updateQtyInCart(CartListVO vo) {
		dao.updateQtyInCart(vo);
		
	}

	@Override
	public int deleteCart(String cartId) {
		
		return dao.deleteCart(cartId);
	}
	
	@Override
	public void changeQtyInCart(int cartId, int qty) {
		HashMap<String, Object> map = new HashMap<>();
	    map.put("cartId", cartId);   
	    map.put("qty", qty); 
		dao.changeQtyInCart(map);
		
	}


	
	//--------------주문 정보 로직-------------------
	@Override
	public void insertOrderInfo(OrderInfoVO vo) {
		//orderForm.jsp 에서 [주문 상품] & [주문자 정보(배송정보)] -> 분리하기
		
		//1. 주문자 업데이트 (OrderInfo테이블)
		dao.insertOrderInfo(vo);
		
		
		//2. 주문상품 업데이트 (OrderProduct테이블)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("orderId", vo.getOrderId());
		map.put("userId", vo.getUserId());
		dao.insertOrderProduct(map);
		
		//주문 완료 후, 장바구니에 있는 데이터 삭제
		dao.deleteCartAfterOrder(vo.getUserId());

		
		
	}
	
	
	
	
	
	 
	 

	

}