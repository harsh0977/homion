<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Chef - Add Product</title>
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
	        
	        <form:form action="/chef/saveProduct" method="post" modelAttribute="product" enctype="multipart/form-data">
				
				<div class="mt-4 row text-center">
		          <div class="col-md-12">
		          	<div>
			          	<jstl:choose>
							<jstl:when test="${product.image ne 'NoImage'}">
								<img id="image" src="${product.image}" alt="Product Image" class="rounded-circle" style="height: 250px;">
							</jstl:when>
							<jstl:otherwise>
								<img id="image" src="chefResources/image/defaultProduct.png" alt="Profile Image" class="rounded-circle" style="height: 250px;">						
							</jstl:otherwise>
						</jstl:choose>
						<div><i class="mdi mdi-camera menu-icon text-primary" style="font-size: 22px;" onclick="openFileDialog()"></i></div>
						<input type="file" id="file" name="file" hidden="true" accept="image/*" onchange="setImage(event);">
					</div>
		          </div>
		        </div>
		        
		        <h4 class="ml-3 mt-3">Add Product</h4>
		        <div class="ml-3 own-border bg-primary"></div>
		
		        <div class="mt-3 container font-weight-bold">
		          <label for="productName">Product Name</label>
		          <form:input type="text" path="name" class="w-100 form-control" id="productName" name="productName" required="required"/>
		        </div>
		        
		        <div class="mt-3 container font-weight-bold">
		          <label for="category">Category</label>
		          <form:select path="category.id" class="w-100 form-control" style="color: #495057;">
		          		<jstl:forEach items="${categories}" var="category">
						  	<option value="${category.id}">${category.name}</option>
						</jstl:forEach>
		          </form:select>
		        </div>
		        
		        <div class="mt-3 container font-weight-bold">
		          <label for="subCategory">Sub Category</label>
		          <form:select path="subCategory.id" class="w-100 form-control" style="color: #495057;">
		          		<jstl:forEach items="${subCategories}" var="subCategory">
						  	<option value="${subCategory.id}">${subCategory.name}</option>
						</jstl:forEach>
		          </form:select>
		        </div>
		        
		        <div class="mt-3 container font-weight-bold">
			          <div><label for="Price">Price</label></div>
			          <div class="mr-2 w-25 float-left">
				          <form:input path="price" type="number" min="0" class="w-100 form-control" id="price" name="price" required="required"/>
				      </div>
			          <div class="m-2 float-left">Per</div>
			          <div class="ml-2 w-25 float-left">
				          <form:input path="unitValue" type="number" min="0" class="w-100 form-control" id="unitValue" name="unitValue" required="required"/>
				      </div>
				      <div class="ml-3 w-25 float-left">
				      	  <form:select path="unit" class="form-control" style="color: #495057;">
							 <form:option value="gm"/>
							 <form:option value="ml"/>
							 <form:option value="piece"/>
				          </form:select>
				      </div>
		        </div><br><br>
		        
		        <div class="mt-2 container font-weight-bold">
		          <label for="preparationTime">Preparation Time (In minutes)</label>
		          <form:input type="int" path="preparationTime" class="w-100 form-control" id="preparationTime" name="preparationTime" required="required"/>
		        </div>
		        
		        <div class="mt-4 form-inline container">
		          <label class="mb-3 font-weight-bold">Open for making dish at customer's place : </label>
		          <div class="ml-4 mt-n1 form-check form-check-primary">
		            <label class="form-check-label">
		            	<form:radiobutton path="openForHome" value="true" class="form-check-input"/> Yes <i class="input-helper"></i>
		            </label>
		          </div>
		          <div class="ml-4 mt-n1 form-check form-check-primary">
		            <label class="form-check-label">
		            	<form:radiobutton path="openForHome" value="false" class="form-check-input"/> No <i class="input-helper"></i>
		            </label>
		          </div>
		        </div>
		        
		        <div class="mt-2 form-inline container">
		          <label class="mb-3 font-weight-bold">Is jain available : </label>
		          <div class="ml-4 mt-n1 form-check form-check-primary">
		            <label class="form-check-label">
		            	<form:radiobutton path="jainAvailable" value="true" class="form-check-input"/> Yes <i class="input-helper"></i>
		            </label>
		          </div>
		          <div class="ml-4 mt-n1 form-check form-check-primary">
		            <label class="form-check-label">
		            	<form:radiobutton path="jainAvailable" value="false" class="form-check-input"/> No <i class="input-helper"></i>
		            </label>
		          </div>
		        </div>
		        
		        <div class="mt-2 form-inline container">
		          <label class="mb-3 font-weight-bold">Is this your speciality : </label>
		          <div class="ml-4 mt-n1 form-check form-check-primary">
		            <label class="form-check-label">
		            	<form:radiobutton path="speciality" value="true" class="form-check-input"/> Yes <i class="input-helper"></i>
		            </label>
		          </div>
		          <div class="ml-4 mt-n1 form-check form-check-primary">
		            <label class="form-check-label">
		            	<form:radiobutton path="speciality" value="false" class="form-check-input"/> No <i class="input-helper"></i>
		            </label>
		          </div>
		        </div>
	        	
	        	 <form:hidden path="id"/>
	        	 
	        	 <div class="mt-3 container text-center">
	        	 <jstl:choose>
	        	 	<jstl:when test="${product.id eq 0}">
		          		<button type="submit" class="btn btn-outline-primary border-2 font-weight-bold">ADD</button>
		         	</jstl:when>
		         	<jstl:otherwise>
		          		<button type="submit" class="btn btn-outline-primary border-2 font-weight-bold">UPDATE</button>
		         	</jstl:otherwise>
		         </jstl:choose>
		        </div>
	        	 
	        	 <form:hidden path="image"/>
	        </form:form>
			
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

