package com.example.vitabuddy.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.example.vitabuddy.model.SupplementVO;

public interface ISupplementDAO {
	
	//영양제 전체보기 (상점페이지 처음 들어갔을 때-태그 적용안된 디폴트값)
	public ArrayList<SupplementVO> getAllSupplements();
	
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
	//pagination test코드
	public int countSupplements();
	
	//pagination test코드 2
	//public ArrayList<SupplementVO> selectSupplementsByPage(int start, int pageSize);
	//public ArrayList<SupplementVO> selectSupplementsWithPagination(int size, int offset);
	public ArrayList<SupplementVO> pagingList(Map<String, Integer> pagingParams);
		
	
	
}
