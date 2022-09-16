package com.amazon.S3Storage.Controller;

import com.amazon.S3Storage.Document.FileStorageData;
import com.amazon.S3Storage.Service.AWSS3Service;
import com.amazon.S3Storage.Service.MongoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
public class DownloadFileController {

    @Autowired MongoService mongoService;
    @Autowired AWSS3Service awss3Service;

    @GetMapping("/download-mongo-file/fileId/{id}")
    public ResponseEntity<Resource> downloadMongoFile(@PathVariable("id") String fileId){
        FileStorageData currentFileData=mongoService.downloadFileById(fileId);
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(currentFileData.getFileType()))
                .header(HttpHeaders.CONTENT_DISPOSITION,"attachment; filename= mongoAtlas_"+currentFileData.getOriginalFileName())
                .body(new ByteArrayResource(currentFileData.getUploadedFile()));
    }

    @GetMapping("/download-s3-file/fileId/{id}")
    public ResponseEntity<Resource> downloadS3File(@PathVariable("id") String fileId) throws IOException {
        FileStorageData currentFileData=mongoService.downloadFileById(fileId);                      //Holding File Data
        byte[] awsFileByte= awss3Service.downloadByteFile(currentFileData.getOriginalFileName());
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(currentFileData.getFileType()))
                .header(HttpHeaders.CONTENT_DISPOSITION,"attachment; filename= awsS3_"+currentFileData.getOriginalFileName())
                .body(new ByteArrayResource(awsFileByte));

    }
}
