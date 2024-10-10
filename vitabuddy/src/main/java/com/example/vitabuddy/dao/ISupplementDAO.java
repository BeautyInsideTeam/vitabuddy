package com.example.vitabuddy.dao;

import java.util.ArrayList;
import java.util.List;

import com.example.vitabuddy.model.SupplementVO;

public interface ISupplementDAO {
	
	//브랜드 태그(6개), 기능 태그(15개), 성분 태그
	public ArrayList<SupplementVO> getAllBrands();
	public ArrayList<SupplementVO> getAllFunctions();
	public ArrayList<SupplementVO> getAllIngredients();
	
	//영양제 전체보기 (상점페이지 처음 들어갔을 때-태그 적용안된 디폴트값)
	public ArrayList<SupplementVO> getAllSupplements();


	
	
	
}
