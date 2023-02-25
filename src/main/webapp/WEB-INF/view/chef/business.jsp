<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>
	
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Chef - Business History</title>
	<link rel="stylesheet" href="chefResources/css/materialdesignicons.min.css">
	<link rel="stylesheet" href="chefResources/css/style.css">
	<link rel="stylesheet" href="chefResources/css/bootstrap.min.css">
	<link rel="stylesheet" href="chefResources/css/switchery.min.css">
	<link rel="shortcut icon" href="chefResources/image/fav.png" />
</head>

<body class="sidebar-light">

	<div class="container-scroller">

		<jsp:include page="header.jsp"></jsp:include>

		<div class="container-fluid page-body-wrapper">

			<jsp:include page="menu.jsp"></jsp:include>

			<div class="main-panel own-body">

				<!-- Working area start-->

				<span><h2 class="mt-3 ml-4 float-left">${chef.firstName } ${chef.lastName }</h2>
					<a href="/chef/businessHistory"
						class="btn btn-outline-primary float-right m-3 rounded-pill">History
					</a>
				</span>
				<h4 class="mt-0 ml-4 text-muted">${chefAddress.area }</h4>

				<div class="own-border-40 bg-primary m-4"></div>

				<div class="m-3 row">
					<div class="col-md-12">
						<div>
							<div>
								<h4>REVENUE DASHBOARD</h4>
								<div class="mt-4 row">
									<div class="col-md-4 text-center">
										<h6 class="text-muted">
											<b>Today's Revenue</b>
										</h6>
										<jstl:choose>
											<jstl:when test="${todaysOrderCount eq 0}">
												<h3 class="text-primary">RS. 0</h3>
											</jstl:when>
											<jstl:otherwise>
												<h3 class="text-primary">RS. ${todaysTotalRevenue}</h3>
											</jstl:otherwise>
										</jstl:choose>
										<h5 class="text-muted">${todaysOrderCount} Orders</h5>
									</div>
									<div class="col-md-4 revenue-center text-center border-primary">
										<h6 class="text-muted">
											<b>Yesterday's Revenue</b>
										</h6>
										<jstl:choose>
											<jstl:when test="${yesterdaysOrderCount eq 0}">
												<h3 class="text-primary">RS. 0</h3>
											</jstl:when>
											<jstl:otherwise>
												<h3 class="text-primary">RS. ${yesterdaysTotalRevenue}</h3>
											</jstl:otherwise>
										</jstl:choose>
										<h5 class="text-muted">${yesterdaysOrderCount} Orders</h5>
									</div>
									<div class="col-md-4 text-center">
										<h6 class="text-muted">
											<b> Week So Far </b>
										</h6>
										<jstl:choose>
											<jstl:when test="${weeksOrderCount eq 0}">
												<h3 class="text-primary">RS. 0</h3>
											</jstl:when>
											<jstl:otherwise>
												<h3 class="text-primary">RS. ${weeksTotalRevenue}</h3>
											</jstl:otherwise>
										</jstl:choose>
										<h5 class="text-muted">${weeksOrderCount } Orders</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="own-border-75 bg-primary m-4"></div>

				<h4 class="ml-4 mb-4 mt-3">PERFORMANCE IN LAST WEEK</h4>

				<div class="container">
					<div class="row ml-5">
						<div class="col-lg-3 col-sm-6 col-6">
							<div class="rounded-circle circle border-light mt-2 float-left"></div>
							<h6 class="mt-2 ml-4">Total Orders</h6>
						</div>
						<div class="col-lg-3 col-sm-6 col-6">
							<div class="rounded-circle circle border-warning mt-2 float-left"></div>
							<h6 class="mt-2 ml-4 ">Delivered</h6>
						</div>
						<div class="col-lg-3 col-sm-6 col-6">
							<div class="rounded-circle circle border-danger mt-2 float-left"></div>
							<h6 class="mt-2 ml-4 ">Cancelled</h6>
						</div>
					</div>
				</div>
				<!-- bar-chart -->
				<div class="row m-3">
					<div class="w-75 ml-5">
						<div id="apex-bar-chart"></div>
					</div>
				</div>

			<jsp:include page="footer.jsp"></jsp:include>

		</div>

	<script src="chefResources/js/vendor.bundle.base.js"></script>
	<script src="chefResources/js/hoverable-collapse.js"></script>
	<script src="chefResources/js/template.js"></script>
	<script src="chefResources/js/jquery.min.js"></script>
	<!-- Apex js -->
	<script src="chefResources/js/apexcharts.min.js"></script>
	<script src="chefResources/js/custom-chart-apex.js"></script>
	
</body>
</html>

