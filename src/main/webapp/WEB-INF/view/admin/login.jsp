<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Homion Admin</title>
  <link rel="stylesheet" href="adminResources/css/style.css">
  <link rel="shortcut icon" href="adminResources/image/fav.png" />
</head>

<body class="sidebar-light">

  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth">
        <div class="row w-100">
          <div class="col-lg-4 mx-auto">
          	
          	<jstl:if test="${param.sessionExpired}">
	          	<div class="alert alert-danger">
	  				<strong>Session Expired..!! Please, Login Again.</strong>
				</div>
			</jstl:if>
			
			<jstl:if test="${param.wrongCredentials}">
	          	<div class="alert alert-danger">
	  				<strong>Email or Password is/are incorrect.</strong>
				</div>
			</jstl:if>
			
            <div class="auth-form-light text-left p-5">
              <div class="brand-logo">
                <img src="adminResources/image/homion-logo.svg" alt="logo">
              </div>
              <h6>Sign in to continue.</h6>
              <form:form class="pt-3" action="/admin/verifyCredentials" modelAttribute="login" method="post">
                <div class="form-group">
                  <form:input path="email" type="email" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="Email" required="required"/>
                </div>
                <div class="form-group">
                  <form:input path="password" type="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Password" required="required"/>
                </div>
                <form:hidden path="type" value="Admin"/>
                <div class="mt-3">
                  <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="SIGN IN">
                </div>
                <!-- <div class="my-2 d-flex justify-content-between align-items-center">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input type="checkbox" class="form-check-input">
                      Keep me signed in
                    </label>
                  </div>
                  <a href="#" class="auth-link text-black">Forgot password?</a>
                </div>
                <div class="mb-2">
                  <button type="button" class="btn btn-block btn-facebook auth-form-btn">
                    <i class="mdi mdi-facebook mr-2"></i>Connect using facebook
                  </button>
                </div>
                <div class="text-center mt-4 font-weight-light">
                  Don't have an account? <a href="/register" class="text-primary">Create</a>
                </div> -->
              </form:form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <script src="adminResources/js/template.js"></script>
  
</body>
</html>

