package com.example.vitabuddy.controller;

import com.example.vitabuddy.model.ReviewVO;
import com.example.vitabuddy.model.SupplementDetailVO;
import com.example.vitabuddy.service.ReviewService;
import com.example.vitabuddy.service.SupplementDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Base64;
import java.util.List;

@Controller
@RequestMapping("/api/supplement")
public class SupplementDetailController {

	@Autowired
	private SupplementDetailService supplementDetailService;

	@Autowired
	private ReviewService reviewService;

	// 상품상세정보 출력
	@GetMapping("/supplementDetail/{id}")
	public String getSupplementDetail( @PathVariable("id") int supplementDetailId, 
									   @RequestParam(value = "page", required = false, defaultValue = "1") 
									   int page, Model model) {
		// 1. 해당 ID에 맞는 영양제 상세 정보 조회
		SupplementDetailVO supplementDetail = supplementDetailService.getSupplementDetailById(supplementDetailId);

		// 2. 이미지 처리 (Base64 인코딩)
		if (supplementDetail.getSupImg() != null) {
			String base64Image = Base64.getEncoder().encodeToString(supplementDetail.getSupImg());
			model.addAttribute("supImgBase64", base64Image);
		} else {
			model.addAttribute("supImgBase64", ""); // 이미지가 없는 경우 빈 문자열
		}

		// 3. 리뷰 페이지네이션 처리
		int pageLimit = 3; // 한 페이지에 표시할 리뷰 개수
		int totalReviews = reviewService.countReviews(supplementDetailId);
		int totalPages = (int) Math.ceil((double) totalReviews / pageLimit);

		// 현재 페이지에 해당하는 리뷰 목록 가져오기
		List<ReviewVO> reviews = reviewService.pagingReviewList(supplementDetailId, page);
		model.addAttribute("reviewList", reviews);
		model.addAttribute("totalReviews", totalReviews);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);

		// 4. 영양제 상세 정보를 모델에 추가
		model.addAttribute("supplementDetail", supplementDetail);

		// 5. 상위 2개 해시태그 출력
		List<ReviewVO> topHashtags = reviewService.getHashtagsByReview(supplementDetailId);
		model.addAttribute("topHashtags", topHashtags);

		// 6. supplementDetail.jsp 뷰로 이동
		return "supplement/supplementDetail";
	}

}