<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="ISO-8859-1">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Chef - Business History</title>
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
      
    <!-- Working area starts -->
    
      <div class="main-panel own-body">

        <h2 class="mt-3 ml-4 float-left">${chef.firstName } ${chef.lastName }</h2>
        <h5 class="mt-0 ml-4 text-muted">${chefAddress.area }</h5>

        <div class="own-border bg-primary ml-4 mb-2"></div>

        <ul class="nav nav-pills nav-fill mt-3 ml-3 mr-3" id="pills-tab-custom" role="tablist">
            <li class="nav-item ">
              <a class="nav-link active font-weight-bolder font-20" id="today-tab" data-toggle="tab" href="#today" role="tab" aria-controls="today" aria-selected="true">
              <i class="mdi mdi-calendar-today"></i> Today</a>
            </li>
            <li class="nav-item">
              <a class="nav-link font-weight-bold font-20" id="week-tab" data-toggle="tab" href="#week" role="tab" aria-controls="week" aria-selected="false">
              <i class="mdi mdi-calendar"></i> This Week</a>
            </li>
            <li class="nav-item">
              <a class="nav-link font-weight-bold font-20" id="month-tab" data-toggle="tab" href="#month" role="tab" aria-controls="month" aria-selected="false">
              <i class="mdi mdi-calendar-blank"></i> This Month</a>
            </li>
        </ul>


         <div class="container">
            <div class="row">
            	<div class="tab-content col-md-9 mx-auto" id="myTabContent">
            
            <!--------------------------------------------- Today ---------------------------------------------->
            
                  <div class="tab-pane fade show active" id="today" role="tabpanel" aria-labelledby="today-tab">
                     <jstl:if test="${fun:length(todaysOrders) == 0 }">
						<h4 class="ml-auto">Nothing here!!</h4>
					</jstl:if>
                  	<jstl:forEach items="${todaysOrders }" var="order">
	                     <div class="order-body">
	                        <div class="pb-3">
	                           <div class="p-3 rounded shadow-sm bg-white">
	                              <div class="d-flex border-bottom pb-3">
	                                 <div class="text-muted mr-3">
	                                    <img alt="Product Image" id="productImageToday${order.id}" class="img-fluid order_img rounded">
	                                 </div>
	                                 <div>
	                                    <p class="mb-0 font-weight-bold" style="font-size:25px"><span class="text-dark">${order.user.firstName} ${order.user.lastName }</span></p>
	                                    <h6 class="text-muted" style="display:none" id="address${order.id}">${order.address.homeNo }, ${order.address.societyName }, ${order.address.landmark }, ${order.address.area } - ${order.address.pincode }</h6>
	                                    <p class="mb-0"></p>
	                                    <p id="orderIdToday${order.id}" class="mt-2 mb-2 text-muted font-weight-bold" style="font-size:15px"> <!-- Order Id from JS --> </p>
	                                    <a class="mt-n1 font-weight-bold" data-toggle="modal" href="#orderDetails"
										onclick="setModalDetails(${order.id},'${order.user.firstName} ' + '${order.user.lastName }',${order.user.mobileNo}, '${order.timestamp}', ${order.amount})">VIEW DETAILS</a>
	                                 </div>
	                                 <div class="ml-auto">
	                                 	 <jstl:choose>
	                                 		<jstl:when test="${order.status == 'delivered'}">
	                                    		<h4><span class="badge text-white badge-info">Delivered</span></h4>
	                                    	</jstl:when>
	                                    	<jstl:when test="${order.status == 'rejected'}">
	                                    		<h4><span class="badge text-white badge-danger">Cancelled</span></h4>
	                                    	</jstl:when>
	                                    	<jstl:when test="${order.status == 'ongoing'}">
	                                    		<h4><span class="badge text-white badge-warning">On Process</span></h4>
	                                    	</jstl:when>
	                                    	<jstl:otherwise>
	                                    		<h4><span class="badge text-white badge-light">New Order</span></h4>
	                                    	</jstl:otherwise>
	                                    </jstl:choose>
	                                    <p class="small font-weight-bold text-center" style="font-size:15px"><i class="mdi mdi-clock-fast"></i> ${order.timestamp.getDate()}/${order.timestamp.getMonth()}/${order.timestamp.getYear() + 1900}  </p>
	                                 </div>
	                              </div>
	                              <div class="d-flex pt-3">
	                                 <div class="small" id="orderItemsListToday${order.id }">
	                                 	<!-- Order Items List comes here through js -->
	                                 </div>
	                                 <div class="text-muted m-0 ml-auto mr-3 mt-n1 float-right">Total Payment<br>
	                                    <span class="text-dark font-weight-bold float-right"><i class="mdi mdi-currency-inr"></i>${order.amount}</span>
	                                 </div>
	                                 <div class="text-right">
	                                 	<jstl:if test="${order.status == 'delivered'}">
	                                    	<button onclick="window.location.href='/chef/invoice?orderId=${order.id}'" class="btn btn-primary px-3">Invoice</button>
	                                    </jstl:if>
	                                 </div>
	                              </div>
	                           </div>
	                        </div>
	                     </div>
	                     <script src="chefResources/js/chef.js"></script>
	                     <script> 
		                     setOrderIdInBusinessHistory("Today",${order.id},"${order.timestamp}");
		                     setOrderItemsInBusinessHistory("Today",${order.id});
	                     </script>
	                </jstl:forEach>
                  </div>
                  
                  <!--------------------------------------------- Week ---------------------------------------------->
                  
                  <div class="tab-pane fade" id="week" role="tabpanel" aria-labelledby="week-tab">
                     <jstl:if test="${fun:length(weeksOrders) == 0 }">
						<h4 class="ml-auto">Nothing here!!</h4>
					</jstl:if>
                  	<jstl:forEach items="${weeksOrders }" var="order">
	                     <div class="order-body">
	                        <div class="pb-3">
	                           <div class="p-3 rounded shadow-sm bg-white">
	                              <div class="d-flex border-bottom pb-3">
	                                 <div class="text-muted mr-3">
	                                    <img alt="Product Image" id="productImageWeek${order.id}" class="img-fluid order_img rounded">
	                                 </div>
	                                 <div>
	                                    <p class="mb-0 font-weight-bold" style="font-size:25px"><span class="text-dark">${order.user.firstName} ${order.user.lastName }</span></p>
	                                    <h6 class="text-muted" style="display:none" id="address${order.id}">${order.address.homeNo }, ${order.address.societyName }, ${order.address.landmark }, ${order.address.area } - ${order.address.pincode }</h6>
	                                    <p class="mb-0"></p>
	                                    <p id="orderIdWeek${order.id}" class="mt-2 mb-2 text-muted font-weight-bold" style="font-size:15px"> <!-- Order Id from JS --> </p>
	                                    <a class="mt-n1 font-weight-bold" data-toggle="modal" href="#orderDetails"
										onclick="setModalDetails(${order.id},'${order.user.firstName} ' + '${order.user.lastName }',${order.user.mobileNo}, '${order.timestamp}', ${order.amount})">VIEW DETAILS</a>
	                                 </div>
	                                 <div class="ml-auto">
	                                    <jstl:choose>
	                                 		<jstl:when test="${order.status == 'delivered'}">
	                                    		<h4><span class="badge text-white badge-info">Delivered</span></h4>
	                                    	</jstl:when>
	                                    	<jstl:when test="${order.status == 'rejected'}">
	                                    		<h4><span class="badge text-white badge-danger">Cancelled</span></h4>
	                                    	</jstl:when>
	                                    	<jstl:when test="${order.status == 'ongoing'}">
	                                    		<h4><span class="badge text-white badge-warning">On Process</span></h4>
	                                    	</jstl:when>
	                                    	<jstl:otherwise>
	                                    		<h4><span class="badge text-white badge-light">New Order</span></h4>
	                                    	</jstl:otherwise>
	                                    </jstl:choose>
	                                    <p class="small font-weight-bold text-center" style="font-size:15px"><i class="mdi mdi-clock-fast"></i> ${order.timestamp.getDate()}/${order.timestamp.getMonth()}/${order.timestamp.getYear() + 1900}  </p>
	                                 </div>
	                              </div>
	                              <div class="d-flex pt-3">
	                                 <div class="small" id="orderItemsListWeek${order.id }">
	                                 	<!-- Order Items List comes here through js -->
	                                 </div>
	                                 <div class="text-muted m-0 ml-auto mr-3 mt-n1 float-right">Total Payment<br>
	                                    <span class="text-dark font-weight-bold float-right"><i class="mdi mdi-currency-inr"></i>${order.amount}</span>
	                                 </div>
	                                 <div class="text-right">
	                                    <jstl:if test="${order.status == 'delivered'}">
	                                    	<button onclick="window.location.href='/chef/invoice?orderId=${order.id}'" class="btn btn-primary px-3">Invoice</button>
	                                    </jstl:if>
	                                 </div>
	                              </div>
	                           </div>
	                        </div>
	                     </div>
	                     <script src="chefResources/js/chef.js"></script>
	                     <script> 
		                     setOrderIdInBusinessHistory("Week",${order.id},"${order.timestamp}");
		                     setOrderItemsInBusinessHistory("Week",${order.id});
	                     </script>
	                </jstl:forEach>
                  </div>
                  
                  <!--------------------------------------------- Month ---------------------------------------------->
                  
                  <div class="tab-pane fade" id="month" role="tabpanel" aria-labelledby="month-tab">
                     <jstl:if test="${fun:length(monthsOrders) == 0 }">
						<h4 class="ml-auto">Nothing here!!</h4>
					</jstl:if>
                  	<jstl:forEach items="${monthsOrders }" var="order">
	                     <div class="order-body">
	                        <div class="pb-3">
	                           <div class="p-3 rounded shadow-sm bg-white">
	                              <div class="d-flex border-bottom pb-3">
	                                 <div class="text-muted mr-3">
	                                    <img alt="Product Image" id="productImageMonth${order.id}" class="img-fluid order_img rounded">
	                                 </div>
	                                 <div>
	                                    <p class="mb-0 font-weight-bold" style="font-size:25px"><span class="text-dark">${order.user.firstName} ${order.user.lastName }</span></p>
	                                    <h6 class="text-muted" style="display:none" id="address${order.id}">${order.address.homeNo }, ${order.address.societyName }, ${order.address.landmark }, ${order.address.area } - ${order.address.pincode }</h6>
	                                    <p class="mb-0"></p>
	                                    <p id="orderIdMonth${order.id}" class="mt-2 mb-2 text-muted font-weight-bold" style="font-size:15px"> <!-- Order Id from JS --> </p>
	                                    <a class="mt-n1 font-weight-bold" data-toggle="modal" href="#orderDetails"
										onclick="setModalDetails(${order.id},'${order.user.firstName} ' + '${order.user.lastName }',${order.user.mobileNo}, '${order.timestamp}', ${order.amount})">VIEW DETAILS</a>
	                                 </div>
	                                 <div class="ml-auto">
	                                    <jstl:choose>
	                                 		<jstl:when test="${order.status == 'delivered'}">
	                                    		<h4><span class="badge text-white badge-info">Delivered</span></h4>
	                                    	</jstl:when>
	                                    	<jstl:when test="${order.status == 'rejected'}">
	                                    		<h4><span class="badge text-white badge-danger">Cancelled</span></h4>
	                                    	</jstl:when>
	                                    	<jstl:when test="${order.status == 'ongoing'}">
	                                    		<h4><span class="badge text-white badge-warning">On Process</span></h4>
	                                    	</jstl:when>
	                                    	<jstl:otherwise>
	                                    		<h4><span class="badge text-white badge-light">New Order</span></h4>
	                                    	</jstl:otherwise>
	                                    </jstl:choose>
	                                    <p class="small font-weight-bold text-center" style="font-size:15px"><i class="mdi mdi-clock-fast"></i> ${order.timestamp.getDate()}/${order.timestamp.getMonth()}/${order.timestamp.getYear() + 1900}  </p>
	                                 </div>
	                              </div>
	                              <div class="d-flex pt-3">
	                                 <div class="small" id="orderItemsListMonth${order.id }">
	                                 	<!-- Order Items List comes here through js -->
	                                 </div>
	                                 <div class="text-muted m-0 ml-auto mr-3 mt-n1 float-right">Total Payment<br>
	                                    <span class="text-dark font-weight-bold float-right"><i class="mdi mdi-currency-inr"></i>${order.amount}</span>
	                                 </div>
	                                 <div class="text-right">
	                                    <jstl:if test="${order.status == 'delivered'}">
	                                    	<button onclick="window.location.href='/chef/invoice?orderId=${order.id}'" class="btn btn-primary px-3">Invoice</button>
	                                    </jstl:if>
	                                 </div>
	                              </div>
	                           </div>
	                        </div>
	                     </div>
	                     <script src="chefResources/js/chef.js"></script>
	                     <script> 
		                     setOrderIdInBusinessHistory("Month",${order.id},"${order.timestamp}");
		                     setOrderItemsInBusinessHistory("Month",${order.id});
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
									<th>Sub-total</th>
								</tr>
							</thead>
							<tbody id="modalItems">
								<jstl:forEach items="${sessionScope.orderItems}" var="item">
									<tr>
										<td>${item.product.name}</td>
										<td>${item.count}</td>
										<td><i class="mdi mdi-currency-inr menu-icon"></i>${item.product.price}</td>
										<td><i class="mdi mdi-currency-inr menu-icon"></i>${item.product.price * item.count}</td>
									</tr>
								</jstl:forEach>
							</tbody>
							<tr class="font-weight-bold">
								<td>Total</td>
								<td></td>
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

  <script src="chefResources/js/vendor.bundle.base.js"></script>
  <script src="chefResources/js/hoverable-collapse.js"></script>
  <script src="chefResources/js/template.js"></script>
  <script src="chefResources/js/jquery.min.js"></script>

</body>
</html>

