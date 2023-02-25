<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Homion Admin - Chef Requests</title>
	<link rel="stylesheet" href="adminResources/css/materialdesignicons.min.css">
	<link rel="stylesheet" href="adminResources/css/dataTables.bootstrap4.css">
	<link rel="stylesheet" href="adminResources/css/style.css">
	<link rel="shortcut icon" href="adminResources/image/fav.png" />
</head>

<body class="sidebar-light">
	<div class="container-scroller">

		<jsp:include page="header.jsp"></jsp:include>

		<div class="container-fluid page-body-wrapper">

			<jsp:include page="menu.jsp"></jsp:include>

			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Chef Requests</h4>
							<div class="row">
								<div class="col-12">
									<div class="table-responsive">
										<table id="order-listing" class="table">
											<thead>
												<tr>
													<th>User Name</th>
													<th>Mobile No.</th>
													<th>E-mail</th>
													<th>PAN number</th>
													<th>Area</th>
													<th>Pincode</th>	
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<jstl:forEach items="${requestedChefsData}" var="requestedChefData">
													<tr>
														<td>${requestedChefData.key.userName}</td>
														<td>${requestedChefData.key.mobileNo }</td>
														<td>${requestedChefData.key.login.email }</td>
														<td>${requestedChefData.key.panNo }</td>
														<td>${requestedChefData.value.area }</td>
														<td>${requestedChefData.value.pincode }</td>
														<td class="text-center">
															<a href="/admin/chefRequestsAction?id=${requestedChefData.key.id}&action=Active"><button class="btn btn-outline-primary p-2" >Accept</button></a>
															<a href="/admin/chefRequestsAction?id=${requestedChefData.key.id}&action=Rejected"><button class="btn btn-outline-danger p-2">Reject</button></a>
														</td>
													</tr>
												</jstl:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<jsp:include page="footer.jsp"></jsp:include>

			</div>
		</div>
	</div>
	
	<script src="adminResources/js/vendor.bundle.base.js"></script>
	<script src="adminResources/js/jquery.dataTables.js"></script>
	<script src="adminResources/js/dataTables.bootstrap4.js"></script>
	<script src="adminResources/js/hoverable-collapse.js"></script>
	<script src="adminResources/js/template.js"></script>
	<script src="adminResources/js/data-table.js"></script>
	
</body>
</html>
