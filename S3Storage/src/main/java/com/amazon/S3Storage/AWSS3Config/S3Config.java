package com.amazon.S3Storage.AWSS3Config;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class S3Config {
    private String accessKey="***********************************";
    private String secretKey="***********************************";

    @Bean
    public AmazonS3 amazonS3(){
        AWSCredentials awsCredentials=new BasicAWSCredentials(accessKey,secretKey);
        return AmazonS3ClientBuilder.standard().withRegion(******************).withCredentials(new AWSStaticCredentialsProvider(awsCredentials)).build();
    }
}
