package com.example.vitabuddy.service;


import java.util.ArrayList;
import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.vitabuddy.dao.IMemberDAO;
import com.example.vitabuddy.dao.ISupplementDAO;
import com.example.vitabuddy.model.SupplementVO;

@Service
public class SupplementService implements ISupplementService {
	@Autowired
	@Qualifier("ISupplementDAO")
	ISupplementDAO dao;
	
	@Autowired
	PasswordEncoder pwdEncoder;
	
	//-----------------------------------------------------------
	//모든 영양제 출력 - 상점 페이지 최초 접속 시
	@Override
	public ArrayList<SupplementVO> getAllSupplements() {
		ArrayList<SupplementVO> supplements = dao.getAllSupplements(); 
		
		for (SupplementVO supplement : supplements) {
		    try {
		        if (supplement.getSupImg() != null) {
		            String base64Img = Base64.getEncoder().encodeToString(supplement.getSupImg());
		            supplement.setBase64SupImg(base64Img); // Base64로 인코딩된 이미지 설정
		        }
		    } catch (Exception e) {
		        System.out.println("Error encoding image for supplement: " + supplement.getSupName());
		        e.printStackTrace();
		    }
		}

		
		return supplements;
	}
	
	//-----------------------------------------------------------
	//브랜드, 기능, 성분 해시태그

	@Override
	public ArrayList<String> getFunctionTags() {
		
		return dao.getFunctionTags();
	}
	@Override
	public ArrayList<String> getIngredientTags() {
		
		return dao.getIngredientTags();
	}
	@Override
	public ArrayList<String> getBrandTags() {
		
		return dao.getBrandTags();
	}
	

	//-----------------------------------------------------------
	//특정 해시태그 1개를 선택하면, 그 해시태그를 가진 상품들을 출력한다
	
	@Override
	public ArrayList<SupplementVO> brandSupplements(String tag) {
		ArrayList<SupplementVO> brandsupplements = dao.brandSupplements(tag); 
		for (SupplementVO brandsupplement : brandsupplements) {
		    try {
		        if (brandsupplement.getSupImg() != null) {
		            String base64Img = Base64.getEncoder().encodeToString(brandsupplement.getSupImg());
		            brandsupplement.setBase64SupImg(base64Img); // Base64로 인코딩된 이미지 설정
		        }
		    } catch (Exception e) {
		        System.out.println("Error encoding image for supplement: " + brandsupplement.getSupName());
		        e.printStackTrace();
		    }
		}
		
		return brandsupplements;

	}
	@Override
	public ArrayList<SupplementVO> functionSupplements(String tag) {
		ArrayList<SupplementVO> functionsupplements = dao.functionSupplements(tag);
		for (SupplementVO functionsupplement : functionsupplements) {
		    try {
		        if (functionsupplement.getSupImg() != null) {
		            String base64Img = Base64.getEncoder().encodeToString(functionsupplement.getSupImg());
		            functionsupplement.setBase64SupImg(base64Img); // Base64로 인코딩된 이미지 설정
		        }
		    } catch (Exception e) {
		        System.out.println("Error encoding image for supplement: " + functionsupplement.getSupName());
		        e.printStackTrace();
		    }
		}
		
		return functionsupplements;
		
	}
	@Override
	public ArrayList<SupplementVO> ingredientSupplements(String tag) {
		ArrayList<SupplementVO> ingredientsupplements = dao.ingredientSupplements(tag);
		for (SupplementVO ingredientsupplement : ingredientsupplements) {
		    try {
		        if (ingredientsupplement.getSupImg() != null) {
		            String base64Img = Base64.getEncoder().encodeToString(ingredientsupplement.getSupImg());
		            ingredientsupplement.setBase64SupImg(base64Img); // Base64로 인코딩된 이미지 설정
		        }
		    } catch (Exception e) {
		        System.out.println("Error encoding image for supplement: " + ingredientsupplement.getSupName());
		        e.printStackTrace();
		    }
		}
		return ingredientsupplements;
		
	}



	//-----------------------------------------------------------
	////키워드 상품 검색 - 상점 페이지 상단에 있는 검색창
	
	@Override
	public ArrayList<SupplementVO> searchbysupKeyword(String keyword) {
		ArrayList<SupplementVO> keywordsupplements = dao.searchbysupKeyword(keyword);
		for (SupplementVO keywordsupplement : keywordsupplements) {
		    try {
		        if (keywordsupplement.getSupImg() != null) {
		            String base64Img = Base64.getEncoder().encodeToString(keywordsupplement.getSupImg());
		            keywordsupplement.setBase64SupImg(base64Img); // Base64로 인코딩된 이미지 설정
		        }
		    } catch (Exception e) {
		        System.out.println("Error encoding image for supplement: " + keywordsupplement.getSupName());
		        e.printStackTrace();
		    }
		}
		return keywordsupplements;
	}
	
    
}
	
	

	
	
	


