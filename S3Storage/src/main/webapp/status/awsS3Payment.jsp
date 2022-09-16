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
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>
<body>
    <div class="container-fluid" style="height:90%;">
        <div class="row">
            <div class="col-sm">
                <jsp:include page="/status/titlebar.jsp"></jsp:include>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <jsp:include page="/status/navbar.jsp"></jsp:include>
            </div>
            <div class="col-sm" style="margin-top:12%; margin-left:12%; color:white">                
                <h3><i class="fas fa-exclamation-triangle"></i>&nbsp;&nbsp;Looks like you don't have AWS Lincense to upload files into S3</h3><br>   
                <p>Pay &nbsp;<b><i class="fas fa-rupee-sign"></i>100 ( Single Time Payment )</b> to get the AWS S3 Lincense and start uploading your files</p>  
                <p>Pay once use life long..</p><br>
                <button class="btn btn-primary" onclick="paymentStart()"><strong>Pay&nbsp;&nbsp;<i class="fas fa-rupee-sign"></i>&nbsp;&nbsp;100 to get Lincense</strong></button>
            </div>
        </div>
    </div>
</body>
</html>

<script>
    const paymentStart=()=>{
        console.log("Payment started..");
        let amount='100';
        $.ajax({
            url:'/license/createOrder',
            data: JSON.stringify({amount:amount, info:'order_request'}),
            contentType:'application/json',
            type:'POST',
            dataType:'json',
            success:function(response){
                //Success will be triggered when response is success..                
                if(response.status=='created'){
                    //Open payment form
                    let options={
                        key:'****************************************',
                        amount:response.amount,
                        currency:'INR',
                        name:'AWS S3 License',
                        description:'Pay once use life long',
                        image:'data:image/png;base64,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',
                        order_id:response.id,
                        handler:function(response){
                            $.ajax({
                                url:'/license/updatePayment',
                                data: JSON.stringify({paymentId:response.razorpay_payment_id,orderId:response.razorpay_order_id}),                                
                                contentType:'application/json',
                                timeout:100000,
                                type:'PUT',
                                dataType:'json',
                                success:function(response){                                
                                    alert('License has been granted..');
                                },
                                error:function(error){
                                    swal({
                                        title: "Good job!",
                                        text: "AWS S3 License activated!!",
                                        icon: "success",
                                        button: "Click",
                                    });
                                    setTimeout(() => { window.location.href="/upload-s3"; }, 4000);                                    
                                }
                            })                      
                        },
                        prefill: {
                            name: "",
                            email: "",
                            contact: ""                            
                        },
                        theme: {
                            color: '#00E6F6'
                        },
                        notes: {
                            address:'Get AWS S3 License'
                        }
                    };
                    let razorpayForm=new Razorpay(options);
                    razorpayForm.on('payment.failed', function (response){
                        console.log(response.error.code);
                        console.log(response.error.description);
                        console.log(response.error.source);
                        console.log(response.error.step);
                        console.log(response.error.reason);
                        console.log(response.error.metadata.order_id);
                        console.log(response.error.metadata.payment_id);
                        swal({
                            title: "Oops!!",
                            text: "Looks like an issue with payment gateway",
                            icon: "warning",
                            button: "Back",
                        });
                    });
                    razorpayForm.open();
                }
            },
            error:function(error){
                //Error will be triggered when response is success..
                console.log(error);
            }
        })
    };
</script>