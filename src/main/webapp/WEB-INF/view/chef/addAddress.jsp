<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <link rel="icon" type="image/png" href="chefResources/image/fav.png">
   <title>Chef - Add Address</title>
   <link href="../user/userResources/css/style.css" rel="stylesheet">
   <link href="../user/userResources/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
      <div class="osahan-signup login-page mb-0">
         <video loop autoplay muted id="vid" style="position:fixed; left:0; bottom:0;">
            <source src="../user/userResources/image/bg.mp4" type="video/mp4">
            <source src="../user/userResources/image/bg.mp4" type="video/ogg">
            Your browser does not support the video tag.
         </video>
         
         <div class="d-flex justify-content-center vh-100">
            <div class="col-md-6 ml-auto">
               <div class="col-10 mx-auto">
                  <!-- <h2 class="text-dark my-0">Hello There.</h2> -->
                  <h2 class="mt-4 mb-4">Add your address</h2>
                  
                  <form:form class="mb-4" action="/chef/saveAddress" method="post" modelAttribute="address">
                     <div class="form-group">
                        <label for="homeNo" class="text-dark font-weight-bold">Home/Flat No.</label>
                        <form:input type="number" path="homeNo" placeholder="Enter Home No" class="form-control" id="homeNo" aria-describedby="homeNo" required="required"/>
                     </div>
                     <div class="form-group">
                        <label for="societyName" class="text-dark font-weight-bold">Society Name</label>
                        <form:input type="text" path="societyName" placeholder="Enter Society Name" class="form-control" id="societyName" aria-describedby="societyName" required="required"/>
                     </div>
                     
                     <div class="form-group">
                        <label for="landmark" class="text-dark font-weight-bold">Landmark</label>
                        <form:input type="text" path="landmark" placeholder="Enter Landmark" class="form-control" id="landmark" aria-describedby="landmark" required="required"/>
                     </div>
                     
                     <div class="form-group">
                        <label for="area" class="text-dark font-weight-bold">Area</label>
                        <form:select path="area" id="area" class="form-control" aria-describedby="area" required="required" onchange="setPincode(this);">
                        	<option value=""> -- Select --</option>
						  <jstl:forEach items="${areas}" var="area">
						  	<option value="${area.pincode}">${area.name}</option>
						  </jstl:forEach><br>
						</form:select>
                     </div>
                     
                     <input type="hidden" name="hiddenArea" id="hiddenArea">
                     
                     <div class="form-group">
                        <label for="pincode" class="text-dark font-weight-bold">Pincode</label>
                        <form:input type="number" path="pincode" placeholder="Enter Pincode" class="form-control" id="pincode" aria-describedby="pincode" required="required" readonly="true"/>
                     </div>
                     
                     <input type="submit" value="Submit	" class="btn text-white btn-block" style="background-color: #5e2572;">
                     
                     <form:hidden path="type" value="Home"/>
                     
                  </form:form>
                  
               </div>
            </div>
         </div>
      </div>
      
      <script type="text/javascript" src="chefResources/js/chef.js"></script>
      
   </body>
</html>