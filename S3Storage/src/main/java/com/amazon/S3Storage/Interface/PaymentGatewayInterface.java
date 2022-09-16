package com.amazon.S3Storage.Interface;

import com.razorpay.RazorpayException;

import javax.servlet.http.HttpSession;
import java.util.Map;

public interface PaymentGatewayInterface {
    String createOrderDetailsForLincense(Map<String,Object> mapper, HttpSession session) throws RazorpayException;
    String updatePaymentDetailsForLicense(Map<String, Object> mapper, HttpSession session) throws RazorpayException;
    String createOrderDetailsForStorageExpand(Map<String,Object> mapper, HttpSession session) throws RazorpayException;
    String updatePaymentDetailsForStorageExpand(Map<String, Object> mapper, HttpSession session) throws RazorpayException;
}
