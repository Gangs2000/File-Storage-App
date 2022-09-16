package com.amazon.S3Storage.Interface;

import com.amazon.S3Storage.Document.FileStorageData;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public interface MongoInterface {
    ModelAndView registerNewAccount(HttpServletRequest request, HttpSession session);
    ModelAndView updateNewPassword(HttpServletRequest request);
    ModelAndView uploadFileToMongo(String fileName, MultipartFile file, HttpSession session) throws IOException;
    ModelAndView renderingPageForDownloadMongoFile(HttpSession session);
    FileStorageData downloadFileById(String fileId);
    ModelAndView renderingPageForDeleteMongoFile(HttpSession session);
    String deleteMongoFileById(String fileId);
    ModelAndView updateProfile(HttpServletRequest request, HttpSession session);
}
