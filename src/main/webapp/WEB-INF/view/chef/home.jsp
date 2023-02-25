<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Chef - Home</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" type="image/png" href="chefResources/image/fav.png">
	<link rel="stylesheet" href="chefResources/css/materialdesignicons.min.css">
	<link rel="stylesheet" href="chefResources/css/style.css">
	<link rel="stylesheet" href="chefResources/css/bootstrap.min.css">
</head>

<body class="sidebar-light" onload="reload()">

	<div class="container-scroller">

		<jsp:include page="header.jsp"></jsp:include>

		<div class="container-fluid page-body-wrapper">

			<jsp:include page="menu.jsp"></jsp:include>

			<div class="main-panel own-body">

				<!-- Working area start-->
				
				<ul class="nav nav-pills nav-fill m-3" id="pills-tab-custom" role="tablist">
		            <li class="nav-item ">
		              <a class="nav-link rounded-pill active font-weight-bold font-20" id="new-tab" data-toggle="tab" href="#new-orders" role="tab" aria-controls="new" aria-selected="true">
		               New orders (${newOrders.size()})</a>
		            </li>
		            <li class="nav-item">
		              <a class="nav-link rounded-pill font-weight-bold font-20" id="ongoing-tab" data-toggle="tab" href="#ongoing-orders" role="tab" aria-controls="ongoing" aria-selected="false">
		               Ongoing orders (${ongoingOrders.size()})</a>
		            </li>
		            <li class="nav-item">
		              <a class="nav-link rounded-pill font-weight-bold font-20" id="prepared-tab" data-toggle="tab" href="#prepared-orders" role="tab" aria-controls="prepared" aria-selected="false">
		               Prepared orders (${preparedOrders.size()})</a>
		            </li>
		            <li class="nav-item">
		              <a class="nav-link rounded-pill font-weight-bold font-20" id="cancelled-tab" data-toggle="tab" href="#cancelled-orders" role="tab" aria-controls="cancelled" aria-selected="false">
		              Cancelled orders (${rejectedOrders.size()})</a>
		            </li>
       			 </ul>
	
				<div class="container" id="allOrders">
					<div class="row w-100">
						<div class="tab-content w-75 mx-auto" id="myTabContent">
							
							<!------------------------------------- New orders -------------------------->
							
	                  		<div class="tab-pane fade show active" id="new-orders" role="tabpanel" aria-labelledby="new-tab">
	                  			<div class="w-100" style="display:flex;flex-wrap:wrap">
	                  				<jstl:if test="${fun:length(newOrders) == 0 }">
	                  					<h4 class="mx-auto">No new orders. Please wait for an order to be placed!!</h4>
	                  				</jstl:if>
	                  				<jstl:forEach items="${newOrders}" var="order">
										<div class="m-2 card shadow rounded" style="width:75%;flex: 1 1 500px">
											<div class="card-body"> 
												<h4>
													<span class="text-primary font-weight-bold text-large">${order.user.firstName} ${order.user.lastName }</span> &nbsp;&nbsp;
													<small><span class="font-weight-bold" id="items${order.id}"></span><span class="badge badge-pill badge-primary badge-large float-right"><i class="mdi mdi-currency-inr menu-icon"></i> ${order.amount}</span></small>
												</h4>
												<h6 class="text-muted" id="address${order.id}">${order.address.homeNo }, ${order.address.societyName }, ${order.address.landmark }, ${order.address.area } - ${order.address.pincode }</h6>
												<h6 class="text-muted"><fmt:formatDate value="${order.timestamp}" pattern="dd/MM/yyyy hh:mm a"/></h6>
												<div class="mt-1 w-100 btn-group btn-group-sm">
													<button type="button" class="btn btn-outline-primary border-2 font-weight-bold" onclick = "window.location.href='/chef/acceptOrder?orderId=${order.id}'">ACCEPT</button>
													<button type="button" class="btn btn-outline-primary border-2 font-weight-bold" onclick = "window.location.href='/chef/rejectOrder?orderId=${order.id}'">REJECT</button>
													<button type="button" class="btn btn-outline-primary border-2 font-weight-bold" data-toggle="modal" data-target="#orderDetails" 
													onclick="setModalDetails(${order.id},'${order.user.firstName} ' + '${order.user.lastName }',${order.user.mobileNo}, '${order.timestamp}', ${order.amount})">DETAILS</button>
												</div>
											</div>
										</div>
										<script src="chefResources/js/chef.js"></script>
										<script>countItems(${order.id})</script>
									</jstl:forEach>
	                  			</div>
							</div>
							
							<!------------------------------------- Ongoing orders ------------------------->
							
		                  	<div class="tab-pane fade" id="ongoing-orders" role="tabpanel" aria-labelledby="ongoing-tab">
		                  		<div class="w-100" style="display:flex;flex-wrap:wrap">
		                  			<jstl:if test="${fun:length(ongoingOrders) == 0 }">
	                  					<h4 class="mx-auto">No ongoing orders. Please wait for an order to be placed!!</h4>
	                  				</jstl:if>
		                  			<jstl:forEach items="${ongoingOrders }" var="order">
										<div class="m-2 card shadow rounded" style="width:75%;flex: 1 1 500px">
											<div class="card-body">
												<h4>
													<span class="text-primary font-weight-bold text-large">${order.user.firstName} ${order.user.lastName }</span>&nbsp;&nbsp;
													<small><span class="font-weight-bold" id="items${order.id}"></span><span class="badge badge-pill badge-primary badge-large float-right"><i class="mdi mdi-currency-inr menu-icon"></i> ${order.amount}</span></small>
												</h4>
												<h6 class="text-muted" id="address${order.id}">${order.address.homeNo }, ${order.address.societyName }, ${order.address.landmark }, ${order.address.area } - ${order.address.pincode }</h6>
												<h6 class="text-muted"><fmt:formatDate value="${order.timestamp}" pattern="dd/MM/yyyy hh:mm a"/></h6>
												<div class="mt-1 w-100 btn-group btn-group-sm">
													<button type="button" class="btn btn-outline-primary border-2 font-weight-bold" onclick = "window.location.href='/chef/markReady?orderId=${order.id}'" >MARK READY</button>
													<button type="button" class="btn btn-outline-primary border-2 font-weight-bold" data-toggle="modal" data-target="#orderDetails"
													onclick="setModalDetails(${order.id},'${order.user.firstName} ' + '${order.user.lastName }',${order.user.mobileNo}, '${order.timestamp}', ${order.amount})">DETAILS</button>
												</div>
											</div>
										</div>
										<script src="chefResources/js/chef.js"></script>
										<script>countItems(${order.id})</script>
									</jstl:forEach>
								</div>
							</div>

							<!------------------------------------- Prepared orders ------------------------->

							<div class="tab-pane fade" id="prepared-orders" role="tabpanel" aria-labelledby="prepared-tab">
								<div class="w-100" style="display: flex;flex-wrap: wrap">			                  		
			                  		<jstl:if test="${fun:length(preparedOrders) == 0 }">
	                  					<h4 class="mx-auto">No order is prepared yet.Please make it quick!!</h4>
	                  				</jstl:if>
		                  			<jstl:forEach items="${preparedOrders }" var="order">
										<div class="m-2 card shadow rounded" style="width:75%;flex: 1 1 500px">
											<div class="card-body">
												<h4>
													<span class="text-primary font-weight-bold text-large">${order.user.firstName} ${order.user.lastName }</span>&nbsp;&nbsp;
													<small><span class="font-weight-bold" id="items${order.id}"></span><span class="badge badge-pill badge-primary badge-large float-right"><i class="mdi mdi-currency-inr menu-icon"></i> ${order.amount}</span></small>
												</h4>
												<h6 class="text-muted" id="address${order.id}">${order.address.homeNo }, ${order.address.societyName }, ${order.address.landmark }, ${order.address.area } - ${order.address.pincode }</h6>
												<h6 class="text-muted"><fmt:formatDate value="${order.timestamp}" pattern="dd/MM/yyyy hh:mm a"/></h6>
												<div class="mt-1 w-100 btn-group btn-group-sm">
													<button type="button" class="btn btn-outline-primary border-2 font-weight-bold" onclick = "window.location.href='/chef/markAsDelivered?orderId=${order.id}&flag=home'">MARK AS DELIVERED</button>
													<button type="button" class="btn btn-outline-primary border-2 font-weight-bold" data-toggle="modal" data-target="#orderDetails"
													onclick="setModalDetails(${order.id},'${order.user.firstName} ' + '${order.user.lastName }',${order.user.mobileNo}, '${order.timestamp}', ${order.amount})">DETAILS</button>
												</div>
											</div>
										</div>
										<script src="chefResources/js/chef.js"></script>
										<script>countItems(${order.id})</script>
									</jstl:forEach>
								</div>
							</div>
							
							<!------------------------------------- Cancelled orders ----------------------->
							
		                  	<div class="tab-pane fade" id="cancelled-orders" role="tabpanel" aria-labelledby="cancelled-tab">
		                  		<div class="w-100" style="display: flex;flex-wrap: wrap">
		                  			<jstl:if test="${fun:length(rejectedOrders) == 0 }">
	                  					<h4 class="mx-auto">No rejected orders here!!</h4>
	                  				</jstl:if>			                  		
			                  		<jstl:forEach items="${rejectedOrders}" var="order">
										<div class="m-2 card shadow rounded" style="width:75%;flex: 1 1 500px">
											<div class="card-body">
												<h4>
													<span class="text-primary font-weight-bold text-large">${order.user.firstName} ${order.user.lastName }</span>&nbsp;&nbsp;
													<small><span class="font-weight-bold" id="items${order.id}"></span><span class="badge badge-pill badge-danger badge-large float-right" style="font-size:18	px">REJECTED</small>
												</h4>
												<h6 class="text-muted" id="address${order.id}">${order.address.homeNo}, ${order.address.societyName }, ${order.address.landmark }, ${order.address.area } - ${order.address.pincode }</h6>
												<h6 class="text-muted"><fmt:formatDate value="${order.timestamp}" pattern="dd/MM/yyyy hh:mm a"/></h6>
												<div class="mt-1 w-100 btn-group btn-group-sm">
													<!-- <button type="button" class="btn btn-outline-primary border-2 font-weight-bold disabled">REJECTED</button> -->
													<button type="button" class="btn btn-outline-primary border-2 font-weight-bold" data-toggle="modal" data-target="#orderDetails"
													onclick="setModalDetails(${order.id},'${order.user.firstName} ' + '${order.user.lastName }',${order.user.mobileNo}, '${order.timestamp}', ${order.amount})">DETAILS</button>
												</div>
											</div>
										</div>
									</jstl:forEach>
								</div>
							</div>
									
						</div>
					</div>
				</div>


				<!-- Order Details Modal -->
				<div class="modal" id="orderDetails">
					<div class="modal-dialog">
						<div class="modal-content">

							<!---------------------------------------- Modal Header ----------------------------------------------->
							<div class="modal-header">
								<h5 class="modal-title" id="orderId"> <!-- Order ID through JS --> </h5>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!---------------------------------------- Modal body -------------------------------------------------->
							<div class="modal-body mt-n4">
								<div class="row">
									<div class="col-md-4">
										<i class="mdi mdi-account menu-icon text-primary"></i><span class="font-weight-bold" id="userName"> <!-- User Name through JS --> </span>
									</div>
									<div class="col-md-4">
										<i class="mdi mdi-phone menu-icon text-primary"></i> <span class="font-weight-bold" id="userMobileNo"> <!-- User Mobile no through JS --> </span>
									</div>
								</div>
								<div class="mt-2 row">
									<div class="col-md-12">
										<i class="mdi mdi-map-marker menu-icon text-primary"></i>
										<span id="userAddress"></span>
									</div>
								</div>

								<h5 class="mt-3">Order Details</h5>
								<table class="mt-3 table">
									<thead>
										<tr>
											<th>Item</th>
											<th>Quantity</th>
											<th>Price</th>
										</tr>
									</thead>
									<tbody id="modalItems">
										<jstl:forEach items="${sessionScope.orderItems}" var="item">
											<tr>
												<td>${item.product.name}</td>
												<td>${item.count}</td>
												<td><i class="mdi mdi-currency-inr menu-icon"></i>${item.product.price}</td>
											</tr>
										</jstl:forEach>
									</tbody>
									<tr class="font-weight-bold">
											<td>Total</td>
											<td></td>
											<td><i class="mdi mdi-currency-inr menu-icon"></i> <span id="totalAmount"></span>  </td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>


				<!-- Working area end-->

				<jsp:include page="footer.jsp"></jsp:include>
			</div>
		</div>
	</div>

	<script src="chefResources/js/chef.js"></script>
	<script src="chefResources/js/vendor.bundle.base.js"></script>
	<script src="chefResources/js/hoverable-collapse.js"></script>
	<script src="chefResources/js/template.js"></script>
	<script src="chefResources/js/jquery.min.js"></script>

</body>
</html>
