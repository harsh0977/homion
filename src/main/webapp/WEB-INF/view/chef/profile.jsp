<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Chef - ${chef.firstName} ${chef.lastName}</title>
  <link rel="stylesheet" href="chefResources/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="chefResources/css/style.css">
  <link rel="stylesheet" href="chefResources/css/bootstrap.min.css">
  <link rel="shortcut icon" href="chefResources/image/fav.png">
</head>


<body class="sidebar-light">

  <div class="container-scroller">
  
  	<jsp:include page="header.jsp"></jsp:include>
        
    <div class="container-fluid page-body-wrapper">

      <jsp:include page="menu.jsp"></jsp:include>
      
      <div class="main-panel own-body">

        <!-- Working area start-->
        <form:form class="mb-4" action="/chef/saveChanges" method="post" modelAttribute="chef" enctype="multipart/form-data">
	
        <div class="mt-4 row text-center">
          <div class="col-md-12">
          
          	<div>
	          	<jstl:choose>
					<jstl:when test="${chef.image ne 'NoImage'}">
						<img id="image" src="${chef.image}" alt="profile Image" class="rounded-circle" style="height: 250px;">
					</jstl:when>
					<jstl:otherwise>
						<img id="image" src="chefResources/image/defaultChef.jpg" alt="profile Image" class="rounded-circle" style="height: 250px;">						
					</jstl:otherwise>
				</jstl:choose>
				<div><i class="mdi mdi-camera menu-icon text-primary" style="font-size: 22px;" onclick="openFileDialog()"></i></div>
				<input type="file" id="file" name="file" hidden="true" accept="image/*" onchange="setImage(event);">
			</div>
            
            <h3 class="mt-n1">${chef.firstName} ${chef.lastName}</h3>
            <!-- <h6 class="mt-1 text-muted">Bopal, Ahmedabad</h6> -->
          </div>
        </div>

        <h4 class="ml-3 mt-4">Manage Account</h4>
        <div class="ml-3 own-border bg-primary"></div>

        <div class="mt-3 container font-weight-bold">
          <label for="username">User Name</label>
          <form:input type="text" path="userName" class="w-100 form-control" id="userName" name="userName" required="required"/>
        </div>

		<div class="mt-2 container font-weight-bold">
          <label for="firstName">First Name</label>
          <form:input type="text" path="firstName" class="w-100 form-control" id="firstName" name="firstName" required="required"/>
        </div>
		
		<div class="mt-2 container font-weight-bold">
          <label for="lastName">Last Name</label>
          <form:input type="text" path="lastName" class="w-100 form-control" id="lastName" name="lastName" required="required"/>
        </div>
		
        <div class="mt-2 container font-weight-bold">
          <label for="email">Email</label>
          <form:input type="text" path="login.email" class="w-100 form-control" id="email" name="email" readonly="true"/>
        </div>

        <div class="mt-2 container font-weight-bold">
          <label for="mobileno">Mobile No</label>
          <form:input type="text" path="mobileNo" class="w-100 form-control" id="mobileno" name="mobileno" readonly="true"/>
        </div>

        <div class="mt-2 container font-weight-bold">
          <label for="panno">PAN No</label>
          <form:input type="text" path="panNo" class="w-100 form-control" id="panno" name="panno" readonly="true"/>
        </div>

        <div class="mt-3 form-inline container">
          <label class="mb-2 mr-sm-2 font-weight-bold">Preferable time slot : </label>
          <label for="start-time" class="ml-3 mb-2 mr-sm-2">Start : </label>
          <input type="time" class="form-control mb-2 mr-sm-2" id="start-time" name="startTime" value="${chef.startTime}">
          <label for="end-time" class="mb-2 mr-sm-2">End : </label>
          <input type="time" class="form-control mb-2 mr-sm-2" id="end-time" name="endTime" value="${chef.endTime}">
        </div>

        <div class="mt-3 container font-weight-bold">
          <label for="about">About</label>
          <form:textarea id="ccomment" path="about" class="form-control shadow" name="comment"/>
        </div>

        <div class="mt-4 container text-center">
          <button type="submit" class="btn btn-outline-primary border-2 font-weight-bold">Save Changes</button>
        </div>
        
        <form:hidden path="id"/>
        <form:hidden path="image"/>
        <form:hidden path="login.id"/>
        <form:hidden path="login.password"/>
        <form:hidden path="login.type"/>
        </form:form>
        <!-- Working area end-->        

        <jsp:include page="footer.jsp"></jsp:include>
        <jsp:include page="loader.jsp"></jsp:include>

      </div>

    </div>
  </div>

  <script src="chefResources/js/vendor.bundle.base.js"></script>
  <script src="chefResources/js/hoverable-collapse.js"></script>
  <script src="chefResources/js/template.js"></script>
  <script src="chefResources/js/jquery.min.js"></script>
  <script src="chefResources/js/chef.js"></script>

</body>
</html>

