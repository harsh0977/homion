<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Chef - Past Orders</title>
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
    
      <div class="main-panel own-body">

        <h2 class="mt-3 ml-4 float-left">Past Orders</h2>

        <ul class="nav nav-pills nav-fill m-3" id="pills-tab-custom" role="tablist">
            <li class="nav-item ">
              <a class="nav-link rounded-pill active font-weight-bold font-20" id="completed-tab" data-toggle="tab" href="#completed" role="tab" aria-controls="completed" aria-selected="true">
              <i class="mdi mdi-check-circle-outline"></i> Completed</a>
            </li>
            <li class="nav-item">
              <a class="nav-link rounded-pill font-weight-bold font-20" id="progress-tab" data-toggle="tab" href="#progress" role="tab" aria-controls="progress" aria-selected="false">
              <i class="mdi mdi-clock text-warning"></i> On Progress</a>
            </li>
            <li class="nav-item">
              <a class="nav-link rounded-pill font-weight-bold font-20" id="canceled-tab" data-toggle="tab" href="#canceled" role="tab" aria-controls="canceled" aria-selected="false">
              <i class="mdi mdi-close-circle-outline text-danger"></i> Cancelled</a>
            </li>
        </ul>


         <div class="container">
            <div class="row">
               <div class="tab-content col-md-9 mx-auto" id="myTabContent">
               
               <!---------------------------------------- Completed ------------------------------------>
               
                  <div class="tab-pane fade show active" id="completed" role="tabpanel" aria-labelledby="completed-tab">
                  	<jstl:if test="${fun:length(pastCompletedOrders) == 0 }">
						<h4 class="text-center">Nothing here!!</h4>
					</jstl:if>
                  	<jstl:forEach items="${pastCompletedOrders }" var="order">
	                     <div class="order-body">
	                        <div class="pb-3">
	                           <div class="p-3 rounded shadow-sm bg-white">
	                              <div class="d-flex border-bottom pb-3">
	                                 <div class="text-muted mr-3">
	                                    <img alt="Product Image" id="productImage${order.id}" class="img-fluid order_img rounded">
	                                 </div>
	                                 <div>
	                                    <p class="mb-0 font-weight-bold" style="font-size:25px"><span class="text-dark">${order.user.firstName} ${order.user.lastName }</span></p>
	                                    <h6 class="text-muted" style="display:none" id="address${order.id}">${order.address.homeNo }, ${order.address.societyName }, ${order.address.landmark }, ${order.address.area } - ${order.address.pincode }</h6>
	                                    <p class="mb-0"></p>
	                                    <p id="orderId${order.id}" class="mt-2 mb-2 text-muted font-weight-bold" style="font-size:15px"> <!-- Order Id from JS --> </p>
	                                    <a class="mt-n1 font-weight-bold" data-toggle="modal" href="#orderDetails"
										onclick="setModalDetails(${order.id},'${order.user.firstName} ' + '${order.user.lastName }',${order.user.mobileNo}, '${order.timestamp}', ${order.amount})">VIEW DETAILS</a>
	                                 </div>
	                                 <div class="ml-auto">
	                                    <h4><span class="badge text-white badge-info">Delivered</span></h4>
	                                    <p class="small font-weight-bold text-center" style="font-size:15px"><i class="mdi mdi-clock-fast"></i> ${order.timestamp.getDate()}/${order.timestamp.getMonth()}/${order.timestamp.getYear() + 1900}  </p>
	                                 </div>
	                              </div>
	                              <div class="d-flex pt-3">
	                                 <div class="small" id="orderItemsList${order.id}">
	                                 	<!-- Order Items List comes here through js -->
	                                 </div>
	                                 <div class="text-muted m-0 ml-auto mr-3 mt-n1 float-right">Total Payment<br>
	                                    <span class="text-dark font-weight-bold float-right"><i class="mdi mdi-currency-inr"></i>${order.amount}</span>
	                                 </div>
	                                 <div class="text-right">
	                                    <button onclick="window.location.href='/chef/invoice?orderId=${order.id}'" class="btn btn-primary px-3">Invoice</button>
	                                 </div>
	                              </div>
	                           </div>
	                        </div>
	                     </div>
	                     <script src="chefResources/js/chef.js"></script>
	                     <script> 
		                     setOrderId(${order.id},"${order.timestamp}");
		                     setOrderItems(${order.id});
	                     </script>
	                </jstl:forEach>
                  </div>
                  
                  <!---------------------------------------- On Progress ------------------------------------>
                  
                  <div class="tab-pane fade" id="progress" role="tabpanel" aria-labelledby="progress-tab">
                  	 <jstl:if test="${fun:length(pastOngoingOrders) == 0 }">
						<h4 class="text-center">Nothing here!!</h4>
	                 </jstl:if>
                     <jstl:forEach items="${pastOngoingOrders }" var="order">
	                     <div class="order-body">
	                        <div class="pb-3">
	                           <div class="p-3 rounded shadow-sm bg-white">
	                              <div class="d-flex border-bottom pb-3">
	                                 <div class="text-muted mr-3">
	                                    <img alt="Product Image" id="productImage${order.id}" class="img-fluid order_img rounded">
	                                 </div>
	                                 <div>
	                                    <p class="mb-0 font-weight-bold" style="font-size:25px"><span class="text-dark">${order.user.firstName} ${order.user.lastName }</span></p>
	                                    <h6 class="text-muted" style="display:none" id="address${order.id}">${order.address.homeNo }, ${order.address.societyName }, ${order.address.landmark }, ${order.address.area } - ${order.address.pincode }</h6>
	                                    <p class="mb-0"></p>
	                                    <p id="orderId${order.id}" class="mt-2 mb-2 text-muted font-weight-bold" style="font-size:15px"> <!-- Order Id from JS --> </p>
	                                    <a class="mt-n1 font-weight-bold" data-toggle="modal" href="#orderDetails"
										onclick="setModalDetails(${order.id},'${order.user.firstName} ' + '${order.user.lastName }',${order.user.mobileNo}, '${order.timestamp}', ${order.amount})">VIEW DETAILS</a>
	                                 </div>
	                                 <div class="ml-auto">
	                                    <h4><span class="badge text-white badge-warning">On Process</span></h4>
	                                    <p class="small font-weight-bold text-center" style="font-size:15px"><i class="mdi mdi-clock-fast"></i> ${order.timestamp.getDate()}/${order.timestamp.getMonth()}/${order.timestamp.getYear() + 1900}  </p>
	                                 </div>
	                              </div>
	                              <div class="d-flex pt-3">
	                                 <div class="small" id="orderItemsList${order.id }">
	                                 	<!-- Order Items List comes here through js -->
	                                 </div>
	                                 <div class="text-muted m-0 ml-auto mr-3 mt-n1 float-right">Total Payment<br>
	                                    <span class="text-dark font-weight-bold float-right"><i class="mdi mdi-currency-inr"></i>${order.amount}</span>
	                                 </div>
	                                 <div class="text-right">
	                                    <a href="/chef/markAsDelivered?orderId=${order.id}&flag=pastOrders" class="btn btn-primary px-3" data-toggle="tooltip" title="Mark as Delivered">Delivered</a>
	                                 </div>
	                              </div>
	                           </div>
	                        </div>
	                     </div>
	                     <script src="chefResources/js/chef.js"></script>
	                     <script> 
		                     setOrderId(${order.id},"${order.timestamp}");
		                     setOrderItems(${order.id});
	                     </script>
	                </jstl:forEach>
                  </div>
                  
				<!---------------------------------------- Cancelled orders ------------------------------------>                  
                  
                  <div class="tab-pane fade" id="canceled" role="tabpanel" aria-labelledby="canceled-tab">
                      <jstl:if test="${fun:length(pastCancelledOrders) == 0 }">
						<h4 class="text-center">Nothing here!!</h4>
	                 </jstl:if>
                     <jstl:forEach items="${pastCancelledOrders }" var="order">
	                     <div class="order-body">
	                        <div class="pb-3">
	                           <div class="p-3 rounded shadow-sm bg-white">
	                              <div class="d-flex border-bottom pb-3">
	                                 <div class="text-muted mr-3">
	                                    <img alt="Product Image" id="productImage${order.id}" class="img-fluid order_img rounded">
	                                 </div>
	                                 <div>
	                                    <p class="mb-0 font-weight-bold" style="font-size:25px"><span class="text-dark">${order.user.firstName} ${order.user.lastName }</span></p>
	                                    <h6 class="text-muted" style="display:none" id="address${order.id}">${order.address.homeNo }, ${order.address.societyName }, ${order.address.landmark }, ${order.address.area } - ${order.address.pincode }</h6>
	                                    <p class="mb-0"></p>
	                                    <p id="orderId${order.id}" class="mt-2 mb-2 text-muted font-weight-bold" style="font-size:15px"> <!-- Order Id from JS --> </p>
	                                    <a class="mt-n1 font-weight-bold" data-toggle="modal" href="#orderDetails"
										onclick="setModalDetails(${order.id},'${order.user.firstName} ' + '${order.user.lastName }',${order.user.mobileNo}, '${order.timestamp}', ${order.amount})">VIEW DETAILS</a>
	                                 </div>
	                                 <div class="ml-auto">
	                                    <h4><span class="badge text-white badge-danger">Cancelled</span></h4>
	                                    <p class="small font-weight-bold text-center" style="font-size:15px"><i class="mdi mdi-clock-fast"></i> ${order.timestamp.getDate()}/${order.timestamp.getMonth()}/${order.timestamp.getYear() + 1900}  </p>
	                                 </div>
	                              </div>
	                              <div class="d-flex pt-3">
	                                 <div class="small" id="orderItemsList${order.id }">
	                                 	<!-- Order Items List comes here through js -->
	                                 </div>
	                                 <div class="text-muted m-0 ml-auto mr-3 mt-n1 float-right">Total Amount<br>
	                                    <span class="text-dark font-weight-bold float-right"><i class="mdi mdi-currency-inr"></i>${order.amount}</span>
	                                 </div>
	                                 <div class="text-right">
	                                 </div>
	                              </div>
	                           </div>
	                        </div>
	                     </div>
	                     <script src="chefResources/js/chef.js"></script>
	                     <script> 
		                     setOrderId(${order.id},"${order.timestamp}");
		                     setOrderItems(${order.id});
	                     </script>
	                </jstl:forEach>
                  </div>
               </div>
            </div>
         </div>
    
    	<!-- Order Details Modal -->
		<div class="modal" id="orderDetails">
			<div class="modal-dialog">
				<div class="modal-content">

					<!---------------------------------------- Modal Header ----------------------------------------------->
					<div class="modal-header">
						<h5 class="modal-title" id="orderId"> <!-- Order ID through JS --> </h5>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!---------------------------------------- Modal body -------------------------------------------------->
					<div class="modal-body mt-n4">
						<div class="row">
							<div class="col-md-4">
								<i class="mdi mdi-account menu-icon text-primary"></i><span class="font-weight-bold" id="userName"> <!-- User Name through JS --> </span>
							</div>
							<div class="col-md-4">
								<i class="mdi mdi-phone menu-icon text-primary"></i> <span class="font-weight-bold" id="userMobileNo"> <!-- User Mobile no through JS --> </span>
							</div>
						</div>
						<div class="mt-2 row">
							<div class="col-md-12">
								<i class="mdi mdi-map-marker menu-icon text-primary"></i>
								<span id="userAddress"></span>
							</div>
						</div>

						<h5 class="mt-3">Order Details</h5>
						<table class="mt-3 table">
							<thead>
								<tr>
									<th>Item</th>
									<th>Quantity</th>
									<th>Price</th>
								</tr>
							</thead>
							<tbody id="modalItems">
								<jstl:forEach items="${orderItems}" var="item">
									<tr>
										<td>${item.product.name}</td>
										<td>${item.count}</td>
										<td><i class="mdi mdi-currency-inr menu-icon"></i>${item.product.price}</td>
									</tr>
								</jstl:forEach>
							</tbody>
							<tr class="font-weight-bold">
								<td>Total</td>
								<td></td>
								<td><i class="mdi mdi-currency-inr menu-icon"></i> <span id="totalAmount"></span>  </td>
							</tr>
						</table>
					</div>
				</div>
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

