<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Chef - Manage Products</title>
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
      
      <div class="main-panel own-body">

       		<!-- Working area start-->

	        <span>
	          <h4 class="mt-3 ml-4 float-left">Manage Products</h4>
	          <a href="addProduct"> <button type="button" class="btn btn-outline-primary border-2 float-right m-3 font-weight-bold" >ADD</button> </a>
	        </span>
	
	
	        <div class="container mt-n4">
	          <div class="row">
	            <div class="tab-content col-md-9 mx-auto">
	              <div class=order-body">
					
					<jstl:forEach items="${products}" var="product">
		                <div class="pb-3">
		                   <div class="p-3 rounded shadow-sm bg-white">
		                      <div class="d-flex">
		                         <div class="text-muted mr-3 text-center">
		                            <img alt="productImage" src="${product.image}" class="img-fluid order_img rounded"><br>
		                            <h6><span class="mt-2 badge text-white badge-info"> <i class="mdi mdi-star"></i> ${product.rating} (${product.count}+)</span></h6>
		                         </div>
		                         <div>
		                            <p class="mb-2 h5 font-weight-bold">${product.name}</p>
		                            <p class="mb-2 h6 font-weight-normal">${product.subCategory.name}, ${product.category.name}</p>
		                            <p class="h6 font-weight-normal"><i class="mdi mdi-currency-inr"></i>${product.price} Per ${product.unitValue} ${product.unit}.</p>
		                         </div>
		                         <div class="ml-auto">
		                            <h5><span class="badge text-white badge-primary">${product.preparationTime} Minutes</span></h5>
		                            <form action="/chef/editProduct" method="post">
		                            	<input type="hidden" name="id" value="${product.id}">
		                            	<input type="submit" value="Edit" class="mt-1 btn btn-sm btn-outline-primary float-right"><br>
		                            </form>
		                            <form action="/chef/deleteProduct" method="post">
		                            	<input type="hidden" name="id" value="${product.id}">
		                            	<input type="submit" value="Delete" class="mt-1 btn btn-sm btn-outline-primary float-right"><br>
		                            </form>
		                         </div>
		                      </div>
		                   </div>
		                </div>
	                </jstl:forEach>
	
	              </div>
	            </div>
	          </div>
	        </div>
	
	        <!-- Working area end-->         

      </div>
    </div>
    
    <jsp:include page="footer.jsp"></jsp:include>
    
  </div>
  
  <script src="chefResources/js/chef.js"></script>
  <script src="chefResources/js/vendor.bundle.base.js"></script>
  <script src="chefResources/js/hoverable-collapse.js"></script>
  <script src="chefResources/js/template.js"></script>
  <script src="chefResources/js/jquery.min.js"></script>

</body>
</html>

