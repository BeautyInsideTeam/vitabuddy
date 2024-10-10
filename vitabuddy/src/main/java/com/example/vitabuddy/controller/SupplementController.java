package com.example.vitabuddy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.vitabuddy.model.SupplementVO;
import com.example.vitabuddy.service.SupplementService;

@Controller
public class SupplementController {
	
	@Autowired 
	SupplementService supplementService;
	
	/*@RequestMapping("/product/prdList")
	public String prdList() {
		return "supplement/productCtgListView";
	}*/
	
	//brand 태그 목록 출력
	@RequestMapping("/supplements/brands")
	public String getBrands(Model model){
		ArrayList<SupplementVO> brands = supplementService.getAllBrands();
		 
		//출력 테스트 완료
	    System.out.println("브랜드 목록 출력:" + brands);
	    for (SupplementVO brand : brands) {
	        System.out.println(brand.getSupBrand());  // 각 SupplementVO의 supBrand 값 출력
	    }
		model.addAttribute("brands", brands);
		//System.out.println("브랜드 목록 출력:" + model);
        return "supplement/productList"; // 브랜드 목록을 JSON 형식으로 반환
	}
	
	//function 태그 목록 출력
	@RequestMapping("/supplements/functions")
	public String getfunctions(Model model){
		ArrayList<SupplementVO> functions = supplementService.getAllFunctions();
		
		//test 출력
		System.out.println("브랜드 목록 출력:" + functions);
	    for (SupplementVO function : functions) {
	        System.out.println(function.getFunction());  // 각 SupplementVO의 supBrand 값 출력
	    }
		model.addAttribute("functions", functions);  //테스트출력
		//System.out.println("기능 목록 출력:" + model);
        return "supplement/productList"; // 브랜드 목록을 JSON 형식으로 반환
	}
	

	//ingredients 태그 목록 출력 - 아직 안함 (DB 구성 안됨)
	@RequestMapping("/supplements/ingredients")
	public String getingredients(Model model){
		ArrayList<SupplementVO> ingredients = supplementService.getAllIngredients();
		
		//test출력
		System.out.println("성분 목록 출력:" + ingredients);
	    for (SupplementVO ingredient : ingredients) {
	        System.out.println(ingredient.getIngredient());  // 각 SupplementVO의 supBrand 값 출력
	    }
		model.addAttribute("ingredients", ingredients);  //테스트출력
		//System.out.println("기능 목록 출력:" + model);
        return "supplement/productList"; // 브랜드 목록을 JSON 형식으로 반환
	}
	
	//------------------------------------------------------
	//상품리스트 출력 (처음 상점 페이지로 들어갔을 때) 
	@RequestMapping("/product/prdList")
	public String supplementListView(Model model) {
		ArrayList<SupplementVO> supplements = supplementService.getAllSupplements();
		System.out.println("영양제 정보 출력");
		
		//test 출력
	    for (SupplementVO supplement : supplements) {
	        System.out.println(supplement);  // 각 SupplementVO의 supBrand 값 출력
	    }
	    
	    model.addAttribute("supplements", supplements);
		return "supplement/productCtgListView";   //일단 실습시간에 진행했던 임시 페이지로 
	}
	
	




}
