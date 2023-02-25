<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Chef - Menu</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="chefResources/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="chefResources/css/style.css">
  <link rel="stylesheet" href="chefResources/css/bootstrap.min.css">
  <link rel="shortcut icon" href="chefResources/image/fav.png" />
  
  <script type="text/javascript">
    $(function () {
    	$('[data-toggle="tooltip"]').tooltip()
    })
  </script>
  
</head>

<body class="sidebar-light">

  <div class="container-scroller">
	
	<jsp:include page="header.jsp"></jsp:include>
    
    <div class="container-fluid page-body-wrapper">

		<jsp:include page="menu.jsp"></jsp:include>
      
      <div class="main-panel own-body">

        <!-- Working area start-->

          
        <div class="m-2">
          <h2 class="m-2 float-left">Menu</h2>
          <%-- <div class="mr-3 mt-3 font-weight-bold">	
               <select name='category' class="btn float-right">
		    <option>--Select Cuisine--</option>
		    <jstl:forEach items="${Category}" var="category">
		            <option value="${catgory.name }">${category.name }</option>
		    </jstl:forEach>
		</select>
          </div> --%>
        </div>
          
		<div class="row ml-5">		
            <div class="w-100" style="display: flex;flex-wrap: wrap">
            	<jstl:forEach items="${regularProducts }" var="product" varStatus="count">
	              <div class="mt-1 m-3 card shadow rounded" style="max-width:45%;flex:500px">
	                <div class="card-body">
		                <jstl:choose>
			                <jstl:when test="${product.status eq 'available'}">
			                  	<h4>${product.name } <span class="badge badge-pill badge-primary float-right"> Available</h4> </span>	
			                </jstl:when>
			                <jstl:otherwise>
			                  	<h4>${product.name } <span class="badge badge-pill badge-primary float-right"> Out Of Stock</h4> </span>
			                </jstl:otherwise>
		                </jstl:choose>
		                <h5 class="text-muted">${product.category.name } | ${product.unitValue } ${product.unit } | <i class="mdi mdi-currency-inr menu-icon"></i> ${product.price}</h5>
	                  	<div class="mt-1 w-100 btn-group btn-group-sm mt-2">
		                  	<jstl:choose>
				                <jstl:when test="${product.status eq 'available'}">
				                  	<button type="button" class="btn btn-outline-primary border-2 font-weight-bold" disabled="disabled">AVAILABLE</button>
				                  	<button onclick="location.href='alterProductStatus?status=outOfStock&id=${product.id }'" type="button" class="btn btn-outline-primary border-2 font-weight-bold">OUT OF STOCK</button>	
				                </jstl:when>
				                <jstl:otherwise>
				                	<button onclick="location.href='alterProductStatus?status=available&id=${product.id }'" type="button" class="btn btn-outline-primary border-2 font-weight-bold">AVAILABLE</button>
				                  	<button type="button" class="btn btn-outline-primary border-2 font-weight-bold" disabled >OUT OF STOCK</button>
				                </jstl:otherwise>
		                	</jstl:choose>
                  		</div>
	                </div>
	              </div>
              </jstl:forEach>
            </div>		
         </div>	
	            
		
		<div class="own-border-95 bg-primary m-4"></div>
		
          <!-- -----------------------------------------Speciality --------------------------------------------------->
          <h2 class="d-block m-3">Speciality</h2>

          <div class="row ml-5">
            <div class="w-100" style="display: flex;flex-wrap: wrap">
            	<jstl:forEach items="${specialProducts }" var="product" varStatus="count">
	              <div class="mt-1 m-3 card shadow rounded" style="max-width:45%;flex:500px">
	                <div class="card-body">
	                  <div>
	                    <h4>${product.name }  
	                   		<span class="float-right text-warning"><h5>Chef's Special</h5></span>
	                  	</h4>
	                  </div>
	                  <div class="float-left">
	                    <h5 class="text-muted float-left">${product.category.name } | ${product.unitValue } ${product.unit } | <i class="mdi mdi-currency-inr menu-icon"></i> ${product.price }</h5>
	                  </div>
	                  <div>
	                    <jstl:choose>
			                <jstl:when test="${product.status eq 'available'}">
			                  	<h4><span class="badge badge-pill badge-primary float-right"> Available</h4> </span>	
			                </jstl:when>
			                <jstl:otherwise>
			                  	<h4><span class="badge badge-pill badge-primary float-right"> Out Of Stock</h4> </span>
			                </jstl:otherwise>
		                </jstl:choose>
	                  </div>
	                  <div class="mt-1 w-100 btn-group btn-group-sm mt-2">
	                    <jstl:choose>
				                <jstl:when test="${product.status eq 'available'}">
				                  	<button type="button" class="btn btn-outline-primary border-2 font-weight-bold" disabled="disabled">AVAILABLE</button>
				                  	<button onclick="location.href='alterProductStatus?status=outOfStock&id=${product.id }'" type="button" class="btn btn-outline-primary border-2 font-weight-bold">OUT OF STOCK</button>	
				                </jstl:when>
				                <jstl:otherwise>
				                	<button onclick="location.href='alterProductStatus?status=available&id=${product.id }'" type="button" class="btn btn-outline-primary border-2 font-weight-bold">AVAILABLE</button>
				                  	<button type="button" class="btn btn-outline-primary border-2 font-weight-bold" disabled >OUT OF STOCK</button>
				                </jstl:otherwise>
		                	</jstl:choose>
	                  </div>
	                </div>
	              </div>
	            </jstl:forEach> 
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