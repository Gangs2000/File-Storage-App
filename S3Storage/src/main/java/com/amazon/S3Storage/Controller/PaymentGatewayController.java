package com.amazon.S3Storage.Controller;

import com.amazon.S3Storage.Service.PaymentGatewayService;
import com.razorpay.RazorpayException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Map;

@RestController
public class PaymentGatewayController {

    @Autowired PaymentGatewayService paymentGatewayService;

    @PostMapping(path="/license/createOrder",consumes = "application/json")
    public String createOrderForLicense(@RequestBody Map<String, Object> mapper, HttpSession session) throws RazorpayException {
        return paymentGatewayService.createOrderDetailsForLincense(mapper, session);
    }

    @PutMapping(path="/license/updatePayment", consumes = "application/json")
    public String updatePaymentDetailsForLicense(@RequestBody Map<String, Object> mapper, HttpSession session) throws RazorpayException {
        return paymentGatewayService.updatePaymentDetailsForLicense(mapper, session);
    }

    @PostMapping(path="/expandStorage/createOrder", consumes = "application/json")
    public String createOrderForExpandStorage(@RequestBody Map<String, Object> mapper, HttpSession session) throws RazorpayException {
        return paymentGatewayService.createOrderDetailsForStorageExpand(mapper, session);
    }

    @PutMapping(path="/expandStorage/updatePayment", consumes = "application/json")
    public String updatePaymentDetailsStorageExpand(@RequestBody Map<String, Object> mapper, HttpSession session) throws RazorpayException {
        return paymentGatewayService.updatePaymentDetailsForStorageExpand(mapper, session);
    }
}
