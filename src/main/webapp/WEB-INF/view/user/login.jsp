<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang="en">

   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link rel="icon" type="image/png" href="userResources/image/fav.png">
      <title>Homion - SignIn</title>
      <link href="userResources/css/bootstrap.min.css" rel="stylesheet">
      <link href="userResources/css/style.css" rel="stylesheet">
   </head>
   
   <body>
   
      <div class="login-page vh-100">
         <video loop autoplay muted id="vid">
            <source src="userResources/image/bg.mp4" type="video/mp4">
            <source src="userResources/image/bg.mp4" type="video/ogg">
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
				  
                  <form:form class="mt-5 mb-4" action="/user/verifyCredentials" method="post" modelAttribute="login">
                     <div class="form-group">
                        <label for="email" class="text-dark font-weight-bold">Email</label>
                        <form:input type="email" path="email" placeholder="Enter Email" class="form-control" id="email" aria-describedby="email" required="required"/>
                     </div>
                     <div class="form-group">
                        <label for="password" class="text-dark font-weight-bold">Password</label>
                        <form:input type="password" path="password" placeholder="Enter Password" class="form-control" id="password" required="required"/>
                     </div>
                     
                     <form:hidden path="type" value="User"/>
                     
                     <input type="submit" value="Sign In" class="btn btn-primary btn-lg btn-block">
                     
                  </form:form>
                  <a href="/user/forgotPassword" class="text-decoration-none">
                     <p class="text-center">Forgot your password?</p>
                  </a>
                  <div class="d-flex align-items-center justify-content-center">
                     <a href="/user/register">
                        <p class="text-center m-0">Don't have an account? Sign up</p>
                     </a>
                  </div>
               </div>
            </div>
         </div>
      </div>

   </body>
</html>