<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang="en">

   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link rel="icon" type="image/png" href="../user/userResources/image/fav.png">
      <title>Homion - Forgot Password</title>
      <link href="../user/userResources/css/bootstrap.min.css" rel="stylesheet">
      <link href="../user/userResources/css/style.css" rel="stylesheet">
   </head>
   
   <body>
      <div class="osahan-signup login-page">
         <video loop autoplay muted id="vid">
            <source src="../user/userResources/image/bg.mp4" type="video/mp4">
            <source src="../user/userResources/image/bg.mp4" type="video/ogg">
            Your browser does not support the video tag.
         </video>
         <div class="d-flex align-items-center justify-content-center flex-column vh-100">
            <div class="px-5 col-md-6 ml-auto">
               <div class="px-5 col-10 mx-auto">
                  <h2>Forgot password</h2>
                  <p>Enter your email address below and we'll send you an email with instructions on how to change your password</p>
                  
                  <jstl:if test="${param.invalidEmail}">
		          	<div class="alert alert-danger">
		  				<strong>Email does not exist.</strong>
					</div>
				  </jstl:if>
				  
                  <form action="/user/verifyOTP" class="mt-5 mb-4" method="post">
                     <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" required>
                     </div>
                     <button type="submit" class="btn btn-lg btn-primary text-white btn-block">Send</button>
                  </form>
               </div>
            </div>
         </div>
      </div>
      
   </body>
</html>