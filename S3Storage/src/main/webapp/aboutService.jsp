<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
    ::-webkit-scrollbar {
        width: 10px;
    }
    ::-webkit-scrollbar-thumb {
        border-radius: 5px;
        background-color: black;    
    }
</style>
</head>
<body style="overflow-y: hidden;">
<div class="row" style="margin-left:6%; margin-top:5%;">
    <div class="col-sm" style="color:white">
        <h1><i class="fas fa-database"></i>&nbsp;&nbsp;Our Storage Services :</h1><br>
        <p>We are providing two different kinds of storage platforms. You can upload your files into MongoDB Atlas Database or AWS - S3 either.
        <div style="font-weight:bold">
        <p>1. MongoDB Atlas &nbsp;&nbsp; <i class="fab fa-envira"></i>&nbsp;&nbsp;<span style="font-weight:400">- This Service is for free, No charge applicable to use this platform.</span></p>
        <p>2. Amazon Web Service - S3 &nbsp;&nbsp; <i class="fab fa-aws"></i>&nbsp;&nbsp;<span style="font-weight:400">- This Service is paid one, It is one time payment to get AWS S3 License. Once license available for this service, No charge will be applied against any operation.</span></p>
        </div>
        </p>
    </div>
</div>
<div class="row" style="margin-left:10%; margin-top:3%;">
    <div class="col-sm">
        <div class="card" style="width: 25rem; height:27rem">
            <img src="mongoatlas.png" class="card-img-top" alt="...">
            <div class="card-body"  style="overflow:auto; background-color:#00E6F6; line-height:32px; color:black; font-weight:500;">
                <p class="card-text">
                    The auto-administration of MongoDB Atlas streamlines operations, reducing TCO and speeding progress. Unlike RDBMS, MongoDBs built-in scale-out architecture can easily handle huge data volumes and massive traffic.
                </p>
            </div>
        </div>
    </div>
    <div class="col-sm">
        <div class="card" style="width: 25rem; height:27rem">
            <img src="awss3.jpeg" class="card-img-top" alt="...">
            <div class="card-body"  style="overflow:auto; background-color:#00E6F6; line-height:32px; color:black; font-weight:500;">
                <p class="card-text">
                    Amazon S3 offers a range of storage classes designed for different use cases. For example, you can store mission-critical production data in S3 Standard for frequent access, save costs by storing infrequently accessed data in S3 Standard-IA or S3 One Zone-IA, and archive data at the lowest costs in S3 Glacier Instant Retrieval, S3 Glacier Flexible Retrieval, and S3 Glacier Deep Archive.
                    You can store data with changing or unknown access patterns in S3 Intelligent-Tiering, which optimizes storage costs by automatically moving your data between four access tiers when your access patterns change. These four access tiers include two low-latency access tiers optimized for frequent and infrequent access, and two opt-in archive access tiers designed for asynchronous access for rarely accessed data.
                </p>
            </div>
        </div>
    </div>
</div>
</body>
</html>