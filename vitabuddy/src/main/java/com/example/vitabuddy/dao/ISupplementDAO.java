package com.example.vitabuddy.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.example.vitabuddy.model.SupplementVO;

public interface ISupplementDAO {
	
	//브랜드 태그(6개), 기능 태그(15개), 성분 태그
	public ArrayList<String> getBrandTags();
	public ArrayList<String> getFunctionTags();
	public ArrayList<String> getIngredientTags();

	
	//특정 해시태그 1개를 선택하면, 그 해시태그를 가진 상품들을 출력한다
	public ArrayList<SupplementVO> brandSupplements(String tag);  //브랜드 해당 해시태그
	public ArrayList<SupplementVO> functionSupplements(String tag);  //기능 해당 해시태그
	public ArrayList<SupplementVO> ingredientSupplements(String tag);  //성분 해당 해시태그

	
	//키워드 상품 검색 - 상점 페이지 상단에 있는 검색창
	public ArrayList<SupplementVO> searchbysupKeyword(String keyword);
	
	
	//------------------------------------------------------------------
	//전체 상품 페이지네이션
	public int countSupplements();
	public ArrayList<SupplementVO> pagingList(Map<String, Integer> pagingParams);
		
	//[브랜드] 페이지네이션
	public int countbrandSupplements(String decodedTag);
	public ArrayList<SupplementVO> pagingbrandList(Map<String, Object> pagingParams);

	//[기능] 페이지네이션
	public int countfunctionSupplements(String decodedTag); 
	public ArrayList<SupplementVO> pagingfunctionList(Map<String, Object> pagingParams);  //특정 brand 태그 클릭 시, 해당 상품 출력
	
	//[성분] 페이지네이션
	public int countingredientSupplements(String decodedTag); 
	public ArrayList<SupplementVO> pagingingredientList(Map<String, Object> pagingParams); 
	
	//키워드 페이지네이션
	public int countkeywordSupplements(String keyword);  
	public ArrayList<SupplementVO> pagingkeywordList(Map<String, Object> pagingParams);
	
}
