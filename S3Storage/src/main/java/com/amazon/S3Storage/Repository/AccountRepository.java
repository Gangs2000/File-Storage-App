package com.amazon.S3Storage.Repository;

import com.amazon.S3Storage.Document.Account;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountRepository extends MongoRepository<Account, String> {

}
