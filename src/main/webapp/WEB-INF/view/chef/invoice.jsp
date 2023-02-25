<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Chef - Invoice</title>
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
      
    <!-- Working area starts -->
      
      <div class="main-panel">          
        <div class="content-wrapper">
          <div class="row">
              <div class="col-lg-12">
                  <div class="card px-2">
                      <div class="card-body">
                          <div class="container-fluid">
                            <h3 class="text-right my-5" id="invoiceId${order.id}"></h3>
                            <div class="own-border bg-primary w-100"></div>
                          </div>
                          
                          <script src="chefResources/js/chef.js"></script>
						  <script>setInvoiceId(${order.id},'${order.timestamp}')</script>
                          
                          <div class="container-fluid d-flex justify-content-between">
                            <div class="col-lg-3 pl-0">
                              <p class="mt-5 mb-2"><b>Chef - ${order.chef.firstName } ${order.chef.lastName }</b></p>
                              <p> ${chefAddress.homeNo }, <br>${chefAddress.societyName },<br>${chefAddress.landmark }, ${chefAddress.area } - ${chefAddress.pincode }</p>
                            </div>
                            <div class="col-lg-3 pr-0">
                              <p class="mt-5 mb-2 text-right"><b>Invoice to</b></p>
                              <p class="text-right">${order.user.firstName } ${order.user.lastName }<br> ${order.address.homeNo }, ${order.address.societyName },<br> ${order.address.landmark }, ${order.address.area } - ${order.address.pincode }</p>
                            </div>
                          </div>
                          <div class="container-fluid d-flex justify-content-between">
                            <div class="col-lg-3 pl-0">
                              <p class="mb-0 mt-5">Invoice Date : ${order.timestamp.getDate()}-${order.timestamp.getMonth()}-${order.timestamp.getYear() + 1900} </p>
                              <p>Due Date : ${order.timestamp.getDate()}-${order.timestamp.getMonth()}-${order.timestamp.getYear() + 1900}</p>
                            </div>
                          </div>
                          <div class="container-fluid mt-5 d-flex justify-content-center w-100">
                            <div class="table-responsive w-100">
                                <table class="table">
                                  <thead>
                                    <tr class="text-dark bg-success">
                                        <th>#</th>
                                        <th>Description</th>
                                        <th class="text-right">Quantity</th>
                                        <th class="text-right">Unit cost</th>
                                        <th class="text-right">Total</th>
                                      </tr>
                                  </thead>
                                  <tbody>	
	                                  <jstl:forEach items="${orderItemsList}" var="item" varStatus="count">
		                                    <tr class="text-right">
		                                      <td class="text-left">${count.getIndex()+1}</td>
		                                      <td class="text-left">${item.product.name }</td>
		                                      <td>${item.count }</td>
		                                      <td><i class="mdi mdi-currency-inr"></i>${item.product.price }</td>
		                                      <td><i class="mdi mdi-currency-inr"></i>${item.product.price * item.count}</td>
		                                    </tr>
                                   </jstl:forEach>
                                  </tbody>
                                </table>
                              </div>
                          </div>
                          <div class="own-border bg-primary w-100"></div>
                          <div class="container-fluid mt-4 w-100">
                            <p class="text-right mb-2">Sub - Total amount: <i class="mdi mdi-currency-inr"></i>${order.amount }</p>
                            <p class="text-right">GST (12%) : <i class="mdi mdi-currency-inr"></i>${order.amount * 0.12 }</p>
                            <h4 class="text-right mb-5">Total : <i class="mdi mdi-currency-inr"></i>${order.amount + order.amount*0.12 }</h4>
                            <!-- <div class="own-border bg-primary w-100"></div> -->
                          </div>
                          <!-- <div class="container-fluid w-100">
                            <a href="#" class="btn btn-primary float-right mt-4 ml-2"><i class="mdi mdi-printer mr-1"></i>Print</a>
                            <a href="#" class="btn btn-info float-right mt-4"><i class="mdi mdi-telegram mr-1"></i>Send Invoice</a>
                          </div> -->
                      </div>
                  </div>
              </div>
          </div>
        </div>
        
    <!-- Working area end-->        

        <footer class="mt-3 footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2021 <a href="https://www.bootstrapdash.com/" target="_blank">Homion</a>. All rights reserved.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">About Homion | <i class="mdi mdi-instagram menu-icon"></i> | <i class="mdi mdi-twitter menu-icon"></i> | <i class="mdi mdi-facebook menu-icon"></i> </span>
          </div>
        </footer>

      </div>
    </div>
  </div>

  <script src="chefResources/js/vendor.bundle.base.js"></script>
  <script src="chefResources/js/hoverable-collapse.js"></script>
  <script src="chefResources/js/template.js"></script>
  <script src="chefResources/js/jquery.min.js"></script>

</body>
</html>

