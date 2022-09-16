<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
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
    <h4 style="color: white; position: fixed;">Mongo Files available to download&nbsp;&nbsp;<i class="fas fa-download"></i></h4><br><br><br>
    <table class="table" style="border:none">
        <tbody>
            <tr class="info">
                <c:forEach items="${downloadFiles}" var="downloadFiles">  <!-- In order to use this forEach we need import jstl dependencies -->
    			    <td scope="row">
    			        <div class="card" style="width: 20rem; height:30rem; overflow:auto">
                            <img src="mongoatlas.png" class="card-img-top">
                                <div class="card-body"  style="overflow:auto">
                                    <p class="card-text">
                                        <h5>${downloadFiles.fileName}</h3><br>
                                        <p>File Name : ${downloadFiles.originalFileName}</p>
                                        <p>File Type : ${downloadFiles.fileType}</p>
                                        <p>File Size : ${downloadFiles.fileSize} Bytes</p>
                                        <br><br>
                                    </p>
                                </div>
                                <a href="/download-mongo-file/fileId/${downloadFiles.id}">
                                    <button class="btn btn-primary" style="width:100%; font-weight:bold;">
                                        <div class="card-footer">
                                            <i class="fas fa-download"></i></i>&nbsp;&nbsp;Download
                                        </div>
                                    </button>
                                </a>
                                </div>
                        </div>
    			    </td>
    		    </c:forEach>
    		</tr>
    	</tbody>
    </table>
</body>
</html>