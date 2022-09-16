<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>S3 & Mongo Storage APP</title>
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
        <div class="col-sm-4"></div>
        <div class="col-sm-4" style="border-radius: 15px; background-color:#00E6F6; padding:40px; margin-top:15%;">
            <h3 class="text-uppercase text-center mb-2">LOGIN</h3><br>
            <form action="/login" method="post">
                <div class="form-outline mb-4">
                    <label class="form-label" for="form2Example1"><i class="fa fa-envelope"></i>&nbsp;&nbsp;<strong>Email address</strong></label>
                    <input type="email" name="username" class="form-control" placeholder="example@gmail.com" autocomplete="off" required/>
                </div>
                <div class="form-outline mb-4">
                    <label class="form-label" for="form2Example2"><i class="fa fa-key"></i>&nbsp;&nbsp;<strong>Password</strong></label>
                    <input type="password" name="password" maxlength="8" class="form-control" placeholder="XXXXXXXX" required/>
                </div>


                <div class="row mb-4">
                    <div class="col d-flex justify-content-center">
                        <button type="submit" class="btn btn-block mb-8" style="background-color:#082A3A; color:#FFFFFF;"><i class="fas fa-shield-alt"></i>&nbsp;&nbsp;Login</button>
                    </div>

                    <div class="col d-flex justify-content-center">
                        <a href="/register-account"><button type="button" class="btn btn-block mb-8" style="background-color:#082A3A; color:#FFFFFF;"><i class="fas fa-user-plus"></i>&nbsp;&nbsp;Register</button></a>
                    </div>
                </div>
                <div class="text-center">
                    <p>Forgot Password? <a href="/forgot-password">Forgot password</a></p>
                </div>
            </form>
            <span><center><b>${SPRING_SECURITY_LAST_EXCEPTION.message}</b></center></span>
        </div>
        <div class="col-sm-4"></div>
    </div>
</div>
</body>
</html>