<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Askbootstrap">
<meta name="author" content="Askbootstrap">
<link rel="icon" type="image/png" href="userResources/image/fav.png">
<title>Swiggiweb - Online Food Ordering Website Template</title>

<link rel="stylesheet" type="text/css"
	href="userResources/css/slick.min.css" />
<link rel="stylesheet" type="text/css"
	href="userResources/css/slick-theme.min.css" />

<link href="userResources/css/feather.css" rel="stylesheet"
	type="text/css">

<link href="userResources/css/bootstrap.min.css" rel="stylesheet">

<link href="userResources/css/style.css" rel="stylesheet">

<link href="userResources/css/demo.css" rel="stylesheet">
</head>
<body class="bg-white">

	<!-- header start -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- header end -->

	<div class="d-none">
		<div
			class="bg-primary border-bottom p-3 d-flex align-items-center mb-4">
			<a class="toggle togglew toggle-2" href="#"><span></span></a>
			<h4 class="font-weight-bold m-0 text-white">Location</h4>
		</div>
	</div>
	<div class="location-page container">
		<div
			class="d-flex align-items-center justify-content-center flex-column py-5">
			<img alt="#" src="userResources/image/location.png" class="img-fluid"
				alt="Responsive image">
			<div class="px-4 text-center mt-4">
				<h5 class="text-dark">Hi, nice to meet you!</h5>
				<p class="mb-5">Choose your location to start find restaurants
					around you.</p>
				<a href="home.jsp" class="btn btn-lg btn-primary btn-block my-4"><i
					class="feather-navigation"></i> Use current location</a>
			</div>
		</div>
	</div>

	<!-- footer start -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer end -->

	<div
		class="osahan-menu-fotter fixed-bottom bg-white px-3 py-2 text-center d-none">
		<div class="row">
			<div class="col selected">
				<a href="home.jsp"
					class="text-danger small font-weight-bold text-decoration-none">
					<p class="h4 m-0">
						<i class="feather-home text-danger"></i>
					</p> Home
				</a>
			</div>
			<div class="col">
				<a href="most-popular.jsp"
					class="text-dark small font-weight-bold text-decoration-none">
					<p class="h4 m-0">
						<i class="feather-map-pin"></i>
					</p> Trending
				</a>
			</div>
			<div class="col bg-white rounded-circle mt-n4 px-3 py-2">
				<div class="bg-danger rounded-circle mt-n0 shadow">
					<a href="checkout.jsp"
						class="text-white small font-weight-bold text-decoration-none">
						<i class="feather-shopping-cart"></i>
					</a>
				</div>
			</div>
			<div class="col">
				<a href="favourites.jsp"
					class="text-dark small font-weight-bold text-decoration-none">
					<p class="h4 m-0">
						<i class="feather-heart"></i>
					</p> Favorites
				</a>
			</div>
			<div class="col">
				<a href="profile.jsp"
					class="text-dark small font-weight-bold text-decoration-none">
					<p class="h4 m-0">
						<i class="feather-user"></i>
					</p> Profile
				</a>
			</div>
		</div>
	</div>

	<script type="26d17b7faa9b65f34caa7ea9-text/javascript"
		src="userResources/js/jquery.min.js"></script>
	<script type="26d17b7faa9b65f34caa7ea9-text/javascript"
		src="userResources/js/bootstrap.bundle.min.js"></script>

	<script type="26d17b7faa9b65f34caa7ea9-text/javascript"
		src="userResources/js/slick.min.js"></script>

	<script type="26d17b7faa9b65f34caa7ea9-text/javascript"
		src="userResources/js/hc-offcanvas-nav.js"></script>

	<script type="26d17b7faa9b65f34caa7ea9-text/javascript"
		src="userResources/js/osahan.js"></script>
	<script
		src="https://ajax.cloudflare.com/cdn-cgi/scripts/7089c43e/cloudflare-static/rocket-loader.min.js"
		data-cf-settings="26d17b7faa9b65f34caa7ea9-|49" defer=""></script>
</body>
</html>