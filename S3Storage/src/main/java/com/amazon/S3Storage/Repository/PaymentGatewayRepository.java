package com.amazon.S3Storage.Repository;

import com.amazon.S3Storage.Document.PaymentInfo;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentGatewayRepository extends MongoRepository<PaymentInfo, String> {

}
