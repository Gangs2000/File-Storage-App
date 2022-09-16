package com.amazon.S3Storage.Controller;

import com.amazon.S3Storage.Service.MongoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class RegistrationController {

    @Autowired
    MongoService service;

    @PostMapping(path="/register", consumes = "application/x-www-form-urlencoded")
    public ModelAndView registerNewAccount(HttpServletRequest request, HttpSession session){
        return service.registerNewAccount(request, session);
    }
}
