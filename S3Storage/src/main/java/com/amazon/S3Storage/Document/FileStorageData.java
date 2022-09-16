package com.amazon.S3Storage.Document;

import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.stereotype.Component;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Component
@Document
public class FileStorageData {
    @Id
    private String id;
    private String fileName;
    private String originalFileName;
    private byte[] uploadedFile;
    private String uploadedBy;
    private String platform;
    private String fileType;
    private long fileSize;
}
