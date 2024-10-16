package com.example.vitabuddy.controller;

import java.net.URLDecoder;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.vitabuddy.model.SupplementVO;
import com.example.vitabuddy.service.SupplementService;

@Controller
public class SupplementController {
	
	@Autowired 
	SupplementService supplementService;
	
	
	//pagination test
	@GetMapping("/product/prdList")
	public String paging(Model model, @RequestParam(value="page", required=false, defaultValue="1") int page) {
		
		ArrayList<SupplementVO> pagingsupList = supplementService.pagingList(page);
	    int totalSupplements = supplementService.countSupplements();
	    int totalPages = (int) Math.ceil((double) totalSupplements / 12);


		System.out.println("pagingsupList = " + pagingsupList.size());  // (지워도됨) test 출력 12개 잘 나온다
		
		model.addAttribute("pagingsupList", pagingsupList);
		model.addAttribute("totalSupplements", totalSupplements);
		model.addAttribute("totalPages", totalPages);
		
		System.out.println("pagingsupList = " + pagingsupList.size());   // (지워도됨) test출력 
		System.out.println("totalSupplements = " + totalSupplements); 
		System.out.println("totalPages = " + totalPages); 
		
		return "supplement/supplementList"; 
			
	}
	
	
	//-------------태그 리스트 출력; AJAX 통신------------------------------------
	
	//function 태그 목록
	@ResponseBody
	@GetMapping("/api/supplement/functions")
	public ArrayList<String> getFunctionTags(Model model){
		ArrayList<String> functionTags = supplementService.getFunctionTags();
		
		//test출력 - 반환값을 ArrayList<String>으로 했을 때 출력 - "기능 목록 출력:[뼈 건강, 소화기 건강, 면역력 증진, 눈 건강, 피부 건강, 모발 건강, 간 건강, 근육 건강, 미네랄, 철분 보충, 여성 건강, 심혈관 건강, 스트레스 개선, 항산화제, 신경계 건강]"
		System.out.println("기능 태그 출력:" + functionTags);
	    for (String functionTag:functionTags) {
	    	System.out.println (functionTag); 
	    }
	    
		model.addAttribute("functionTags", functionTags); 
		System.out.println("기능 목록 출력:" + model);  //{functions=[뼈 건강, 소화기 건강, 면역력 증진, 눈 건강, 피부 건강, 모발 건강] 형식의 데이터
  
		return functionTags;
	}
	

	
	//ingredients 태그 목록 출력
	@ResponseBody
	@GetMapping("/api/supplement/ingredients")
	public ArrayList<String> getIngredientTags(Model model){
		ArrayList<String> ingredientTags = supplementService.getIngredientTags();
		
		//test출력 
		System.out.println("성분 태그 출력:" + ingredientTags);
	    for (String ingredientTag:ingredientTags) {
	    	System.out.println (ingredientTag); 
	    }
			    
		model.addAttribute("ingredientTags", ingredientTags); 
		System.out.println("성분 태그 출력:" + model);
		
		return ingredientTags;

	}
	
	//brand 태그 목록
	@ResponseBody
	@GetMapping("/api/supplement/brands")
	public ArrayList<String> getBrandTags(Model model){
		ArrayList<String> brandTags = supplementService.getBrandTags();
		 
		//test출력
		System.out.println("기능 태그 출력:" + brandTags);
	    for (String brandTag:brandTags) {
	    	System.out.println (brandTag); 
	    }
		model.addAttribute("brandTags", brandTags);
		return brandTags;
	}
	
	
	//----------------------------------------------------------------------------
	//특정 해시태그 1개를 선택하면, 그 해시태그를 가진 상품들을 출력한다
	@GetMapping("/supplements/tagsearch")
    public String searchSupplements(@RequestParam("category") String category,
                                 @RequestParam("tag") String tag,
                                 Model model) {
		
		System.out.println("태그값 " + tag + " 카테고리값 " + category); //url에 포함된 태그값 출력
		
		//태그 사이 띄어쓰기 : [#간 건강] -> url에서는 [#간%20건강]으로 변환되는 현상 -> 다시 띄어쓰기로 디코딩  
		String decodedTag = URLDecoder.decode(tag, StandardCharsets.UTF_8);  
		
		//[브랜드별] 카테고리에서 해시태그 선택했을 경우
        if (category.equals("brands")) {
        	ArrayList<SupplementVO> brandsupList = supplementService.brandSupplements(decodedTag);
    		System.out.println(decodedTag + " 영양제");
    		model.addAttribute("brandsupList", brandsupList);
    		System.out.println(brandsupList); //test 츨력
    	
        }
        //[기능별] 카테고리에서 해시태그 선택했을 경우
        else if (category.equals("functions")) {
        	ArrayList<SupplementVO> functionsupList = supplementService.functionSupplements(decodedTag);
    		System.out.println(decodedTag + " 영양제");
    		model.addAttribute("functionsupList", functionsupList);
    		System.out.println(functionsupList); //test 츨력
        }
        //[성분별] 카테고리에서 해시태그 선택했을 경우
        else {	
        	ArrayList<SupplementVO> ingredientsupList = supplementService.ingredientSupplements(decodedTag);
    		System.out.println(decodedTag + " 영양제");
    		model.addAttribute("ingredientsupList", ingredientsupList);
    		System.out.println(ingredientsupList); //test 츨력
    		
        }
        
        return "supplement/supplementList"; 
        
    }
	
	@ResponseBody
	@RequestMapping("/search")
	public ArrayList<SupplementVO> searchbysupKeyword(@RequestParam("keyword") String keyword, Model model){
		
		ArrayList<SupplementVO> keywordsupList = supplementService.searchbysupKeyword(keyword);
		
		model.addAttribute("keywordsupList", keywordsupList);  
		System.out.println(keywordsupList.size());  //test 출력
		
		return keywordsupList;
		
	}
	
	
	
	
}

	





