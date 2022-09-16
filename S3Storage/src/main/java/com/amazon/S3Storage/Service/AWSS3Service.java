package com.amazon.S3Storage.Service;

import com.amazon.S3Storage.Document.Account;
import com.amazon.S3Storage.Document.FileStorageData;
import com.amazon.S3Storage.Interface.AWSS3Interface;
import com.amazon.S3Storage.Repository.AccountRepository;
import com.amazon.S3Storage.Repository.FileStorageRepository;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.*;
import com.amazonaws.util.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class AWSS3Service implements AWSS3Interface {

    ModelAndView mv;
    private final String bucketName="*********************************";
    @Autowired Account account;
    @Autowired FileStorageData fileStorageData;
    @Autowired FileStorageRepository fileStorageRepository;
    @Autowired AccountRepository accountRepository;

    private final AmazonS3 amazonS3;

    public AWSS3Service(AmazonS3 amazonS3) {
        this.amazonS3 = amazonS3;
    }

    @Override
    public ModelAndView uploadFileToS3(String fileName, MultipartFile file, HttpSession session) throws IOException {
        account=accountRepository.findById(session.getAttribute("sessionValue").toString()).get();
        if(account.getCurrentStorageSize()+ file.getSize()<=account.getMaximumStorageSize()) {              //If the file size less than the maximum storage space then it performs storage operation
            mv = new ModelAndView("/status/uploadFileStatus.jsp");
            fileStorageData.setId(UUID.randomUUID().toString());
            fileStorageData.setFileName(fileName);
            fileStorageData.setOriginalFileName(file.getOriginalFilename());
            fileStorageData.setUploadedFile(new byte[1024]);
            fileStorageData.setUploadedBy(session.getAttribute("sessionValue").toString());
            fileStorageData.setPlatform("AWS-S3");
            fileStorageData.setFileType(file.getContentType());
            fileStorageData.setFileSize(file.getSize());
            fileStorageData = fileStorageRepository.save(fileStorageData);
            ObjectMetadata objectMetadata = new ObjectMetadata();
            objectMetadata.setContentType(file.getContentType());
            amazonS3.putObject(new PutObjectRequest(bucketName, file.getOriginalFilename(), file.getInputStream(), objectMetadata).withCannedAcl(CannedAccessControlList.PublicRead));
            account.setCurrentStorageSize(account.getCurrentStorageSize()+file.getSize());                  //Once file details updated in DB need to update current storage space and save the same in account document
            accountRepository.save(account);
        }
        else {                                                                                               //Else it will return Storage not available page..
            System.out.println("Running Out of Space. in S3.");
            mv = new ModelAndView("/status/runningOutOfStorage.jsp");
        }
        return mv;
    }

    @Override
    public ModelAndView renderingPageForDownloadS3File(HttpSession session) {
        List<FileStorageData> fileStorageDataList=fileStorageRepository.findByUploadedByAndPlatform(session.getAttribute("sessionValue").toString(),"AWS-S3");
        if(fileStorageDataList.size()==0)
            mv=new ModelAndView("/status/noS3File.jsp");
        else {
            mv = new ModelAndView("downloadFromS3.jsp");
            mv.addObject("downloadFiles", fileStorageDataList);
        }
        return mv;
    }

    @Override
    public byte[] downloadByteFile(String fileName) throws IOException {
        S3Object s3Object=amazonS3.getObject(bucketName, fileName);
        S3ObjectInputStream s3ObjectInputStream=s3Object.getObjectContent();
        return IOUtils.toByteArray(s3ObjectInputStream);
    }

    @Override
    public ModelAndView renderingPageForDeleteS3File(HttpSession session) {
        List<FileStorageData> fileStorageDataList=fileStorageRepository.findByUploadedByAndPlatform(session.getAttribute("sessionValue").toString(),"AWS-S3");
        if(fileStorageDataList.size()==0)
            mv=new ModelAndView("/status/noS3File.jsp");
        else {
            mv=new ModelAndView("deleteS3File.jsp");
            mv.addObject("editFiles",fileStorageDataList);
        }
        return mv;
    }

    @Override
    public String deleteFileById(String fileId) {
        fileStorageData=fileStorageRepository.findById(fileId).get();
        account=accountRepository.findById(fileStorageData.getUploadedBy()).get();
        amazonS3.deleteObject(bucketName, fileStorageData.getOriginalFileName());
        fileStorageRepository.deleteById(fileStorageData.getId());
        account.setCurrentStorageSize(account.getCurrentStorageSize()-fileStorageData.getFileSize());
        accountRepository.save(account);
        return "redirect:/delete-s3";
    }
}
