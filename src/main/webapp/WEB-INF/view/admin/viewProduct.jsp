<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Homion Admin - View Products</title>
	<link rel="stylesheet" href="adminResources/css/materialdesignicons.min.css">
	<link rel="stylesheet" href="adminResources/css/dataTables.bootstrap4.css">
	<link rel="stylesheet" href="adminResources/css/style.css">
	<link rel="shortcut icon" href="adminResources/image/fav.png" />
	
	<script type="text/javascript">
		function getImageSrc(image, name){
			document.getElementById("modalImage").src = image.src;
			document.getElementById("headerName").innerHTML = name;
		}
	</script>
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
							<h4 class="card-title">View Products</h4>
							<div class="row">
								<div class="col-12">
									<div class="table-responsive">
										<table id="order-listing" class="table">
											<thead>
												<tr>
													<th>Product Name</th>
													<th>Image</th>
													<th>Category</th>
													<th>Sub-category</th>
													<th>Price</th>
													<th>Chef User name</th>
												</tr>
											</thead>
											<tbody>
												<jstl:forEach items="${Products}" var="product">
													<tr>
														<td>${product.name }</td>
														<td>
															<button type="button" class="btn" data-toggle="modal" data-target="#imageModal" data-whatever="@mdo">
																<img id="productImage" onclick="getImageSrc(this, '${product.name}')" src="${product.image }" alt="Product Image">
															</button>
														</td>
														<td>${product.category.name }</td>
														<td>${product.subCategory.name }</td>
														<td><i class="mdi mdi-currency-inr menu-icon"></i>${product.price }</td>
														<td>${product.chef.firstName } ${product.chef.lastName }</td>
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

	<!----------------------------------- for modal image ---------------------------------------->
			
     <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
       <div class="modal-dialog" role="document">
         <div class="modal-content">
           <div class="modal-header">
           	 <span id="headerName"></span>
             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
             </button>
           </div>
           <div class="modal-body">
             <img style="height: 100%;width: 100%" id="modalImage">
           </div>
         </div>
       </div>
     </div>
                 
    <!-- -modal end ----------------------------------------------------------------------------------->
    
    <script src="adminResources/js/vendor.bundle.base.js"></script>
	<script src="adminResources/js/jquery.dataTables.js"></script>
	<script src="adminResources/js/dataTables.bootstrap4.js"></script>
	<script src="adminResources/js/hoverable-collapse.js"></script>
	<script src="adminResources/js/template.js"></script>
	<script src="adminResources/js/data-table.js"></script>

</body>
</html>
