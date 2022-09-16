package com.amazon.S3Storage.Service;

import com.amazon.S3Storage.Document.Account;
import com.amazon.S3Storage.Document.PaymentInfo;
import com.amazon.S3Storage.Interface.PaymentGatewayInterface;
import com.amazon.S3Storage.Repository.AccountRepository;
import com.amazon.S3Storage.Repository.PaymentGatewayRepository;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Service
public class PaymentGatewayService implements PaymentGatewayInterface {

    @Autowired Account account;
    @Autowired AccountRepository accountRepository;
    @Autowired PaymentInfo paymentInfo;
    @Autowired PaymentGatewayRepository paymentGatewayRepository;
    @Autowired PaymentGatewayInterface paymentGatewayInterface;

    @Override
    public String createOrderDetailsForLincense(Map<String, Object> mapper, HttpSession session) throws RazorpayException {
        RazorpayClient razorpayClient=new RazorpayClient("********************************","********************************");
        int amount=Integer.valueOf(mapper.get("amount").toString());
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("amount",amount*100);
        jsonObject.put("currency","INR");
        Order order=razorpayClient.orders.create(jsonObject);
        paymentInfo.set_id(order.get("id"));
        paymentInfo.setAmount(100);
        paymentInfo.setCurrencyType("INR");
        paymentInfo.setOrderStatus(order.get("status"));
        paymentInfo.setNoOfAttempts(order.get("attempts"));
        paymentInfo.setUserEmailId(session.getAttribute("sessionValue").toString());
        paymentInfo.setTimestamp(order.get("created_at"));
        paymentGatewayRepository.save(paymentInfo);
        return order.toString();
    }

    @Override
    public String updatePaymentDetailsForLicense(Map<String, Object> mapper, HttpSession session) throws RazorpayException {
        RazorpayClient razorpayClient=new RazorpayClient("********************************","********************************");
        paymentInfo=paymentGatewayRepository.findById(mapper.get("orderId").toString()).get();
        Order order=razorpayClient.orders.fetch(mapper.get("orderId").toString());
        paymentInfo.setNoOfAttempts(order.get("attempts"));
        paymentInfo.setOrderStatus(order.get("status"));
        paymentGatewayRepository.save(paymentInfo);
        account=accountRepository.findById(session.getAttribute("sessionValue").toString()).get();
        account.setAWSAccessGranted(true);
        accountRepository.save(account);
        return "License Granted - Payment Details updated in DB successfully..";
    }

    @Override
    public String createOrderDetailsForStorageExpand(Map<String, Object> mapper, HttpSession session) throws RazorpayException {
        return paymentGatewayInterface.createOrderDetailsForLincense(mapper, session);
    }

    @Override
    public String updatePaymentDetailsForStorageExpand(Map<String, Object> mapper, HttpSession session) throws RazorpayException {
        RazorpayClient razorpayClient=new RazorpayClient("********************************","********************************");
        paymentInfo=paymentGatewayRepository.findById(mapper.get("orderId").toString()).get();
        Order order=razorpayClient.orders.fetch(mapper.get("orderId").toString());
        paymentInfo.setNoOfAttempts(order.get("attempts"));
        paymentInfo.setOrderStatus(order.get("status"));
        paymentGatewayRepository.save(paymentInfo);
        account=accountRepository.findById(session.getAttribute("sessionValue").toString()).get();
        account.setMaximumStorageSize(account.getMaximumStorageSize()+100000000);
        accountRepository.save(account);
        return "Storage Expanded - Payment Details updated in DB successfully..";
    }
}
