# File-Storage-App

As application name itself clearly saying that the purpose of this application is to store files in different storage platforms. Mongo Atlas and Amazon S3 platforms where all the uploaded files are getting stored. For more details about this project scroll down..


1. MongoDB Atlas - **For free to use**
2. Amazon Web Service - S3 ( Simple Stroage Service ) - **Single time Payment** 

**Technologies used in this project :**

1. For presentation layer - HTML, CSS, Bootstrap5 and AJAX ( Only in payment gateway service )
2. For Backend - Spring Framework ( Spring MVC, Spring Security, Rest API's and Spring Hibernate/Data JPA )
3. Database - MongoDB Atlas

This application will accept any kind of file objects. It can be a mp3,mp4,txt,csv,json,odt,pem,xls,rdp etc.. ( It almost accepts all extensions )

As soon as the new account is available, end user can start performing upload, download and delete operations. 

**Buying Resources :**

**Purchasing AWS-S3 License :**

**This application has also included the RazorPay payment Gateway feature. To upload, download and delete files over MongoDB Atlas cloud is completely for free. No charge will be applied against any operation. But in order to use AWS S3 cloud platform first user has to pay Rs.100 ( Single time Payment Feature ) to unlock AWS S3 features so that it will allow user to perform operations over AWS S3 too. Once the AWS S3 feature is enabled user can start using it for free.**

**Purchasing additional storage space :**

**Expand Storage option is also developed in this application. By default in all account storage space size will be set to 500MB limit, suppose if user wants to purchase additional storage space, user has to pay Rs.100 for 100MB. Upon successful payment process 100MB will be cumulated to user profile. Here too Razorpay payment gateway is used to collect amount**

**File Saving process in both cloud platforms :**

1. MongoDB Atlas - File will be saved in byte array format
2. AWS S3 - File will be stored to S3 bucket as it is ( No convertion is required )

**Services implemented in backend :**

1. Registration Controller
2. Upload File Controller ( Both MongoDB Atlas and AWS S3 )
3. Download File Controller ( Both MongoDB Atlas and AWS S3 )
4. Delete File Controller ( Both MongoDB Atlas and AWS S3 )
5. Update Profile Controller
6. Payment Gateway Controller - Razorpay gateway client

Snapshots of all pages from this project :

**Login page**

![Screenshot from 2022-09-15 13-45-03](https://user-images.githubusercontent.com/112934529/190396374-addbf1e6-e680-4dc5-935f-3c58e54dacf5.png)

**Registration page**

![Screenshot from 2022-09-15 13-45-08](https://user-images.githubusercontent.com/112934529/190396430-895a751d-a30a-439c-bae6-b33d84775467.png)

**Forgot Password page**

![Screenshot from 2022-09-15 13-45-14](https://user-images.githubusercontent.com/112934529/190396500-fb667f5a-a4b6-433b-a746-e36d8e8edeb2.png)

**Landing page**

![Screenshot from 2022-09-16 20-16-39](https://user-images.githubusercontent.com/112934529/190666773-f4a91a3f-2e3e-4f23-af0f-4db09d686adf.png)

**Upload file page - MongoDB Atlas Free Service**

![Screenshot from 2022-09-16 20-17-22](https://user-images.githubusercontent.com/112934529/190666936-0710701d-f9ea-4dee-9812-3270d8e23ad4.png)

**Download mongo file page - When no files available in your account**

![Screenshot from 2022-09-16 20-18-30](https://user-images.githubusercontent.com/112934529/190667117-46d333b7-edaa-4315-8cc8-9e30441662cc.png)

**Download mongo file page - When files are readily available to download**

![Screenshot from 2022-09-16 20-20-29](https://user-images.githubusercontent.com/112934529/190667619-3fc3fa28-5f94-4f4b-9732-d55b9fdd2aa3.png)

**Delete mongo file page**

![Screenshot from 2022-09-16 20-20-58](https://user-images.githubusercontent.com/112934529/190667704-cece689a-a0f7-46ec-9fd6-f166b755d3eb.png)

**AWS S3 file upload page - when AWS License is not activated**

![Screenshot from 2022-09-16 20-21-31](https://user-images.githubusercontent.com/112934529/190667835-9d3b0f1c-08f1-463f-bad0-ad172e636e69.png)

**Razorpay gateway interaction during payment process**

![Screenshot from 2022-09-16 20-22-12](https://user-images.githubusercontent.com/112934529/190668011-8dd4a4d8-ce2e-4b8c-bd5e-5c3f2a0ba7b9.png)

**AWS Lincense activated message**

![Screenshot from 2022-09-16 20-24-10](https://user-images.githubusercontent.com/112934529/190668458-b45e2322-90f2-449d-8d01-dd34c90b91c7.png)

**AWS S3 file upload page - when AWS License is activated**

![Screenshot from 2022-09-16 20-24-37](https://user-images.githubusercontent.com/112934529/190668547-492cb6ab-002c-44d2-9109-bff8f790cb64.png)

**Download AWS S3 file page**

![Screenshot from 2022-09-16 20-26-53](https://user-images.githubusercontent.com/112934529/190669037-61dcc699-6c27-4fbb-9db5-9b77fcb0bd1e.png)

**Delete AWS S3 file page**

![Screenshot from 2022-09-16 20-27-08](https://user-images.githubusercontent.com/112934529/190669080-f0708e10-0c6c-496c-a4b4-30d6335dfa00.png)

**Update profile page**

![Screenshot from 2022-09-16 20-27-28](https://user-images.githubusercontent.com/112934529/190669137-8d5a2159-d149-457f-8186-ff2be759af4a.png)

**Model box about storage purchase information**

![Screenshot from 2022-09-16 20-28-14](https://user-images.githubusercontent.com/112934529/190669317-12910748-ff56-407b-af03-b95a6517a381.png)

**Razorpay payment gateway interaction during storage purchase process**

![Screenshot from 2022-09-16 20-29-30](https://user-images.githubusercontent.com/112934529/190669600-3cdeca55-9dee-4abd-8642-9d0356d1664d.png)

**Storage purchase success message**

![Screenshot from 2022-09-16 20-30-12](https://user-images.githubusercontent.com/112934529/190669781-c9969882-7524-4cb5-ac1f-643af104d706.png)

**MongoDB Atlas Account Document - Where account details are stored**

![Screenshot from 2022-09-15 13-47-03](https://user-images.githubusercontent.com/112934529/190397869-f34f4d72-c560-479e-a790-3ebc406ae28d.png)

**MongoDB Atlas Filestorage Document - Where all uploaded file details are stored**

![Screenshot from 2022-09-15 13-47-12](https://user-images.githubusercontent.com/112934529/190398042-41f097c8-a3d6-4840-9801-96486eaf5c7f.png)

**MongoDB Atlas PaymentInfo Document - Where all payment details are recoreded**

![Screenshot from 2022-09-15 13-47-20](https://user-images.githubusercontent.com/112934529/190398150-f61bd87a-851b-458a-89a1-039b42d05e44.png)

**AWS Console - S3 Bucket Objects ( Uploaded files to AWS S3 will be kept here )**

![Screenshot from 2022-09-15 13-47-25](https://user-images.githubusercontent.com/112934529/190398208-1080a510-af0d-496f-8b43-3b57d80a9b1b.png)

**Razorpay payment dashboard**

![Screenshot from 2022-09-15 13-47-36](https://user-images.githubusercontent.com/112934529/190398386-0c13564a-0cda-43c5-9a6a-32f698e5246c.png)

**Razorpay payment statistics**

![Screenshot from 2022-09-16 20-31-21](https://user-images.githubusercontent.com/112934529/190670053-4d5a98df-7c4d-4a98-8b11-49bea70dd5da.png)


**Feautres may expect in future :**

1. Oauth2 client integration which enables users to signup/sigin easily by authenticating google account
2. RabbitMq message broker implementation which helps to send an email to user upon every action
3. Will try to store documents in MongoDB Grid FS which is faster than MongoDB Atlas moreover fetching data will be much faster
4. Will implement Redis cache system so that application work flawlessly without heavy load

**Reference :**

Razorpay client integration video : https://www.youtube.com/watch?v=-Ke6JYqTM_s

**HappY Coding!!!.......**
