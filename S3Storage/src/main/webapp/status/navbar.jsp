<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    #sidebar{
        padding:40px;
        height:106%;
    }
    li:hover{
        background-color:#00E6F6;
        color:black;
        font-weight:bold;
    }
</style>
</head>
<body>
    <div class="vertical-nav bg-white" id="sidebar">
        <p style="background-color: black; text-align: center; color:white; padding:15px;"><i class="fas fa-database"></i><strong>&nbsp;&nbsp;S3 and Mongo Storage Menu</strong></p><br>
            <ul>
                <li class="nav-item mb-2" style="list-style-type:none">
                    <a href="/service" class="nav-link text-dark font-italic"><i class="fas fa-cogs"></i>&nbsp;&nbsp;Our Services</a>
                </li><br>
                <p><strong><i class="fab fa-envira"></i>&nbsp;&nbsp;Mongo Atlas Services<span style="color:red"> ( For free ) </span></strong></p>
                    <ul class="nav flex-column bg-white mb-8">
                        <li class="nav-item mb-2">
                            <a href="/upload-mongo" class="nav-link text-dark font-italic"><i class="fas fa-upload"></i>&nbsp;&nbsp;Upload File to Mongo</a>
                        </li>
                        <li class="nav-item mb-2">
                            <a href="/download-mongo" class="nav-link text-dark font-italic"><i class="fas fa-download"></i>&nbsp;&nbsp;Download File from Mongo</a>
                        </li>
                        <li class="nav-item mb-2">
                            <a href="/delete-mongo" class="nav-link text-dark font-italic"><i class="fas fa-trash"></i>&nbsp;&nbsp;Delete file from Mongo</a>
                        </li>
                    </ul><br>
                <p><strong><i class="fab fa-aws"></i>&nbsp&nbsp;AWS S3 Services<span style="color:red"> ( Paid ) </span></strong></p>
                    <ul class="nav flex-column bg-white mb-8">
                        <li class="nav-item mb-2">
                            <a href="/upload-s3" class="nav-link text-dark font-italic"><i class="fas fa-cloud-upload-alt"></i>&nbsp;&nbsp;Upload File to S3</a>
                        </li>
                        <li class="nav-item mb-2">
                            <a href="/download-s3" class="nav-link text-dark font-italic"><i class="fas fa-cloud-download-alt"></i>&nbsp;&nbsp;Download File from S3</a>
                        </li>
                        <li class="nav-item mb-2">
                            <a href="/delete-s3" class="nav-link text-dark font-italic"><i class="fas fa-trash"></i>&nbsp;&nbsp;Delete File from S3</a>
                        </li>
                    </ul>
                    <br>
                    <li class="nav-item mb-2" style="list-style-type:none">
                        <a href="/existing-profile" class="nav-link text-dark font-italic"><i class="fas fa-user-edit"></i>&nbsp;&nbsp;Update Profile</a>
                    </li>
                </ul><br>
                <small style="color:red;"><b>Storage Usage : <%=session.getAttribute("currentStorage")%> MB of <%=session.getAttribute("maximumStorage")%> MB</b></small><br><br>
                <div class="progress" style="height:25px; background-color: gray;">                       
                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="0" id="storageIndicator" st aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <a href="#info" data-bs-toggle="modal">To Know more about extend storage?</a>
                <!-- Modal -->
                <div class="modal fade" id="info" tabindex="-1" aria-labelledby="storageExtendInfo" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color:#00E6F6; color:black">
                                <h5 class="modal-title" id="storageExtendInfo">Want to expand storage space?&nbsp;&nbsp;<i class="fas fa-database"></i></h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body" style="background-color:#082A3A; color:white; font-weight:600;">
                                <small>As you already aware all account will be reserved with 500MB of storage space for free. To get extra space on your account you have to pay &nbsp;<i class="fas fa-rupee-sign"></i>&nbsp;100 for each 100MB. So that additional storage space will be cumulated on your profile.<br>
                                <br>Payment Details :<br>
                                <i class="fas fa-rupee-sign"></i>&nbsp;&nbsp;100 for 100MB<br><br>
                                If your current storage space is 500MB then after successful purchase your storage space will be ( current storage + 100MB )                                                            
                                </small>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-block mb-8" style="background-color:#082A3A; color:#FFFFFF;" data-bs-dismiss="modal"><i class="fas fa-check-circle"></i>&nbsp;&nbsp;Got, it</button>                            
                            </div>
                        </div>
                    </div>
                </div>                                
    </div>
</body>
</html>

<script>
    <c:set var="size" value="${percentageScale}"></c:set>
    var widthOfProgressbar="${size}";
    console.log(widthOfProgressbar);
    document.getElementById("storageIndicator").style.width=widthOfProgressbar+"%";   
    document.getElementById("storageIndicator").innerHTML=widthOfProgressbar+"%";    
</script>