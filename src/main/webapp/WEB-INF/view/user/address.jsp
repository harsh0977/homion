<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" type="image/png" href="userResources/image/fav.png">
	<title>Homion - Manage Address</title>
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

				<!-- ******************* -->
				<jsp:include page="prof.jsp"></jsp:include>
				<!-- ******************* -->
				
				<div class="col-md-8 mb-3">
					<div class="rounded shadow-sm">
						<div class="d-flex flex-column">
						<h6 class="mb-3 font-weight-bold">Delivery Address</h6>
							<div class="row">
									<jstl:forEach items="${addresses}" var="address">
										<div class="custom-control col-lg-6 custom-radio mb-3 position-relative border-custom-radio">
											<input type="radio" id="${address.id}" name="address" class="custom-control-input" checked> 
											<label class="custom-control-label w-100" for="${address.id}">
												<div>
													<div class="p-3 bg-white rounded shadow-sm w-100">
														<div class="d-flex align-items-center mb-2">
															<h6 class="mb-0">${address.type }</h6>
															<!-- <p class="mb-0 badge badge-success ml-auto">
																<i class="icofont-check-circled"></i> Default
															</p> -->
														</div>
														<p class="small text-muted m-0">${address.homeNo} / ${address.societyName},</p>
														<p class="small text-muted m-0">${address.landmark}, ${address.area} - ${address.pincode}</p>
													</div>
													<a data-toggle="modal" data-target="#exampleModal"
														class="btn btn-block btn-light border-top"
														onclick="setForm(${address.id}, '${address.type }', ${address.homeNo}, '${address.societyName}', '${address.landmark}', '${address.area}', ${address.pincode})">Edit</a>
												</div>
											</label>
										</div>
									</jstl:forEach>
								<!-- <div
									class="custom-control col-lg-6 custom-radio position-relative border-custom-radio">
									<input type="radio" id="customRadioInline2" name="customRadioInline1"
										class="custom-control-input"> <label
										class="custom-control-label w-100" for="customRadioInline2">
										<div>
											<div class="p-3 rounded bg-white shadow-sm w-100">
												<div class="d-flex align-items-center mb-2">
													<h6 class="mb-0">Work</h6>
													<p class="mb-0 badge badge-light ml-auto">
														<i class="icofont-check-circled"></i> Select
													</p>
												</div>
												<p class="small text-muted m-0">Model Town, Ludhiana</p>
												<p class="small text-muted m-0">Punjab 141002, India</p>
											</div>
											<a href="#" data-toggle="modal" data-target="#exampleModal"
												class="btn btn-block btn-light border-top">Edit</a>
										</div>
									</label>
								</div> -->
							</div>
							<a class="btn btn-primary mt-2" href="#" data-toggle="modal" data-target="#exampleModal" onclick="resetForm()"> ADD NEW ADDRESS </a>
						</div>
					</div>
				</div>
			</div>
			
			
			<jsp:include page="bottomMenu.jsp"></jsp:include>
			
			
		</div>
	</div>
	
	
	<!-- Add address Start -->
							
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Add Delivery Address</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form:form action="/user/addAddress" method="post" modelAttribute="address" id="addressForm">
					<div class="modal-body">
						<form:hidden path="id" id="addressId"/>
							<div class="form-row">
								<div class="col-md-12 form-group">
									<label class="form-label">Home No/ Flat No</label>
									<div class="input-group">
										<form:input path="homeNo" placeholder="Home No/ Flat No" id="homeNo" type="number" class="form-control" required="required"/>
										<div class="input-group-append">
											<button type="button" class="btn btn-outline-secondary">
												<i class="fad fa-location"></i>
											</button>
										</div>
									</div>
								</div>
								<div class="col-md-12 form-group">
									<label class="form-label">Society Name</label>
									<form:input path="societyName" placeholder="Society Name" id="societyName" type="text" class="form-control" required="required"/>
								</div>
								<div class="col-md-12 form-group">
									<label class="form-label">Landmark</label>
									<form:input path="landmark" placeholder="Landmark" id="landmark" type="text" class="form-control" required="required"/>
								</div>
								<div class="col-md-12 form-group">
									<label class="form-label">Area</label>
									<form:select path="area" placeholder="state" id="area" type="text" class="form-control" onchange="setPincode(this);" required="required">
										<option value=""> -- Select --</option>
										<jstl:forEach items="${areas}" var="area">
											<form:option value="${area.pincode}">${area.name}</form:option>
										</jstl:forEach>
									</form:select>
								</div> 
								
								<input type="hidden" name="hiddenArea" id="hiddenArea">
								
								<div class="col-md-12 form-group">
									<label class="form-label">Pin Code </label>
									<form:input path="pincode" placeholder="PIN Code" id="pincode" type="text" class="form-control" required="required"  readonly="true"/>
								</div>
								<div class="mb-0 col-md-12 form-group">
									<label class="form-label">Type</label>
									<div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
										<label class="btn btn-outline-secondary active"  id="Home"> 
											<form:radiobutton path="type" value="Home"/> Home 
										</label> 
										<label class="btn btn-outline-secondary"  id="Work"> 
											<form:radiobutton path="type"  value="Work"/> Work 
										</label> 
										<label class="btn btn-outline-secondary"  id="Other"> 
											<form:radiobutton path="type" value="Other"/> Other
										</label>
									</div>
								</div>
							</div>
						</div>
					<div class="modal-footer p-0 border-0">
						<div class="col-6 m-0 p-0">
							<button type="button" class="btn border-top btn-lg btn-block" data-dismiss="modal">Close</button>
						</div>
						<div class="col-6 m-0 p-0">
							<input type="submit" class="btn btn-primary btn-lg btn-block" value="Save changes"/>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<!-- Add address End -->
								
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
