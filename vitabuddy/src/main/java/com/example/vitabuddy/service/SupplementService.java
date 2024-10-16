package com.example.vitabuddy.service;


import java.util.ArrayList;

import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

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
	//pagination test 코드
	@Override
	public int countSupplements() {
		// TODO Auto-generated method stub
		return dao.countSupplements();
	}
	
	//pagination test 코드2
	/*@Override
	public ArrayList<SupplementVO> getSupplementsByPage(int page, int size) {
		int offset = (page-1) * size;
		return dao.selectSupplementsWithPagination(size, offset);
	}*/

	@Override
	public ArrayList<SupplementVO> pagingList(int page) {
		/*
		 * 1페이지당 보여지는 글 갯수가 3일 때 (예를 들어)
		 * 1페이지 -> 0
		 * 2페이지 -> 3
		 * 3페이지 -> 6
		 */
		int pageLimit = 12;
		int pagingStart = (page-1) * pageLimit;
		Map<String, Integer> pagingParams = new HashMap<>();
		pagingParams.put("start", pagingStart);
		pagingParams.put("limit", pageLimit);  //map 에 담아서 넘겨준다
		ArrayList<SupplementVO> pagingList = dao.pagingList(pagingParams);
		
		//이미지 출력 코드
		for (SupplementVO supplement : pagingList) {
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
		return pagingList;
	}
	//-----------------------------------------------------------
	@Override
	public int countbrandSupplements(String decodedTag) {
		// TODO Auto-generated method stub
		return dao.countbrandSupplements(decodedTag);
	}
	
	
	@Override
	public ArrayList<SupplementVO> pagingbrandList(String decodedTag, int page) {
		int pageLimit = 12;
		int pagingStart = (page-1) * pageLimit;
		Map<String, Object> pagingParams = new HashMap<>();
		pagingParams.put("decodedTag", decodedTag);
		pagingParams.put("start", pagingStart);
		pagingParams.put("limit", pageLimit);  //map 에 담아서 넘겨준다
		ArrayList<SupplementVO> pagingbrandList = dao.pagingbrandList(pagingParams);
		
		//이미지 출력 코드
		for (SupplementVO supplement : pagingbrandList) {
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
		return pagingbrandList;
	}
	
	@Override
	public int countfunctionSupplements(String decodedTag) {
		return dao.countfunctionSupplements(decodedTag);
	}

	@Override
	public ArrayList<SupplementVO> pagingfunctionList(String decodedTag, int page) {
		int pageLimit = 12;
		int pagingStart = (page-1) * pageLimit;
		Map<String, Object> pagingParams = new HashMap<>();
		pagingParams.put("decodedTag", decodedTag);
		pagingParams.put("start", pagingStart);
		pagingParams.put("limit", pageLimit);  //map 에 담아서 넘겨준다
		ArrayList<SupplementVO> pagingfunctionList = dao.pagingfunctionList(pagingParams);
		
		//이미지 출력 코드
		for (SupplementVO supplement : pagingfunctionList) {
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
		return pagingfunctionList;
	}

	@Override
	public int countingredientSupplements(String decodedTag) {
		return dao.countingredientSupplements(decodedTag);
	}

	@Override
	public ArrayList<SupplementVO> pagingingredientList(String decodedTag, int page) {
		int pageLimit = 12;
		int pagingStart = (page-1) * pageLimit;
		Map<String, Object> pagingParams = new HashMap<>();
		pagingParams.put("decodedTag", decodedTag);
		pagingParams.put("start", pagingStart);
		pagingParams.put("limit", pageLimit);  //map 에 담아서 넘겨준다
		ArrayList<SupplementVO> pagingingredientList = dao.pagingingredientList(pagingParams);
		
		//이미지 출력 코드
		for (SupplementVO supplement : pagingingredientList) {
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
		return pagingingredientList;
	}


	@Override
	public int countkeywordSupplements(String keyword) {
		return dao.countkeywordSupplements(keyword);
	}

	@Override
	public ArrayList<SupplementVO> pagingkeywordList(String keyword, int page) {
		int pageLimit = 12;
		int pagingStart = (page-1) * pageLimit;
		Map<String, Object> pagingParams = new HashMap<>();
		pagingParams.put("keyword", keyword);
		pagingParams.put("start", pagingStart);
		pagingParams.put("limit", pageLimit);  //map 에 담아서 넘겨준다
		ArrayList<SupplementVO> pagingkeywordList = dao.pagingkeywordList(pagingParams);
		
		//이미지 출력 코드
		for (SupplementVO supplement : pagingkeywordList) {
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
		return pagingkeywordList;
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
	
	

	
	
	


