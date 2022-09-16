<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>S3 & Mongo Storage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>
<style>
    body{
        background-color:#082A3A;
    }
</style>
<body>
    <div class="container d-flex flex-column">
        <div class="row align-items-center justify-content-center" style="margin-top:10%;">
            <div class="col-12 col-md-8 col-lg-4" style="width:40% ;">
                <div class="card shadow">
                    <div class="card-body" style="background-color:#00E6F6; padding:35px">
                        <div class="mb-4">
                            <h5>Forgot Password?</h5>
                            <p class="mb-2">Fill below details to reset the password</p>
                        </div>
                        <form action="/updatePin" method="post">
                            <div class="form-outline mb-4">
                                <label for="email" class="form-label"><i class="fas fa-envelope"></i>&nbsp;&nbsp;<strong>Email address</strong></label>
                                <input type="email" class="form-control" name="emailId" placeholder="example@gmail.com" autocomplete="off" required>
                            </div>

                            <div class="form-outline mb-4">
                                <label class="form-label"><i class="fas fa-question"></i>&nbsp;&nbsp;<strong>Select Security Question</strong></label>
                                <select class="form-select form-select-md mb-3" name="securityQuestion" aria-label=".form-select-md example">
                                  <option>What is your favourite color?</option>
                                  <option>Where were you born?</option>
                                  <option>What is your siblings name?</option>
                                  <option>What is your favourite dish?</option>
                                  <option>What is your favourite vacation spot?</option>
                                </select>
                            </div>

                            <div class="form-outline mb-4">
                                <label class="form-label"><i class="fas fa-user-shield"></i>&nbsp;&nbsp;<strong>Security Question Answer</strong></label>
                                <input type="text" name="securityAnswer" class="form-control form-control-md" placeholder="Type Answer" autocomplete="off" required/>
                            </div>

                            <div class="form-outline mb-4">
                                <label for="password" class="form-label"><i class="fas fa-key"></i>&nbsp;&nbsp;<strong>Enter new password</strong></label>
                                <input type="password" class="form-control" name="password" placeholder="XXXXXXXX" required>
                            </div>

                            <div class="mb-3 d-grid">
                                <button type="submit" class="btn" style="background-color: black; color:white; font-weight: bold;"><i class="fas fa-key"></i>&nbsp;&nbsp;Reset Password</button>
                            </div><br>
                            <center><span style="font-weight: 500;">Don't have an account? <a href="/login">sign in</a></span></center>
                        </form><br>                        
                    </div>
                </div>
            </div>
        </div><br>        
    </div>
</body>
</html>