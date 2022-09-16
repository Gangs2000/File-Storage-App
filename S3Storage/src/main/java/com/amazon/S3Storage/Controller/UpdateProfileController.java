package com.amazon.S3Storage.Controller;

import com.amazon.S3Storage.Service.MongoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UpdateProfileController {

    @Autowired MongoService mongoService;

    @PostMapping(path="/update-profile", consumes = "application/x-www-form-urlencoded")
    public ModelAndView updateProfile(HttpServletRequest request, HttpSession session){
        return mongoService.updateProfile(request, session);
    }
}
