<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>S3 Storage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style>
    body{
        background-color:#082A3A;
    }
</style>
</head>
<body>
      <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col col-xl-10">
            <div class="card" style="border-radius: 1rem;">
              <div class="row g-0">
                <div class="col-md-6 col-lg-5 d-none d-md-block">
                  <img src="awss3.jpeg" alt="login form" class="img-fluid" style="width:100%; height:100%; border-radius: 1rem 0 0 1rem;" />
                </div>
                <div class="col-md-6 col-lg-7 d-flex align-items-center">
                  <div class="card-body p-4 p-lg-5 text-black" style="background-color:#00E6F6; border-radius: 1rem">

                    <form action="/uploadToS3" method="post" name="mongodb" enctype="multipart/form-data">

                      <div class="d-flex align-items-center mb-3 pb-1">
                        <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                        <span class="h2 fw-bold mb-0">Upload File to AWS S3</span>
                      </div>

                      <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Select and Upload file into AWS S3</h5>

                      <div class="form-outline mb-4">
                        <label class="form-label"><i class="fas fa-file"></i>&nbsp;&nbsp;<strong>File Name</strong></label>
                        <input type="text" name="fileName" class="form-control form-control-md" autocomplete="off" required/>
                      </div>

                      <div class="form-outline mb-4">
                        <label class="form-label"><i class="fas fa-file-export"></i>&nbsp;&nbsp;<strong>Choose file to upload</strong></label>
                        <input type="file" name="uploadedFile" class="form-control form-control-md" />
                      </div>

                      <div class="pt-1 mb-4">
                        <button class="btn btn-dark btn-md btn-block" type="submit"><i class="fas fa-cloud-upload-alt"></i>&nbsp;&nbsp;Upload To AWS S3</button>&nbsp;&nbsp;
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
</body>
</html>