package com.amazon.S3Storage.Document;

import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.stereotype.Component;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Component
@Document
public class PaymentInfo {
    @Id
    private String _id;
    private int amount;
    private String currencyType;
    private String orderStatus;
    private int noOfAttempts;
    private String userEmailId;
    private Date timestamp;
}
