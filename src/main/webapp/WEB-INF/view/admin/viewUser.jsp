<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Homion Admin - View User</title>
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
							<h4 class="card-title">Manage User</h4>
							<div class="row">
								<div class="col-12">
									<div class="table-responsive">
										<table id="order-listing" class="table">
											<thead>
												<tr>
													<th>User Name</th>
													<th>Name</th>
													<th>Mobile No.</th>
													<th>Email</th>
													<th>Address</th>
													<th>PIN Code</th>
													<th>Actions</th>
												</tr>
											</thead>
											<tbody>
											<jstl:forEach items="${userData}" var="userData">
												<tr>
													<td>${userData.key.userName}</td>
													<td>${userData.key.firstName}</td>
													<td>${userData.key.mobileNo}</td>
													<td>${userData.key.login.email}</td>
													<td>
														<jstl:forEach items="${userData.value}" var="address">
															${address.area} <br><br>
														</jstl:forEach> 
													</td>
													<td>
														<jstl:forEach items="${userData.value}" var="address">
															${address.pincode} <br><br>
														</jstl:forEach>
													</td>
													<td>
													<jstl:choose>
														<jstl:when test="${userData.key.status eq 'Active'}">
															<a href="/admin/viewUserAction?id=${userData.key.id}&action=Blocked"><button class="btn btn-outline-danger p-2">Block</button></a>
														</jstl:when>
														<jstl:otherwise>
															<a href="/admin/viewUserAction?id=${userData.key.id}&action=Active"><button class="btn btn-outline-success p-2">Activate</button></a>
														</jstl:otherwise>
													</jstl:choose>
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