<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link rel="icon" type="image/png" href="userResources/image/fav.png">
      <title>Homion - My Orders</title>
      <link rel="stylesheet" href="../chef/chefResources/css/materialdesignicons.min.css">
      <link href="userResources/css/feather.css" rel="stylesheet" type="text/css">
      <link href="userResources/css/bootstrap.min.css" rel="stylesheet">
      <link href="userResources/css/style.css" rel="stylesheet">
      <link href="userResources/css/demo.css" rel="stylesheet">
   </head>
   
   <body class="fixed-bottom-bar">
           
     <!-- header start -->
         <jsp:include page="header.jsp"></jsp:include>
     <!-- header end -->

      <div class="d-none">
         <div class="bg-primary border-bottom p-3 d-flex align-items-center">
            <a class="toggle togglew toggle-2" href="#"><span></span></a>
            <h4 class="font-weight-bold m-0 text-white">My Orders</h4>
         </div>
      </div>
      
      <section class="py-4 osahan-main-body">
      
      
         <div class="container">
            <div class="row">
               <div class="col-md-3 mb-3">
                  <ul class="nav nav-tabsa custom-tabsa border-0 flex-column bg-white rounded overflow-hidden shadow-sm p-2 c-t-order" id="myTab" role="tablist">
                     <li class="nav-item" role="presentation">
                        <a class="nav-link border-0 text-dark py-3 active" id="completed-tab" data-toggle="tab" href="#completed" role="tab" aria-controls="completed" aria-selected="true">
                        <i class="feather-check mr-2 text-success mb-0"></i> Completed</a>
                     </li>
                     <li class="nav-item border-top" role="presentation">
                        <a class="nav-link border-0 text-dark py-3" id="progress-tab" data-toggle="tab" href="#progress" role="tab" aria-controls="progress" aria-selected="false">
                        <i class="feather-clock mr-2 text-warning mb-0"></i> On Progress</a>
                     </li>
                     <li class="nav-item border-top" role="presentation">
                        <a class="nav-link border-0 text-dark py-3" id="canceled-tab" data-toggle="tab" href="#canceled" role="tab" aria-controls="canceled" aria-selected="false">
                        <i class="feather-x-circle mr-2 text-danger mb-0"></i> Canceled</a>
                     </li>
                  </ul>
               </div>
               
               
               
               <div class="tab-content col-md-9" id="myTabContent">
               
               
                  <div class="tab-pane fade show active" id="completed" role="tabpanel" aria-labelledby="completed-tab">
                     <div class="order-body">
                     	<jstl:if test="${completedOrders.size() eq 0}">
							<h4 class="mt-5 text-center">Nothing here!!</h4>
						</jstl:if>
                     	<jstl:forEach items="${completedOrders}" var="order">
	                        <div class="pb-3">
	                           <div class="p-3 rounded shadow-sm bg-white">
	                              <div class="d-flex border-bottom pb-3">
	                                 <div class="text-muted mr-3">
	                                 	<jstl:choose>
											<jstl:when test="${order.chef.image ne 'NoImage'}">
												<img id="image" src="${order.chef.image}" alt="chefImage" class="img-fluid order_img rounded" style="max-height: 100px;">
											</jstl:when>
											<jstl:otherwise>
												<img id="image" src="../chef/chefResources/image/defaultChef.jpg" alt="chefImage" class="rounded-circle" style="max-height: 100px;">						
											</jstl:otherwise>
										</jstl:choose>
	                                 </div>
	                                 <div>
	                                    <p class="mb-0 font-weight-bold"><a href="#" class="text-dark">${order.chef.firstName} ${order.chef.lastName}</a></p>
	                                    <p class="mb-0">${order.address.homeNo}, ${order.address.societyName}, ${order.address.area} - ${order.address.pincode}</p>
	                                    <jstl:if test="${order.feedback.id ne null}">
	                                    	<p class="mt-2 small">
	                                    		Chef :
	                                    		<jstl:forEach begin="1" end="${order.feedback.chefRating}"> 
	                                    			<i class="mdi mdi-star rated"></i>
	                                    		</jstl:forEach>
	                                    		<jstl:forEach begin="1" end="${5 - order.feedback.chefRating}"> 
	                                    			<i class="mdi mdi-star-outline"></i>
	                                    		</jstl:forEach>
	                                    		&nbsp; &nbsp; &nbsp; 
	                                    		Food :
	                                    		<jstl:forEach begin="1" end="${order.feedback.foodRating}"> 
	                                    			<i class="mdi mdi-star rated"></i>
	                                    		</jstl:forEach>
	                                    		<jstl:forEach begin="1" end="${5 - order.feedback.foodRating}"> 
	                                    			<i class="mdi mdi-star-outline"></i>
	                                    		</jstl:forEach>
	                                    	</p>
	                                    </jstl:if>
	                                    <p class="mt-2 mb-0 small text-primary" style="cursor: pointer" data-toggle="modal" data-target="#orderDetails" onclick="getOrderDetails(${order.id}, ${order.amount})">View Details</p>
	                                 </div>
	                                 <div class="ml-auto">
	                                    <p class="bg-success text-white py-1 px-2 rounded small mb-1 ml-auto" style="width: 73px;">Delivered</p>
	                                    <p class="mt-2 small font-weight-bold text-center"><i class="feather-clock"></i> <fmt:formatDate value="${order.timestamp}" pattern="dd/MM/yyyy hh:mm a"/></p>
	                                 </div>
	                              </div>
	                              <div class="d-flex pt-3">
	                                 <!-- <div class="small">
	                                    <p class="text- font-weight-bold mb-0">Kesar Sweet x 1</p>
	                                    <p class="text- font-weight-bold mb-0">Gulab Jamun x 4</p>
	                                 </div> -->
	                                 <div class="text-muted m-0 mr-3 small">Total Payment<br>
	                                    <span class="text-dark font-weight-bold">&#x20B9; ${order.amount}</span>
	                                 </div>
	                                 <div class="text-right ml-auto">
	                                    <button class="btn btn-primary px-3" onclick="reorder(${order.id})">Reorder</button>
	                                    <jstl:if test="${not(order.feedback.id ne null)}">
	                                    	<button class="btn btn-outline-primary px-3 ml-2" data-toggle="modal" data-target="#review" onclick="review(${order.id})">Review</button>
	                                    </jstl:if>
	                                 </div>
	                              </div>
	                           </div>
	                        </div>
                        </jstl:forEach>
                     </div>
                  </div>
                  
                  
                  
                  <div class="tab-pane fade" id="progress" role="tabpanel" aria-labelledby="progress-tab">
                     <div class="order-body">
                     	<jstl:if test="${progressOrders.size() eq 0}">
							<h4 class="mt-5 text-center">Nothing here!!</h4>
						</jstl:if>
                     	<jstl:forEach items="${progressOrders}" var="order">
	                        <div class="pb-3">
	                           <div class="p-3 rounded shadow-sm bg-white">
	                              <div class="d-flex border-bottom pb-3">
	                                 <div class="text-muted mr-3">
	                                 	<jstl:choose>
											<jstl:when test="${order.chef.image ne 'NoImage'}">
												<img id="image" src="${order.chef.image}" alt="chefImage" class="img-fluid order_img rounded" style="max-height: 100px;">
											</jstl:when>
											<jstl:otherwise>
												<img id="image" src="../chef/chefResources/image/defaultChef.jpg" alt="chefImage" class="rounded-circle" style="max-height: 100px;">						
											</jstl:otherwise>
										</jstl:choose>
	                                 </div>
	                                 <div>
	                                    <p class="mb-0 font-weight-bold"><a href="#" class="text-dark">${order.chef.firstName} ${order.chef.lastName}</a></p>
	                                    <p class="mb-0">${order.address.homeNo}, ${order.address.societyName}, ${order.address.area} - ${order.address.pincode}</p>
	                                    <p></p>
	                                    <p class="mb-0 small text-primary" style="cursor: pointer" data-toggle="modal" data-target="#orderDetails" onclick="getOrderDetails(${order.id}, ${order.amount})">View Details</p>
	                                 </div>
	                                 <div class="ml-auto">
	                                    <p class="bg-warning text-white py-1 px-2 rounded small mb-1 ml-auto" style="width: 82px;">On Process</p>
	                                    <p class="mt-2 small font-weight-bold text-center"><i class="feather-clock"></i> <fmt:formatDate value="${order.timestamp}" pattern="dd/MM/yyyy hh:mm a"/></p>
	                                 </div>
	                              </div>
	                              <div class="d-flex pt-3">
	                                 <!-- <div class="small">
	                                    <p class="text- font-weight-bold mb-0">Kesar Sweet x 1</p>
	                                    <p class="text- font-weight-bold mb-0">Gulab Jamun x 4</p>
	                                 </div> -->
	                                 <div class="text-muted m-0 mr-3 small">Total Payment<br>
	                                    <span class="text-dark font-weight-bold">&#x20B9; ${order.amount}</span>
	                                 </div>
	                                 <div class="text-right ml-auto">
	                                 <a href="/user/track?id=${order.id}" class="btn btn-primary px-3">Track</a>
	                                    <a href="/user/contact-us" class="btn btn-outline-primary px-3 ml-2">Help</a>
	                                 </div>
	                              </div>
	                           </div>
	                        </div>
                        </jstl:forEach>
                     </div>
                  </div>
                  
                  
                  
                  <div class="tab-pane fade" id="canceled" role="tabpanel" aria-labelledby="canceled-tab">
                     <div class="order-body">
                     	<jstl:if test="${canceledOrders.size() eq 0}">
							<h4 class="mt-5 text-center">Nothing here!!</h4>
						</jstl:if>
                     	<jstl:forEach items="${canceledOrders}" var="order">
	                        <div class="pb-3">
	                           <div class="p-3 rounded shadow-sm bg-white">
	                              <div class="d-flex border-bottom pb-3">
	                                 <div class="text-muted mr-3">
	                                 	<jstl:choose>
											<jstl:when test="${order.chef.image ne 'NoImage'}">
												<img id="image" src="${order.chef.image}" alt="chefImage" class="img-fluid order_img rounded" style="max-height: 100px;">
											</jstl:when>
											<jstl:otherwise>
												<img id="image" src="../chef/chefResources/image/defaultChef.jpg" alt="chefImage" class="rounded-circle" style="max-height: 100px;">						
											</jstl:otherwise>
										</jstl:choose>
	                                 </div>
	                                 <div>
	                                    <p class="mb-0 font-weight-bold"><a href="#" class="text-dark">${order.chef.firstName} ${order.chef.lastName}</a></p>
	                                    <p class="mb-0">${order.address.homeNo}, ${order.address.societyName}, ${order.address.area} - ${order.address.pincode}</p>
	                                    <p></p>
	                                    <p class="mb-0 small text-primary" style="cursor: pointer" data-toggle="modal" data-target="#orderDetails" onclick="getOrderDetails(${order.id}, ${order.amount})">View Details</p>
	                                 </div>
	                                 <div class="ml-auto">
	                                    <p class="bg-danger text-white py-1 px-2 rounded small mb-1 ml-auto" style="width: 73px;">Canceled</p>
	                                    <p class="mt-2 small font-weight-bold text-center"><i class="feather-clock"></i> <fmt:formatDate value="${order.timestamp}" pattern="dd/MM/yyyy hh:mm a"/></p>
	                                 </div>
	                              </div>
	                              <div class="d-flex pt-3">
	                                 <!-- <div class="small">
	                                    <p class="text- font-weight-bold mb-0">Kesar Sweet x 1</p>
	                                    <p class="text- font-weight-bold mb-0">Gulab Jamun x 4</p>
	                                 </div> -->
	                                 <div class="text-muted m-0 mr-3 small">Total Payment<br>
	                                    <span class="text-dark font-weight-bold">&#x20B9; ${order.amount}</span>
	                                 </div>
	                                 <div class="text-right ml-auto">
	                                    <a href="/user/contact-us" class="btn btn-outline-primary px-3 ml-2">Help</a>
	                                 </div>
	                              </div>
	                           </div>
	                        </div>
                        </jstl:forEach>
                     </div>
                  </div>
                  
                  
               </div>
            </div>
         </div>
      </section>
      
      
      <!-- Order Details Modal -->
		<div class="modal" id="orderDetails">
			<div class="modal-dialog">
				<div class="modal-content">
	
					<!-- Modal Header -->
					<div class="modal-header">
						<h5 class="modal-title">Order Details</h5>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
	
					<!-- Modal body -->
					<div class="modal-body">
	
						<table class="mt-0 table">
							<thead>
								<tr>
									<th>Item</th>
									<th>Price</th>
									<th>Qty.</th>
									<th>Sub-Total</th>
								</tr>
							</thead>
							<tbody id="orderDetailsBody">
								<jstl:forEach items="${sessionScope.orderItems}" var="orderItem">
									<tr>
										<td>${orderItem.product.name}</td>
										<td>&#x20B9;${orderItem.product.price}</td>
										<td>${orderItem.count}</td>
										<td>&#x20B9; ${orderItem.count * orderItem.product.price}</td>
									</tr>
								</jstl:forEach>
								<tr class="font-weight-bold">
									<td>Total</td>
									<td></td>
									<td></td>
									<td id="totalAmount"></td>
								</tr>
							</tbody>
						</table>
						
					</div>
				</div>
			</div>
		</div>
		
		
		
		<!-- Review Modal -->
		<div class="modal" id="review">
			<div class="modal-dialog">
				<div class="modal-content">
	
					<!-- Modal Header -->
					<div class="modal-header">
						<h5 class="modal-title">Review Order</h5>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
	
					<!-- Modal body -->
					<div class="modal-body">
					
						<p class="mt-1 h5 font-weight-bold"> Rate Chef : </p> 
						<div class="h1 mt-1">
							<i class="mdi mdi-star-outline" id="chef-1" onclick="rate('chef',1)"></i>
							<i class="mdi mdi-star-outline" id="chef-2" onclick="rate('chef',2)"></i>
							<i class="mdi mdi-star-outline" id="chef-3" onclick="rate('chef',3)"></i>
							<i class="mdi mdi-star-outline" id="chef-4" onclick="rate('chef',4)"></i>
							<i class="mdi mdi-star-outline" id="chef-5" onclick="rate('chef',5)"></i>
						</div>
						
						<p class="mt-1 h5 font-weight-bold"> Rate Food : </p>
						<div class="h1 mt-1">
							<i class="mdi mdi-star-outline" id="food-1" onclick="rate('food',1)"></i>
							<i class="mdi mdi-star-outline" id="food-2" onclick="rate('food',2)"></i>
							<i class="mdi mdi-star-outline" id="food-3" onclick="rate('food',3)"></i>
							<i class="mdi mdi-star-outline" id="food-4" onclick="rate('food',4)"></i>
							<i class="mdi mdi-star-outline" id="food-5" onclick="rate('food',5)"></i>
						</div>
						
						<p class="mt-1 h5 font-weight-bold"> Comment(Optional) : </p>
						<textarea id="reviewComment" class="w-100 mt-2 px-3 py-2" rows="5" placeholder="ex. It was really delicious taste with great quality." style="font-size: 16px;"></textarea>
						
					</div>
					
					<div class="modal-footer justify-content-center">
						<button class="btn btn-lg py-2 px-3 bg-primary text-white rounded" data-dismiss="modal" onclick="submitReview()">Submit</button>
					</div>
					
				</div>
			</div>
		</div>
      
      
            
      <!-- footer start -->
         <jsp:include page="footer.jsp"></jsp:include>
      <!-- footer end -->

      
      <jsp:include page="bottomMenu.jsp"></jsp:include>
      
      
      <script type="text/javascript" src="userResources/js/user.js"></script>
      <script type="text/javascript" src="userResources/js/jquery.min.js"></script>
      <script type="text/javascript" src="userResources/js/bootstrap.bundle.min.js"></script>
      <script type="text/javascript" src="userResources/js/slick.min.js"></script>
      <script type="text/javascript" src="userResources/js/hc-offcanvas-nav.js"></script>
      <script type="text/javascript" src="userResources/js/osahan.js"></script>
      <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7089c43e/cloudflare-static/rocket-loader.min.js" data-cf-settings="4e43def5a3a50859f7969efd-|49" defer=""></script>
      
   </body>
</html>