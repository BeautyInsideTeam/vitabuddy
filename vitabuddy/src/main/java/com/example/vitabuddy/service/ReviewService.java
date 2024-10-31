package com.example.vitabuddy.service;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.vitabuddy.dao.IReviewDAO;
import com.example.vitabuddy.model.ReviewVO;
import com.example.vitabuddy.model.SupplementStoreVO;

@Service
public class ReviewService implements IReviewService {

	@Autowired
	@Qualifier("IReviewDAO")
	IReviewDAO dao;

	// 특정 제품에 대한 리뷰 조회 기능
	@Override
	public List<ReviewVO> reviewLists(int supId) {
		return dao.reviewLists(supId);
	}

	// 리뷰 작성 기능
	@Override
	public int insertReview(ReviewVO review) {
		return dao.insertReview(review);
	}

	// 리뷰 삭제 기능
	@Override
	public int deleteReview(String reviewNo, String userId) {
		return dao.deleteReview(reviewNo, userId);
	}

	// 리뷰 수정 기능
	@Override
	public int updateReview(ReviewVO review) {
		return dao.updateReview(review);
	}

	// 리뷰 번호를 통한 리뷰 조회
	@Override
	public ReviewVO getReviewByNo(String reviewNo) {
		return dao.getReviewByNo(reviewNo);
	}

	// 특정 사용자에 대한 리뷰 조회 기능
	public List<ReviewVO> getUserReviews(String userId) {
		return dao.getReviewsByUserId(userId);
	}

	// 브랜드별 리뷰순 상품 출력 기능
	@Override
	public List<SupplementStoreVO> getTopSupplementsByBrand() {
		List<SupplementStoreVO> supplements = dao.getTopSupplementsByBrand();

		for (SupplementStoreVO supplement : supplements) {
			try {
				if (supplement.getSupImg() != null) {
					String base64Image = Base64.getEncoder().encodeToString(supplement.getSupImg());
					supplement.setBase64SupImg(base64Image);
				} else {
					System.out.println("No image found for SupID " + supplement.getSupId());
				}
			} catch (Exception e) {
				System.err.println("Error fetching image for SupID: " + supplement.getSupId() + " - " + e.getMessage());
				e.printStackTrace();
			}
		}
		return supplements;
	}

	// 상위 2개 해시태그 출력
	@Override
	public List<ReviewVO> getHashtagsByReview(int supId) {
		return dao.getHashtagsByReview(supId);
	}

	// 특정 상품별 리뷰 개수를 반환하는 메서드
		@Override
		public int countReviews(int supId) {
			return dao.countReviews(supId);
		}

		// 특정 상품별 페이지네이션을 통한 리뷰 목록 조회 메서드
		@Override
		public ArrayList<ReviewVO> pagingReviewList(int supId, int page) {
			int pageLimit = 3; // 한 페이지에 표시할 리뷰 개수
			int pagingStart = (page - 1) * pageLimit; // 시작 인덱스 계산

			// 파라미터 설정
			Map<String, Integer> pagingParams = new HashMap<>();
			pagingParams.put("supId", supId);
			pagingParams.put("start", pagingStart);
			pagingParams.put("limit", pageLimit);
			ArrayList<ReviewVO> pagingReview = dao.pagingReviewList(pagingParams);
			// DAO 호출
			return pagingReview;
		}

}
