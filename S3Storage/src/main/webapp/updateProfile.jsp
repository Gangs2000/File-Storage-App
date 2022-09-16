<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<title>S3 & Mongo Storage</title>
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
<body style="overflow-y: hidden;">
    <div class="container-fluid" style="height:90%;">
        <div class="row">
            <div class="col-sm">
                <jsp:include page="/status/titlebar.jsp"></jsp:include>
            </div>
        </div>
        <div class="row" style="height:100%;">
            <div class="col-sm-3">
                <jsp:include page="/status/navbar.jsp"></jsp:include>
            </div>
            <div class="col-sm"><br><br>
                <div class="container bootstrap snippets bootdey">
                    <h2 style="color:white; margin-left:5%;"><i class="fas fa-user"></i>&nbsp;&nbsp;Edit Profile</h2><br>
                      <hr>
                    <div class="row">
                      <!-- left column -->
                      <div class="col-md-3">
                        <div class="text-center">
                          <img src="/status/logo.png" class="avatar img-thumbnail" alt="avatar" style="width:60%; height:60%; border-radius:50%;;">                          
                        </div>
                      </div>
                      
                      <!-- edit form column -->
                      <div class="col-md-9">                       
                        <h3 style="color:white;">Personal info</h3><br>
                        
                        <form class="form-horizontal" role="form" action="/update-profile" method="post" style="color:white">
                            <div class="form-group">
                                <label class="form-label"><i class="fa fa-envelope"></i>&nbsp;&nbsp;<strong>Email Address</strong></label>
                                <div class="col-md-8">
                                    <input class="form-control" name="emailId" type="text" value="${data._id} - can't edit this feild" placeholder="example@gmail.com" disabled>
                                </div>
                            </div><br>
                            <div class="form-group">
                                <label class="form-label"><i class="fas fa-user"></i>&nbsp;&nbsp;<strong>Username</strong></label>
                                <div class="col-md-8">
                                    <input class="form-control" name="userName" type="text" value="${data.userName}" placeholder="John Doe" autocomplete="off" required>
                                </div>
                            </div><br>                       
                            <div class="form-group">
                                <label class="form-label"><strong><i class="fas fa-phone"></i>&nbsp;&nbsp;Mobile Number</strong></label>
                                <div class="col-md-8">
                                    <input class="form-control" type="tel" maxlength="10" name="mobileNumber" value="${data.mobileNumber}" placeholder="1234567890" autocomplete="off" required>
                                </div>
                            </div><br>                          
                            <div class="form-group">
                                <label class="form-label"><i class="fas fa-question"></i>&nbsp;&nbsp;<strong>Select Security Question</strong></label>
                                <div class="col-md-8">
                                    <div class="ui-select">
                                        <select name="securityQuestion" class="form-control">
                                            <option>What is your favourite color?</option>
                                            <option>Where were you born?</option>
                                            <option>What is your siblings name?</option>
                                            <option>What is your favourite dish?</option>
                                            <option>What is your favourite vacation spot?</option>
                                        </select>
                                    </div>
                                </div>
                            </div><br>
                            <div class="form-group">
                                <label class="form-label"><i class="fas fa-user-shield"></i>&nbsp;&nbsp;<strong>Security Question Answer</strong></label>
                                <div class="col-md-8">
                                    <input type="text" name="securityAnswer" class="form-control form-control-md" placeholder="Type Answer" autocomplete="off" value="${data.securityAnswer}" required/>
                                </div>
                            </div><br>
                            <button class="btn btn-primary" type="submit"><i class="fas fa-pen"></i>&nbsp;&nbsp;<strong>Update Profile</strong></button>
                        </form>
                      </div>
                  </div>
                </div>
                <hr>           
            </div>
        </div>
    </div>
</body>
</head>
</html>