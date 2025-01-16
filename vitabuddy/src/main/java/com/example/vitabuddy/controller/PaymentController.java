package com.example.vitabuddy.controller;

import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/payment")
public class PaymentController {

    @GetMapping("/success")
    public String successPayment(
            @RequestParam("paymentKey") String paymentKey,
            @RequestParam("orderId") String orderId,
            @RequestParam("amount") Long amount,
            Model model
    ) {
        // 승인 API 호출
        String result = approvePayment(paymentKey, orderId, amount);
        if (result.startsWith("결제 승인 실패")) {
            model.addAttribute("error", result);
            return "supplement/orderForm"; // 결제 실패 시 orderForm.jsp로 이동
        }
        model.addAttribute("message", "결제가 성공적으로 완료되었습니다.");
        return "supplement/orderComplete"; // 결제 성공 시 orderComplete.jsp로 이동
    }

    private String approvePayment(String paymentKey, String orderId, Long amount) {
        final String SECRET_KEY = "test_sk_6BYq7GWPVveZKQODaAgw3NE5vbo1";
        String url = "https://api.tosspayments.com/v1/payments/confirm";

        Map<String, Object> requestBody = new HashMap<>();
        requestBody.put("paymentKey", paymentKey);
        requestBody.put("orderId", orderId);
        requestBody.put("amount", amount);

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBasicAuth(SECRET_KEY, "");

        HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestBody, headers);

        try {
            ResponseEntity<String> response = restTemplate.exchange(
                    url,
                    HttpMethod.POST,
                    requestEntity,
                    String.class
            );
            return response.getBody();
        } catch (Exception e) {
            e.printStackTrace();
            return "결제 승인 실패: " + e.getMessage();
        }
    }

    @GetMapping("/fail")
    public String failPayment(Model model) {
        model.addAttribute("error", "결제가 실패하였습니다. 다시 시도해주세요.");
        return "supplement/orderForm"; // 결제 실패 시 orderForm.jsp에 머무르기
    }
}
