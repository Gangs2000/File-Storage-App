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
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style>
    body{
        background-color:#082A3A;
    }
</style>
</head>
<body>
    <nav class="navbar navbar-expand-md" style="background-color:#00E6F6; color:black; padding:20px">
        <div class="container">
            <div class="collapse navbar-collapse" id="navbarButtonsExample">
                 <ul class="navbar-nav me-auto mb-8 me-8 mb-lg-10">
                   <li class="nav-item">
                     <span style="font-size:22px"><i class="fab fa-aws"></i>&nbsp;&nbsp;<i class="fab fa-envira"></i>&nbsp;&nbsp;S3 and Mongo Storage</span>
                   </li>
                 </ul>

                 <div class="d-flex align-items-right">
                   <a class="navbar-brand" style="font-size:18px;">
                         <img src="/status/logo.png" alt="Avatar Logo" style="width:40px; margin-top:-2%; text-align:right" class="rounded-pill">&nbsp;&nbsp;
                         Hi,<%=session.getAttribute("sessionValue") %>
                   </a>
                   <a><button onclick="expandStorage()" class="btn btn-block mb-8" style="background-color:#082A3A; color:#FFFFFF;"><i class="fas fa-database"></i>&nbsp;&nbsp;Get Storage</button></a>&nbsp;&nbsp;
                   <a href="/logout"><button class="btn btn-block mb-8" style="background-color:#082A3A; color:#FFFFFF;"><i class="fas fa-door-open"></i>&nbsp;&nbsp;Logout</button></a>
                 </div>
            </div>
        </div>
    </nav>
 </body>
 </html>

 <script>
    const expandStorage=()=>{
        console.log("Payment started..");
        let amount='100';
        $.ajax({
            url:'/expandStorage/createOrder',
            data: JSON.stringify({amount:amount, info:'order_request'}),
            contentType:'application/json',
            type:'POST',
            dataType:'json',
            success:function(response){
                //Success will be triggered when response is success..   
                console.log(response);                          
                if(response.status=='created'){
                    //Open payment form                    
                    let options={
                        key:'*******************************************',
                        amount:response.amount,
                        currency:'INR',
                        name:'Expand storage space',
                        description:'Get 100MB for Rs.100',
                        image:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjdM1m7UA7VstFywNubKY67vHtkxq0GGFuaA&usqp=CAU',
                        order_id:response.id,
                        handler:function(response){
                            $.ajax({
                                url:'/expandStorage/updatePayment',
                                data: JSON.stringify({paymentId:response.razorpay_payment_id,orderId:response.razorpay_order_id}),                                
                                contentType:'application/json',
                                timeout:100000,
                                type:'PUT',
                                dataType:'json',
                                success:function(response){                                
                                    alert('Storage has been expanded successfully!!');
                                },
                                error:function(error){
                                    swal({
                                        title: "Good job!",
                                        text: "Storage has been cumulated successfully!!",
                                        icon: "success",
                                        button: "Click",
                                    });
                                    setTimeout(() => { window.location.href="/service"; }, 4000);                                    
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
                            address:'Expand Storage'
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

