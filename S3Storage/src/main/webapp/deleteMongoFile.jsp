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
            <div class="col-sm" style="margin-top:5%; overflow:auto">                
                <table class="table table-striped table-hover table-bordered" style="background-color:white">
                    <thead>
                        <tr class="success" align="center">
                            <th scope="col" colspan="5" style="padding:25px; background-color: black; color: white;"><i class="fab fa-envira"></i>&nbsp;&nbsp;Uploaded files ( Fetched records from Mongo Atlas )</th>
                        </tr>
                        <tr class="danger" align="center">
                            <th scope="col" style="padding:20px; width:20%;">File Name</th>                                    
                            <th scope="col" style="padding:20px; width:20%;">Original File Name</th>
                            <th scope="col" style="padding:20px; width:20%;">File Type</th>
                            <th scope="col" style="padding:20px; width:20%;">File Size</th>                            
                            <th scope="col" style="padding:20px; width:20%;">Delete File</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${editFiles}" var="editFiles">  <!-- In order to use this forEach we need import jstl dependencies --> 
                            <tr class="info" align="center">              
                                <td scope="row">${editFiles.fileName}</td>                      
                                <td>${editFiles.originalFileName}</td>
                                <td>${editFiles.fileType}</td>
                                <td>${editFiles.fileSize} bytes</td>                                
                                <td><a href="/delete-mongo-file/fileId/${editFiles.id}"><button class="btn btn-danger" style="width: 60%;"><i class="fas fa-trash-alt"></i>&nbsp;&nbsp;<strong>Delete</strong></button></a></td>
                            </tr>                            
                        </c:forEach>
                    </tbody>
                </table>             
            </div>
        </div>
    </div>
</body>
</html>