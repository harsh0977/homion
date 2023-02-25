<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" type="image/png" href="userResources/image/fav.png">
	<title>Profile - ${user.firstName} ${user.lastName}</title>
	<link href="userResources/css/feather.css" rel="stylesheet" type="text/css">
	<link href="userResources/css/bootstrap.min.css" rel="stylesheet">
	<link href="userResources/css/style.css" rel="stylesheet">
	<link href="userResources/css/demo.css" rel="stylesheet">
	<script>
	function changeContent(page){
		console.log(page);
	     $("#loadHere").load(page);
	   }
	</script>
</head>


<body class="fixed-bottom-bar">
	
	<!-- header start -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- header end -->

	<div class="osahan-profile">
		<div class="d-none">
			<div class="bg-primary border-bottom p-3 d-flex align-items-center">
				<a class="toggle togglew toggle-2" href="#"><span></span></a>
				<h4 class="font-weight-bold m-0 text-white">Profile</h4>
			</div>
		</div>
		<div class="container position-relative">
			<div class="py-5 osahan-profile row">
				
				<!-- ******************* -->
				<jsp:include page="prof.jsp"></jsp:include>
				<!-- ******************* -->
				
				<div class="col-md-8 mb-3">
					<div class="rounded shadow-sm p-4 bg-white">
						<div class="d-flex flex-column" id = "loadHere">
							<h5 class="mb-4">My account</h5>
							<div id="edit_profile">
								<div>
								
									<form:form action="/user/saveChanges" method="post" modelAttribute="user">
										<div class="form-group">
											<label for="userName">User Name</label>
											<form:input path="userName" type="text" class="form-control" id="userName" required="required"/>
										</div>
										<div class="form-group">
											<label for="firstName">First Name</label>
											<form:input path="firstName" type="text" class="form-control" id="firstName" required="required"/>
										</div>
										<div class="form-group">
											<label for="lastName">Last Name</label>
											<form:input path="lastName" type="text" class="form-control" id="lastName" required="required"/>
										</div>
										<div class="form-group">
											<label for="email">Email</label>
											<form:input path="login.email" type="email" class="form-control" id="email" required="required" readonly="true"/>
										</div>
										<div class="form-group">
											<label for="mobileNo">Mobile No</label>
											<form:input path="mobileNo" type="number" class="form-control" id="mobileNo" required="required" readonly="true"/>
										</div>
										<div class="text-center">
											<button type="submit" class="btn btn-primary btn-block">Save Changes</button>
										</div>
										
										<form:hidden path="id"/>
								        <form:hidden path="login.id"/>
								        <form:hidden path="login.password"/>
								        <form:hidden path="login.type"/>
									</form:form>
									
								</div>
								
								<!-- <div class="additional">
									<div class="change_password my-3">
										<a href="/user/forgot-password"
											class="p-3 border rounded bg-white btn d-flex align-items-center">Change Password <i class="feather-arrow-right ml-auto"></i>
										</a>
									</div>
									<div class="deactivate_account">
										<a href="/user/forgot-password"
											class="p-3 border rounded bg-white btn d-flex align-items-center">Deactivate Account <i class="feather-arrow-right ml-auto"></i>
										</a>
									</div>
								</div> -->
								
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- bottom menu start -->
			<jsp:include page="bottomMenu.jsp"></jsp:include>
			<!-- bottom menu end -->
			
		</div>
	</div>
	
	<!-- footer start -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer end -->


      <script type="text/javascript" src="userResources/js/jquery.min.js"></script>
      <script type="text/javascript" src="userResources/js/bootstrap.bundle.min.js"></script>
      <script type="text/javascript" src="userResources/js/slick.min.js"></script>
      <script type="text/javascript" src="userResources/js/hc-offcanvas-nav.js"></script>
      <script type="text/javascript" src="userResources/js/osahan.js"></script>
      <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7089c43e/cloudflare-static/rocket-loader.min.js" data-cf-settings="4e43def5a3a50859f7969efd-|49" defer=""></script>
		
</body>
</html>