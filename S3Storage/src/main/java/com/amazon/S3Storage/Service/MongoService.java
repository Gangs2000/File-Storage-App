package com.amazon.S3Storage.Service;

import com.amazon.S3Storage.Document.Account;
import com.amazon.S3Storage.Document.FileStorageData;
import com.amazon.S3Storage.Interface.MongoInterface;
import com.amazon.S3Storage.Repository.AccountRepository;
import com.amazon.S3Storage.Repository.FileStorageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;
import java.util.UUID;

@Service
public class MongoService implements MongoInterface {

    ModelAndView mv;
    @Autowired AccountRepository accountRepository;
    @Autowired FileStorageRepository fileStorageRepository;
    @Autowired Account account;
    @Autowired FileStorageData fileStorageData;
    BCryptPasswordEncoder encoder=new BCryptPasswordEncoder(12);

    @Override
    public ModelAndView registerNewAccount(HttpServletRequest request, HttpSession session) {
        mv=new ModelAndView("/status/registrationStatus.jsp");
        if(!accountRepository.existsById(request.getParameter("_id"))){
            account.set_id(request.getParameter("_id"));
            account.setUserName(request.getParameter("userName"));
            account.setPassword(encoder.encode(request.getParameter("password")));
            account.setMobileNumber(Long.valueOf(request.getParameter("mobileNumber")));
            account.setAWSAccessGranted(false);
            account.setSecurityQuestion(request.getParameter("securityQuestion"));
            account.setSecurityAnswer(request.getParameter("securityAnswer"));
            account.setCurrentStorageSize(0);
            account.setMaximumStorageSize(524288000);                               //Initially when new account is created 500MB is alloted for each account..
            accountRepository.save(account);
            mv.addObject("status","Account has been registered successfully!!..");
        }
        else
            mv.addObject("status","Email ID is already registered..");
        return mv;
    }

    @Override
    public ModelAndView updateNewPassword(HttpServletRequest request) {
        if(accountRepository.existsById(request.getParameter("emailId"))){
            account=accountRepository.findById(request.getParameter("emailId")).get();
            if(account.getSecurityQuestion().equals(request.getParameter("securityQuestion"))){
                if(account.getSecurityAnswer().equals(request.getParameter("securityAnswer"))){
                    mv=new ModelAndView("/status/forgotPasswordStatus.jsp");
                    account.setPassword(encoder.encode(request.getParameter("password")));
                    accountRepository.save(account);
                    mv.addObject("status","Password has been updated in Database..");
                }
                else {
                    mv=new ModelAndView("/status/forgotPasswordStatus.jsp");
                    mv.addObject("status","Invalid Request!!");
                }
            }
            else{
                mv=new ModelAndView("/status/forgotPasswordStatus.jsp");
                mv.addObject("status","Invalid Request!!");
            }
        }
        else {
            mv=new ModelAndView("/status/forgotPasswordStatus.jsp");
            mv.addObject("status","Invalid Request!!");
        }
        return mv;
    }

    @Override
    public ModelAndView uploadFileToMongo(String fileName, MultipartFile file, HttpSession session) throws IOException {
        account=accountRepository.findById(session.getAttribute("sessionValue").toString()).get();
        if(account.getCurrentStorageSize()+ file.getSize()<=account.getMaximumStorageSize()) {              //If the file size less than the maximum storage space then it performs storage operation
            mv = new ModelAndView("/status/uploadFileStatus.jsp");
            fileStorageData.setId(UUID.randomUUID().toString());
            fileStorageData.setFileName(fileName);
            fileStorageData.setOriginalFileName(file.getOriginalFilename());
            fileStorageData.setUploadedFile(file.getBytes());
            fileStorageData.setUploadedBy(session.getAttribute("sessionValue").toString());
            fileStorageData.setPlatform("MONGO-ATLAS");
            fileStorageData.setFileType(file.getContentType());
            fileStorageData.setFileSize(file.getSize());
            fileStorageRepository.save(fileStorageData);
            account.setCurrentStorageSize(account.getCurrentStorageSize()+file.getSize());                  //Once file details updated in DB need to update current storage space and save the same in account document
            accountRepository.save(account);
        }
        else {                                                                                              //Else it will return Storage not available page..
            System.out.println("Running Out of Space in Mongo..");
            mv = new ModelAndView("/status/runningOutOfStorage.jsp");
        }
        return mv;
    }

    @Override
    public ModelAndView renderingPageForDownloadMongoFile(HttpSession session) {
        List<FileStorageData> fileStorageDataList=fileStorageRepository.findByUploadedByAndPlatform(session.getAttribute("sessionValue").toString(),"MONGO-ATLAS");
        if(fileStorageDataList.size()==0)
            mv=new ModelAndView("/status/noMongoFile.jsp");
        else {
            mv = new ModelAndView("downloadFromMongo.jsp");
            mv.addObject("downloadFiles", fileStorageDataList);
        }
        return mv;
    }

    @Override
    public FileStorageData downloadFileById(String fileId) {
        return fileStorageRepository.findById(fileId).get();
    }

    @Override
    public ModelAndView renderingPageForDeleteMongoFile(HttpSession session) {
        List<FileStorageData> fileStorageDataList=fileStorageRepository.findByUploadedByAndPlatform(session.getAttribute("sessionValue").toString(),"MONGO-ATLAS");
        if(fileStorageDataList.size()==0)
            mv=new ModelAndView("/status/noMongoFile.jsp");
        else {
            mv=new ModelAndView("deleteMongoFile.jsp");
            mv.addObject("editFiles",fileStorageDataList);
        }
        return mv;
    }

    @Override
    public String deleteMongoFileById(String fileId) {
        fileStorageData=fileStorageRepository.findById(fileId).get();
        account=accountRepository.findById(fileStorageData.getUploadedBy()).get();
        fileStorageRepository.deleteById(fileId);
        account.setCurrentStorageSize(account.getCurrentStorageSize()- fileStorageData.getFileSize());
        accountRepository.save(account);
        return "redirect:/delete-mongo";
    }

    @Override
    public ModelAndView updateProfile(HttpServletRequest request, HttpSession session) {
        mv=new ModelAndView("updateProfile.jsp");
        account=accountRepository.findById(session.getAttribute("sessionValue").toString()).get();
        account.setUserName(request.getParameter("userName"));
        account.setMobileNumber(Long.valueOf(request.getParameter("mobileNumber")));
        account.setSecurityQuestion(request.getParameter("securityQuestion"));
        account.setSecurityAnswer(request.getParameter("securityAnswer"));
        account=accountRepository.save(account);
        mv.addObject("data",account);
        return mv;
    }
}
