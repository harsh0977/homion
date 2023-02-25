<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" type="image/png" href="userResources/image/fav.png">
	<title>Homion - Contact Us</title>
	<link href="userResources/css/feather.css" rel="stylesheet" type="text/css">
	<link href="userResources/css/bootstrap.min.css" rel="stylesheet">
	<link href="userResources/css/style.css" rel="stylesheet">
	<link href="userResources/css/demo.css" rel="stylesheet">
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
				
				<!-- *********************************** -->
				<jsp:include page="prof.jsp"></jsp:include>
				<!-- *********************************** -->
				
				<div class="col-md-8 mb-3">
					<div class="rounded shadow-sm">
						<div
							class="osahan-cart-item-profile bg-white rounded shadow-sm p-4">
							<div class="flex-column">
								<h6 class="font-weight-bold">Tell us about yourself</h6>
								<p class="text-muted">Whether you have questions or you
									would just like to say hello, contact us.</p>
								<form action="">
									<div class="form-group">
										<label for="exampleFormControlInput1"
											class="small font-weight-bold">Your Name</label> <input
											type="text" class="form-control"
											id="exampleFormControlInput1" required>
									</div>
									<div class="form-group">
										<label for="exampleFormControlInput2"
											class="small font-weight-bold">Email Address</label> <input
											type="email" class="form-control"
											id="exampleFormControlInput2"
											required>
									</div>
									<div class="form-group">
										<label for="exampleFormControlInput3"
											class="small font-weight-bold">Phone Number</label> <input
											type="number" class="form-control"
											id="exampleFormControlInput3" required>
									</div>
									<div class="form-group">
										<label for="exampleFormControlTextarea1"
											class="small font-weight-bold">HOW CAN WE HELP YOU?</label>
										<textarea class="form-control"
											id="exampleFormControlTextarea1"
											placeholder="Hi there, I would like to ..." rows="3" required></textarea>
									</div>
									<input class="btn btn-primary btn-block" type="submit" value="SUBMIT">
								</form>
								<!-- <div class="mapouter pt-3">
									<div class="gmap_canvas">
										<iframe width="100%" height="100%" id="gmap_canvas"
											src="https://maps.google.com/maps?q=dugri%20ludhiana&t=&z=13&ie=UTF8&iwloc=&output=embed"
											frameborder="0" scrolling="no" marginheight="0"
											marginwidth="0"></iframe>
									</div>
								</div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<jsp:include page="bottomMenu.jsp"></jsp:include>

	<!-- footer start -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer end -->
	
	<script type="text/javascript" src="../chef/chefResources/js/chef.js"></script>
	<script type="text/javascript" src="userResources/js/jquery.min.js"></script>
	<script type="text/javascript" src="userResources/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="userResources/js/slick.min.js"></script>
	<script type="text/javascript" src="userResources/js/hc-offcanvas-nav.js"></script>
	<script type="text/javascript" src="userResources/js/osahan.js"></script>
	<script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7089c43e/cloudflare-static/rocket-loader.min.js"
		data-cf-settings="c5888850817987817d27ac82-|49" defer=""></script>
		
</body>
</html>