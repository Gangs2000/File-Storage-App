<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>S3 Registration</title>
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
    <div class="container">
        <div class="row">
            <div class="col-sm" style="margin-top:7%">
                  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
                    <div class="container h-100" style="width:85%">
                      <div class="row d-flex justify-content-center align-items-center h-100" >
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                          <div class="card" style="border-radius: 15px; background-color:#00E6F6">
                            <div class="card-body p-4">
                              <h3 class="text-uppercase text-center mb-2">Create an account</h3><br>

                              <form action="/register" method="post">

                                <div class="form-outline mb-2">
                                    <label class="form-label"><i class="fas fa-user"></i>&nbsp;&nbsp;<strong>Username</strong></label>
                                    <input type="text" name="userName" class="form-control form-control-md" placeholder="John Doe" autocomplete="off" required/>
                                </div>

                                <div class="form-outline mb-2">
                                    <label class="form-label"><i class="fa fa-envelope"></i>&nbsp;&nbsp;<strong>Email Address</strong></label>
                                    <input type="email" name="_id" class="form-control form-control-md" placeholder="example@gmail.com" autocomplete="off" required/>
                                </div>

                                <div class="form-outline mb-2">
                                    <label class="form-label"><i class="fa fa-key"></i>&nbsp;&nbsp;<strong>Password</strong></label>
                                    <input type="password" name="password" class="form-control form-control-md" placeholder="XXXXXXXX" maxlength="8" autocomplete="off" required/>
                                </div>

                                <div class="form-outline mb-2">
                                    <label class="form-label"><strong><i class="fas fa-phone"></i>&nbsp;&nbsp;Mobile Number</strong></label>
                                    <input type="tel" name="mobileNumber" maxlength="10" class="form-control form-control-md" placeholder="1234567890" autocomplete="off" required/>
                                </div>

                                <div class="form-outline mb-2">
                                    <label class="form-label"><i class="fas fa-question"></i>&nbsp;&nbsp;<strong>Select Security Question</strong></label>
                                    <select class="form-select form-select-md mb-3" name="securityQuestion" aria-label=".form-select-md example">
                                      <option>What is your favourite color?</option>
                                      <option>Where were you born?</option>
                                      <option>What is your siblings name?</option>
                                      <option>What is your favourite dish?</option>
                                      <option>What is your favourite vacation spot?</option>
                                    </select>
                                </div>

                                <div class="form-outline mb-2">
                                    <label class="form-label"><i class="fas fa-user-shield"></i>&nbsp;&nbsp;<strong>Security Question Answer</strong></label>
                                    <input type="text" name="securityAnswer" class="form-control form-control-md" placeholder="Type Answer" autocomplete="off" required/>
                                </div>

                                <br>
                                <div class="d-flex justify-content-center">
                                    <button type="submit" class="btn btn-block" style="width:100%; background-color:#082A3A; color:#FFFFFF;"><i class="fas fa-user-plus"></i>&nbsp;&nbsp;Register</button>
                                </div>

                                <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="/login"
                                    class="fw-bold text-body"><u>Login here</u></a></p>
                              </form>

                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
            </div>
        </div>
    </div>
</body>
</html>