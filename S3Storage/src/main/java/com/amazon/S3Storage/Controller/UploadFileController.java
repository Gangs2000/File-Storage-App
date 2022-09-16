package com.amazon.S3Storage.Controller;

import com.amazon.S3Storage.Service.AWSS3Service;
import com.amazon.S3Storage.Service.MongoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class UploadFileController {

    @Autowired MongoService mongoService;
    @Autowired AWSS3Service awss3Service;

    @PostMapping(path="/uploadToMongo", consumes = {"application/x-www-form-urlencoded","multipart/form-data"})
    public ModelAndView uploadFileToMongo(@RequestParam("fileName") String fileName, @RequestParam("uploadedFile") MultipartFile file, HttpSession session) throws IOException {
        return mongoService.uploadFileToMongo(fileName, file, session);
    }

    @PostMapping(path="/uploadToS3", consumes = {"application/x-www-form-urlencoded","multipart/form-data"})
    public ModelAndView uploadFileToAWSS3(@RequestParam("fileName") String fileName, @RequestParam("uploadedFile") MultipartFile file, HttpSession session) throws IOException {
        return awss3Service.uploadFileToS3(fileName, file, session);
    }
}
