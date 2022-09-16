<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<style>
    ::-webkit-scrollbar {
        width: 2px;
    }
    ::-webkit-scrollbar-thumb {
        border-radius: 5px;
        background-color: black;    
    }
</style>
<body style="overflow-y:hidden;">
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
            <div class="col-sm" style="margin-top:7%; overflow:auto">
                <jsp:include page="fileDownloadFromMongo.jsp"></jsp:include><br><br>            
            </div>
        </div>
    </div>
</body>
</html>