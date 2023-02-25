<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" type="image/png" href="userResources/image/fav.png">
	<title>Homion - Order Placed</title>
	<link href="userResources/css/feather.css" rel="stylesheet" type="text/css">
	<link href="userResources/css/bootstrap.min.css" rel="stylesheet">
	<link href="userResources/css/style.css" rel="stylesheet">
	<link href="userResources/css/demo.css" rel="stylesheet">
</head>

<body>

	<!-- header start -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- header end -->

	<div class="d-none">
		<div class="bg-primary p-3 d-flex align-items-center">
			<a class="toggle togglew toggle-2" href="#"><span></span></a>
			<h4 class="font-weight-bold m-0 text-white">Thanks :)</h4>
		</div>
	</div>
	<div
		class="py-5 osahan-coming-soon d-flex justify-content-center align-items-center">
		<div class="col-md-6">
			<div class="text-center pb-3">
				<h1 class="font-weight-bold">Your order has been placed successfully</h1>
				<p>
					Check your order status in <a href="/user/myOrders"
						class="font-weight-bold text-decoration-none text-primary">My
						Orders</a> about next steps information.
				</p>
			</div>
			<div class="bg-white rounded text-center p-4 shadow-sm">
				<h1><i class="feather-check-circle text-success"></i></h1>
				<h6 class="font-weight-bold mb-2">Order Placed</h6>
				<p class="small text-muted">Your order will be accepted soon !!</p>
				<a href="/user/my-orders"
					class="btn rounded btn-primary btn-lg btn-block">Track My Order</a>
			</div>
		</div>
	</div>
	
	<jsp:include page="bottomMenu.jsp"></jsp:include>

	<!-- footer start -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer end -->

	  <script type="text/javascript" src="userResources/js/user.js"></script>
      <script type="text/javascript" src="userResources/js/jquery.min.js"></script>
      <script type="text/javascript" src="userResources/js/bootstrap.bundle.min.js"></script>
      <script type="text/javascript" src="userResources/js/slick.min.js"></script>
      <script type="text/javascript" src="userResources/js/hc-offcanvas-nav.js"></script>
      <script type="text/javascript" src="userResources/js/osahan.js"></script>
      <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7089c43e/cloudflare-static/rocket-loader.min.js" data-cf-settings="4e43def5a3a50859f7969efd-|49" defer=""></script>
      
</body>
</html>