package com.amazon.S3Storage.Controller;

import com.amazon.S3Storage.Document.Account;
import com.amazon.S3Storage.Repository.AccountRepository;
import com.amazon.S3Storage.Service.AWSS3Service;
import com.amazon.S3Storage.Service.MongoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;

@Controller
public class RouteController {

    ModelAndView mv;
    @Autowired
    Account account;
    @Autowired AccountRepository accountRepository;
    @Autowired MongoService mongoService;
    @Autowired AWSS3Service awss3Service;

    @GetMapping("/")
    public ModelAndView landingPage(HttpSession session){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        mv=new ModelAndView("landingPage.jsp");
        mv.addObject("data",accountRepository.findById(auth.getName()).get());
        session.setAttribute("sessionValue",auth.getName());                                           //Email Session Value
        account=accountRepository.findById(auth.getName()).get();
        session.setAttribute("maximumStorage",account.getMaximumStorageSize()/1000000);             //Maximum Storage size session value which is 500MB during initial account
        DecimalFormat decimalFormat = new DecimalFormat("#.00");
        float kBToMB=(float) ((account.getCurrentStorageSize())/1024)/1024;
        session.setAttribute("currentStorage",Float.valueOf(decimalFormat.format(kBToMB)));
        float percentageScale=(float) (account.getCurrentStorageSize()*100)/account.getMaximumStorageSize();
        session.setAttribute("percentageScale",Float.valueOf(decimalFormat.format(percentageScale)));   //First multiplying current storage space with 100 and divided by maximum storage space which resulting the percentage value between ( 0-100 )
        return mv;
    }

    @GetMapping("/login")
    public String loginPage(){
        return "login.jsp";
    }

    @GetMapping("/register-account")
    public String registerAccount(){
        return "registration.jsp";
    }

    @GetMapping("/forgot-password")
    public String forgotPassword(){
        return "forgotPassword.jsp";
    }

    @GetMapping("/service")
    public String serviceRequest(){
        return "redirect:/";
    }

    @GetMapping("/upload-mongo")
    public String uploadMongoRequest(){
        return "uploadToMongo.jsp";
    }

    @GetMapping("/upload-s3")
    public ModelAndView uploadS3Request(HttpSession session){
        return (accountRepository.findById(session.getAttribute("sessionValue").toString()).get().isAWSAccessGranted())
                ?(new ModelAndView("uploadToS3.jsp")):
                (new ModelAndView("/status/awsS3Payment.jsp"));
    }

    @GetMapping("/download-mongo")
    public ModelAndView downloadMongoRequest(HttpSession session){
        return mongoService.renderingPageForDownloadMongoFile(session);
    }

    @GetMapping("/download-s3")
    public ModelAndView downloadS3Request(HttpSession session){
        return awss3Service.renderingPageForDownloadS3File(session);
    }

    @GetMapping("/delete-mongo")
    public ModelAndView deleteMongoFileRequest(HttpSession session){
        return mongoService.renderingPageForDeleteMongoFile(session);
    }

    @GetMapping("/delete-s3")
    public ModelAndView deleteS3FileRequest(HttpSession session){
        return awss3Service.renderingPageForDeleteS3File(session);
    }

    @GetMapping("/existing-profile")
    public ModelAndView updateProfile(HttpSession session){
        mv=new ModelAndView("updateProfile.jsp");
        mv.addObject("data",accountRepository.findById(session.getAttribute("sessionValue").toString()).get());
        return mv;
    }

    @GetMapping("/logout-success")
    public String logoutSuccess(){
        return "logout.jsp";
    }
}
