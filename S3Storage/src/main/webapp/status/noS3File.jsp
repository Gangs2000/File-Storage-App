<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>S3 & Mongo Storage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>
<body>
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
            <div class="col-sm" style="margin-top:18%; overflow:auto">
                <center><h4 style="color: white;">Looks like no file is available on your account to show, You will see all uploaded files here</h4></center><br><br>
                <center><a href="/upload-s3"><button class="btn btn-primary"><strong>Click to upload</strong></button></a></center>
            </div>
        </div>
    </div>
</body>
</html>