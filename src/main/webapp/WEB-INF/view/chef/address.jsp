<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Chef - Manage Address</title>
	<link rel="stylesheet" href="chefResources/css/materialdesignicons.min.css">
	<link rel="stylesheet" href="chefResources/css/style.css">
	<link rel="stylesheet" href="chefResources/css/bootstrap.min.css">
	<link rel="shortcut icon" href="chefResources/image/fav.png" />
</head>

<body class="sidebar-light">

	<div class="container-scroller">
		
		<jsp:include page="header.jsp"></jsp:include>

		<div class="container-fluid page-body-wrapper">

			<jsp:include page="menu.jsp"></jsp:include>

			<div class="main-panel own-body ml-auto">

				<!-- Working area start-->

				<div class="container mt-5">
					<div class="col-md-12 mb-5">
						<div class="d-flex flex-column">
							<h6 class="mb-3 font-weight-bold">Address</h6>
								<jstl:choose>
									<jstl:when test="${address.id ne 0}">
										<div class="row">
											<div class="custom-control col-lg-6 custom-radio mb-3 border-custom-radio">
												<!-- <input type="radio" id="customRadioInline1" name="address" class="custom-control-input" checked>
												<label class="custom-control-label w-100" for="customRadioInline1"> -->
													<div>
														<div class="p-3 bg-white rounded shadow w-100 ">
															<div class="d-flex align-items-center mb-2">
																<h5 class="mb-0">${fn:toUpperCase(address.type)}</h5>
															</div>
															<h6 class="text-muted mt-1">${address.homeNo}, ${address.societyName},  </h6>
															<h6 class="text-muted m-0">${address.landmark},  ${address.area } - ${address.pincode }</h6>
														</div>
														<a href="" data-toggle="modal" data-target="#exampleModal"
															class="btn btn-block btn-primary border-top">Edit</a>
													</div>
												<!-- </label> -->
											</div>
											<!-- <div
												class="custom-control col-lg-6 custom-radio position-relative border-custom-radio">
												<input type="radio" id="customRadioInline2" name="address"
													class="custom-control-input"> <label
													class="custom-control-label w-100" for="customRadioInline2">
													<div>
														<div class="p-3 rounded bg-white shadow w-100">
															<div class="d-flex align-items-center mb-2">
																<h5 class="mb-0">Work</h5>
																<div class="ml-auto">
																	<h4>
																		<span class="mb-0 float-right badge badge-light text-white"><i
																			class="icofont-check-circled "></i> Select</span>
																	</h4>
																</div>
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
									</jstl:when>
									<jstl:otherwise>
										<a class="btn btn-primary" href="#" data-toggle="modal"
										data-target="#exampleModal"> ADD NEW ADDRESS </a>
									</jstl:otherwise>
							</jstl:choose>
						</div>
					</div>
				</div>

				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-top">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Address</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form:form action="/chef/addAddress" method="post" modelAttribute="address">
							<div class="modal-body">
									<form:hidden path="id"/>
									<div class="form-row">
										<div class="col-md-12 form-group">
											<label class="form-label">Home No/ Flat No</label>
											<div class="input-group">
												<form:input path="homeNo" placeholder="Home No/ Flat No" type="number"
													class="form-control" required="required"/>
											</div>
										</div>
										<div class="col-md-12 form-group">
											<label class="form-label">Society Name</label>
											<form:input path="societyName"
												placeholder="Society Name"
												type="text" class="form-control" required="required"/>
										</div>
										<div class="col-md-12 form-group">
											<label class="form-label">Landmark</label>
											<form:input path="landmark"
												placeholder="Landmark"
												type="text" class="form-control" required="required"/>
										</div>
										<div class="col-md-12 form-group">
											<label class="form-label">Area</label>
											<form:select path="area" placeholder="Area" id="area" type="text" class="form-control" onchange="setPincode(this);" required="required">
												<option value=""> -- Select --</option>
												<jstl:forEach items="${areas}" var="area">
													<form:option value="${area.pincode}">${area.name}</form:option>
												</jstl:forEach>
											</form:select>
										</div> 
										
										<input type="hidden" name="hiddenArea" id="hiddenArea" value="${address.area}">
										
										<div class="col-md-12 form-group">
											<label class="form-label">Pin Code </label>
											<form:input path="pincode" placeholder="PIN Code" id="pincode" type="text" class="form-control" required="required"  readonly="true"/>
										</div>
										
										<%-- <div class="col-md-12 form-group">
											<label class="form-label">State</label>
											<form:select path="state"
												placeholder="state"
												type="text" class="form-control" required="required">
												<jstl:forEach items="${states}" var="states">
														<jstl:if test="${state.name eq states.name }">
															<form:option value="${states.id}" selected=true>${states.name }</form:option>	
														</jstl:if>
														<jstl:if test="${state.name ne states.name }">
															<form:option value="${states.id }">${states.name }</form:option>
														</jstl:if>
												</jstl:forEach>
											</form:select>
										</div> --%>
										
<!-- 										<div class="mb-0 col-md-12 form-group">
											<label class="form-label">Nickname</label>
											<div class="btn-group btn-group-toggle w-100"
												data-toggle="buttons">
												<label class="btn btn-outline-secondary active"> <input
													type="radio" name="options" id="option12" checked>
													Home
												</label> <label class="btn btn-outline-secondary"> <input
													type="radio" name="options" id="option22"> Work
												</label> <label class="btn btn-outline-secondary"> <input
													type="radio" name="options" id="option32"> Other
												</label>
											</div>
										</div> -->
									</div>
							</div>
							<div class="modal-footer p-0 border-0">
								<div class="col-6 m-0 p-0">
									<button type="button" class="btn border-top btn-lg btn-block"
										data-dismiss="modal">Close</button>
								</div>
								<div class="col-6 m-0 p-0">
									<input type="submit" class="btn btn-primary btn-lg btn-block" value="Save changes"/>
								</div>
							</div>
							</form:form>
						</div>
					</div>
				</div>
				
				<!-- footer start -->
				<jsp:include page="footer.jsp"></jsp:include>
				<!-- footer end -->
				
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="../chef/chefResources/js/chef.js"></script>
	<script src="chefResources/js/vendor.bundle.base.js"></script>
	<script src="chefResources/js/hoverable-collapse.js"></script>
	<script src="chefResources/js/template.js"></script>
	<script src="chefResources/js/jquery.min.js"></script>

</body>
</html>