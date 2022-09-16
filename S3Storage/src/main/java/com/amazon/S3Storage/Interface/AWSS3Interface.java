package com.amazon.S3Storage.Interface;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;

public interface AWSS3Interface {
    ModelAndView uploadFileToS3(String fileName, MultipartFile file, HttpSession session) throws IOException;
    ModelAndView renderingPageForDownloadS3File(HttpSession session);
    byte[] downloadByteFile(String fileName) throws IOException;
    ModelAndView renderingPageForDeleteS3File(HttpSession session);
    String deleteFileById(String fileId);
}
