<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Homion - Admin</title>
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
							<h4 class="card-title">Complaints</h4>
							<div class="row">
								<div class="col-12">
									<div class="table-responsive">
										<table id="order-listing" class="table">
											<thead>
												<tr>
													<th>User name</th>
													<th>Subject</th>
													<th>Description</th>
													<th>Time & Date</th>
													<th>Status</th>
												</tr>
											</thead>
											<tbody>
													<tr>
														<td>dixit99</td>
														<td>Delivery issue</td>
														<td>Wrong item was delivered</td>
														<td>11:10:20::30/03/2021</td>
														<td><a href="/complaintReply"><button class="btn btn-outline-primary">Reply</button></a></td>
													</tr>
													
													<tr>
														<td>dixit99</td>
														<td>Delivery issue</td>
														<td>Wrong item was delivered</td>
														<td>11:10:20::30/03/2021</td>
														<td><label class="badge badge-success">Closed</label></td>
													</tr>
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
