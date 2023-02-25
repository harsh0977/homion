<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <link rel="icon" type="image/png" href="user/userResources/image/fav.png">
   <title>Homion - The Taste of Home</title>
   <link href="user/userResources/css/bootstrap.min.css" rel="stylesheet">
   <link href="user/userResources/css/style.css" rel="stylesheet">
</head>
   
<body>
      <div class="login-page vh-100">
         <video loop autoplay muted id="vid">
            <source src="user/userResources/image/bg.mp4" type="video/mp4">
            <source src="user/userResources/image/bg.mp4" type="video/ogg">
            Your browser does not support the video tag.
         </video>
         <div class="d-flex justify-content-center">
            <div class="px-5 col-md-6 ml-auto">
               <div class="px-5 col-10 mx-auto">
               	  <div>
               	  	<h1 class="text-primary mt-5">Homion</h1>
               		<h6 class="text-primary my-0">Continue As ...</h6><br>
               		<div class="row">
	                  	<div class="mt-1 col-sm-6">
		                  	<figure>
							  <a href="/chef/login"><img src="user/userResources/image/chef.jpg" class="rounded" height="100%" width="100%"></a>
							  <figcaption class="mt-1 text-dark text-center h4">Chef</figcaption>
							</figure>
	                  	</div>
	                  	<div class="col-sm-6">
	                  		<figure>
							  <a href="/user/login"><img src="user/userResources/image/user1.jpg" class="rounded" height="95%" width="100%"></a>
							  <figcaption class="mt-1 text-dark text-center h4">User</figcaption>
							</figure>
	                  	</div>
	                </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
</body>
</html>