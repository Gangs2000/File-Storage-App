package com.amazon.S3Storage.Controller;

import com.amazon.S3Storage.Service.AWSS3Service;
import com.amazon.S3Storage.Service.MongoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class DeleteFileController {

    @Autowired MongoService mongoService;
    @Autowired AWSS3Service awss3Service;

    @GetMapping("/delete-mongo-file/fileId/{id}")
    public String deleteMongoFile(@PathVariable("id") String fileId){
        return mongoService.deleteMongoFileById(fileId);
    }

    @GetMapping("/delete-s3-file/fileId/{id}")
    public String deleteS3File(@PathVariable("id") String fileId){
        return awss3Service.deleteFileById(fileId);
    }
}
