package com.amazon.S3Storage.Document;

import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@Component
@NoArgsConstructor
@AllArgsConstructor
@Document
public class Account {
    @Id
    private String _id;
    private String userName;
    private String password;
    private long mobileNumber;
    private boolean isAWSAccessGranted;
    private String securityQuestion;
    private String securityAnswer;
    private long currentStorageSize;
    private long maximumStorageSize;
}
