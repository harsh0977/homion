<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Homion Admin - View Chef</title>
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
							<h4 class="card-title">View Chef</h4>
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
													<th>Status</th>
													<th><center>Action</center></th>
												</tr>
											</thead>
											<tbody>
												<jstl:forEach items="${chefsData}" var="chefData">
													<tr>
														<td>${chefData.key.userName}</td>
														<td>${chefData.key.mobileNo}</td>
														<td>${chefData.key.login.email}</td>
														<td>${chefData.key.panNo}</td>
														<td>${chefData.value.area}</td>
														<td>${chefData.value.pincode}</td>
														<td class="text-center">
															<jstl:choose>
																<jstl:when test="${chefData.key.status eq 'Active'}">
																	<label class="badge badge-success">Active</label>
																</jstl:when>
																<jstl:otherwise>
																	<label class="badge badge-danger">Blocked</label>
																</jstl:otherwise>
															</jstl:choose>
														</td>
														<td class="text-center">
															<jstl:choose>
																<jstl:when test="${chefData.key.status eq 'Blocked'}">
																	<a type="button" href="/admin/viewChefAction?id=${chefData.key.id}&action=Active" class="btn btn-outline-info p-2">Active</a>
																</jstl:when>
																<jstl:otherwise>
																	<a type="button" href="/admin/viewChefAction?id=${chefData.key.id}&action=Blocked" class="btn btn-outline-primary p-2">Block</a>
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
