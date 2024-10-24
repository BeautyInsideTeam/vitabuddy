package com.example.vitabuddy.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.vitabuddy.model.WishListVO;
import com.example.vitabuddy.service.IWishListService;

@Controller
@RequestMapping("/supplement/wishList")
public class WishListController {

    @Autowired
    private IWishListService wishListService;

    // 1. 찜 목록 조회
    @GetMapping("/{userId}")
    public String getWishList(@PathVariable("userId") String userId, Model model) {
        ArrayList<WishListVO> wishList = wishListService.getWishList(userId);
        model.addAttribute("wishList", wishList);
        return "wishlist";  
    }

    // 2. 찜 목록에 상품 추가
    @PostMapping("/add")
    @ResponseBody
    public void addWishList(@RequestBody WishListVO wishListVO) {
        wishListService.insertWishList(wishListVO);
    }

    // 3. 찜 목록에서 상품 삭제
    @PostMapping("/delete")
    @ResponseBody
    public void deleteWishList(@RequestBody WishListVO wishListVO) {
        wishListService.deleteWishList(wishListVO);
    }
}
