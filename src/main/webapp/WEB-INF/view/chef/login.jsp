<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" type="image/png" href="chefResources/image/fav.png">
	<title>Chef - Login</title>
	<link href="chefResources/css/style.css" rel="stylesheet">
	<link href="../user/userResources/css/style.css" rel="stylesheet">
	<link href="chefResources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="chefResources/css/materialdesignicons.min.css">
</head>
	
<body>
      <div class="login-page vh-100">
         <video loop autoplay muted id="vid">
            <source src="chefResources/image/bg.mp4" type="video/mp4">
            <source src="chefResources/image/bg.mp4" type="video/ogg">
            Your browser does not support the video tag.
         </video>
         <div class="d-flex align-items-center justify-content-center vh-100">
            <div class="px-5 col-md-6 ml-auto">
               <div class="px-5 col-10 mx-auto">
                  <h2 class="text-dark my-0">Welcome Back</h2>
                  <p class="text-50">Sign in to continue</p>
                  
                  <jstl:if test="${param.sessionExpired}">
			          	<div class="alert alert-danger">
			  				<strong>Session Expired..!! Please, Login Again.</strong>
						</div>
				  </jstl:if>
				  
				  <jstl:if test="${param.wrongCredentials}">
			          	<div class="alert alert-danger">
			  				<strong>Email or Password is/are incorrect..!!!</strong>
						</div>
				  </jstl:if>
				  
				  <jstl:if test="${param.chefRequested}">
			          	<div class="alert alert-danger">
			  				<strong>Your request is in process. Try again later..!!!</strong>
						</div>
				  </jstl:if>
                  
                  <form:form class="mt-5 mb-4" action="/chef/verifyCredentials" method="post" modelAttribute="login">
                     <div class="form-group">
                        <label for="email" class="text-dark font-weight-bold">Email</label>
                        <form:input type="email" path="email" placeholder="Enter Email" class="form-control" id="email" aria-describedby="email" required="required"/>
                     </div>
                     <div class="form-group">
                        <label for="password" class="text-dark font-weight-bold">Password</label>
                        <form:input type="password" path="password" placeholder="Enter Password" class="form-control" id="password" required="required"/>
                        <div class="input-group-append float-right mr-3" style="font-size:20px;margin-top:-35px">
                        	<i class="mdi mdi-eye text-black" onclick="showPassword()" id="eye"></i>
        					<i class="mdi mdi-eye-off text-black" onclick="showPassword()" id="slashEye" style="display: none;"></i>
        				</div>
                     </div>
                     
                     <form:hidden path="type" value="Chef"/>
                     
                     <input type="submit" value="Sign In" class="btn text-white btn-block" style="background-color: #5e2572;">
                     
                  </form:form>
                  
                  <a href="/chef/forgotPassword" class="text-decoration-none">
                     <p class="text-center text-primary">Forgot your password?</p>
                  </a>
                  <div class="d-flex align-items-center justify-content-center">
                     <a href="/chef/register">
                        <p class="text-center text-primary mt-n2">Don't have an account? Sign up</p>
                     </a>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
      <script type="text/javascript" src="chefResources/js/chef.js"></script>
      
</body>   
</html>