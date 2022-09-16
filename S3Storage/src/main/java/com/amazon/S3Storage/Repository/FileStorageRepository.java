package com.amazon.S3Storage.Repository;

import com.amazon.S3Storage.Document.FileStorageData;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FileStorageRepository extends MongoRepository<FileStorageData, String> {
    List<FileStorageData> findByUploadedByAndPlatform(String emailId, String platform);
}
