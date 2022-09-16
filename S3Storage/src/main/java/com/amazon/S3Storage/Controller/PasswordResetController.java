package com.amazon.S3Storage.Controller;

import com.amazon.S3Storage.Service.MongoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class PasswordResetController {

    @Autowired MongoService mongoService;

    @PostMapping(path="/updatePin", consumes = "application/x-www-form-urlencoded")
    public ModelAndView updatedNewPin(HttpServletRequest request){
        return mongoService.updateNewPassword(request);
    }
}
