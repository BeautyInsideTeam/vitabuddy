package com.example.vitabuddy.service;

import java.util.ArrayList;
import java.util.List;

import com.example.vitabuddy.model.SupplementVO;


public interface ISupplementService {

	//영양제 전체 출력 (상점페이지 처음 들어갔을 때-태그 적용안된 디폴트값)
	public ArrayList<SupplementVO> getAllSupplements();
	
	//pagination test코드
	public int countSupplements();
	
	//pagination test코드 2
	//public ArrayList<SupplementVO> getSupplementsByPage(int page, int size);
	public ArrayList<SupplementVO> pagingList(int page);
	
	
	//태그 목록 출력
	public ArrayList<String> getFunctionTags();
	public ArrayList<String> getIngredientTags();
	public ArrayList<String> getBrandTags();

	
	//특정 해시태그 1개를 선택하면, 그 해시태그를 가진 상품들을 출력
	public ArrayList<SupplementVO> brandSupplements(String decodedTag);  //브랜드 해당 해시태그
	public ArrayList<SupplementVO> functionSupplements(String decodedTag);  //기능 해당 해시태그
	public ArrayList<SupplementVO> ingredientSupplements(String decodedTag);  //성분 해당 해시태그

	
	//키워드 상품 검색 - 상점 페이지 상단에 있는 검색창
	public ArrayList<SupplementVO> searchbysupKeyword(String keyword);
	
	
	
	
}
