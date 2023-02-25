<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <link rel="icon" type="image/png" href="../user/userResources/image/fav.png">
   <title>Chef - Reset Password</title>
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
                  <h2>Reset password</h2>
                  <p>Enter a new password.</p>
                  
	              <jstl:if test="${notMatch}">
		          	<div class="alert alert-danger">
		  				<strong>Passwords do not match.</strong>
					</div>
				  </jstl:if>
                  
                  <form action="/chef/resetPassword" class="mt-5 mb-4" method="post">
                     <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password" aria-describedby="password" required>
                     </div>
                      <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" aria-describedby="confirmPassword" required>
                     </div>
                     <button type="submit" class="btn btn-lg text-white btn-block" style="background-color: #5e2572;">Change Password</button>
                  </form>
               </div>
            </div>
         </div>
      </div>
      
</body>
</html>