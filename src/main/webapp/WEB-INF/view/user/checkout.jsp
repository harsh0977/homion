<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang="en">

   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link rel="icon" type="image/png" href="userResources/image/fav.png">
      <title>Homion - Checkout</title>
      <link href="userResources/css/feather.css" rel="stylesheet" type="text/css">
      <link href="userResources/css/bootstrap.min.css" rel="stylesheet">
      <link href="userResources/css/style.css" rel="stylesheet">
      <link href="userResources/css/demo.css" rel="stylesheet">
   </head>
   
   <body class="fixed-bottom-bar">
     
     <!-- header start -->
         <jsp:include page="header.jsp"></jsp:include>
     <!-- header end -->
     
      <div class="osahan-checkout">
         
         
         <div class="d-none">
            <div class="bg-primary border-bottom p-3 d-flex align-items-center">
               <a class="toggle togglew toggle-2" href="#"><span></span></a>
               <h4 class="font-weight-bold m-0 text-white">Checkout</h4>
            </div>
         </div>
         
         
         <div class="container position-relative">
            <div class="py-5 row">
               <div class="col-md-8 mb-3">
                  <div>
                     <div class="osahan-cart-item mb-3 rounded shadow-sm bg-white overflow-hidden">
                        <div class="osahan-cart-item-profile bg-white p-3">
                           <div class="d-flex flex-column">
                              <h6 class="mb-3 font-weight-bold">Delivery Address</h6>
                              <div class="row">
                                 <jstl:forEach items="${addresses}" var="address">
									<div class="custom-control col-lg-6 custom-radio mb-3 position-relative border-custom-radio" onclick="setAddress(${address.id})">
										<input type="radio" id="${address.id}" name="address" class="custom-control-input" checked> 
										<label class="custom-control-label w-100" for="${address.id}">
											<div>
												<div class="p-3 bg-white rounded shadow-sm w-100">
													<div class="d-flex align-items-center mb-2">
														<h6 class="mb-0">${address.type }</h6>
														<!-- <p class="mb-0 badge badge-success ml-auto">
															<i class="icofont-check-circled"></i> Default
														</p> -->
													</div>
													<p class="small text-muted m-0">${address.homeNo} / ${address.societyName},</p>
													<p class="small text-muted m-0">${address.landmark}, ${address.area} - ${address.pincode}</p>
												</div>
												<a data-toggle="modal" data-target="#exampleModal"
													class="btn btn-block btn-light border-top"
													onclick="setForm(${address.id}, '${address.type }', ${address.homeNo}, '${address.societyName}', '${address.landmark}', '${address.area}', ${address.pincode})">Edit</a>
											</div>
										</label>
									</div>
									<jstl:set var="addressId" value="${address.id}"></jstl:set>
								</jstl:forEach>
                              </div>
                              <a class="btn btn-primary" href="#" data-toggle="modal" data-target="#exampleModal" onclick="resetForm()"> ADD NEW ADDRESS </a>
                           </div>
                        </div>
                     </div>
                     
                     
                     <div class="accordion mb-3 rounded shadow-sm bg-white overflow-hidden" id="accordionExample">
                        <%-- <div class="osahan-card bg-white border-bottom overflow-hidden">
                           <div class="osahan-card-header" id="headingOne">
                              <h2 class="mb-0">
                                 <button class="d-flex p-3 align-items-center btn btn-link w-100" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                 <i class="feather-credit-card mr-3"></i> Credit/Debit Card
                                 <i class="feather-chevron-down ml-auto"></i>
                                 </button>
                              </h2>
                           </div>
                           <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                              <div class="osahan-card-body border-top p-3">
                                 <h6 class="m-0">Add new card</h6>
                                 <p class="small">WE ACCEPT <span class="osahan-card ml-2 font-weight-bold">( Master Card / Visa Card / Rupay )</span></p>
                                 <form>
                                    <div class="form-row">
                                       <div class="col-md-12 form-group">
                                          <label class="form-label font-weight-bold small">Card number</label>
                                          <div class="input-group">
                                             <input placeholder="Card number" type="number" class="form-control">
                                             <div class="input-group-append"><button type="button" class="btn btn-outline-secondary"><i class="feather-credit-card"></i></button></div>
                                          </div>
                                       </div>
                                       <div class="col-md-8 form-group"><label class="form-label font-weight-bold small">Valid through(MM/YY)</label><input placeholder="Enter Valid through(MM/YY)" type="number" class="form-control"></div>
                                       <div class="col-md-4 form-group"><label class="form-label font-weight-bold small">CVV</label><input placeholder="Enter CVV Number" type="number" class="form-control"></div>
                                       <div class="col-md-12 form-group"><label class="form-label font-weight-bold small">Name on card</label><input placeholder="Enter Card number" type="text" class="form-control"></div>
                                       <div class="col-md-12 form-group mb-0">
                                          <div class="custom-control custom-checkbox"><input type="checkbox" id="custom-checkbox1" class="custom-control-input"><label title="" type="checkbox" for="custom-checkbox1" class="custom-control-label small pt-1">Securely save this card for a faster checkout next time.</label></div>
                                       </div>
                                    </div>
                                 </form>
                              </div>
                           </div>
                        </div> --%>
                        
                        
                        <%-- <div class="osahan-card bg-white border-bottom overflow-hidden">
                           <div class="osahan-card-header" id="headingTwo">
                              <h2 class="mb-0">
                                 <button class="d-flex p-3 align-items-center btn btn-link w-100" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="fasle" aria-controls="collapseTwo">
                                 <i class="feather-globe mr-3"></i> Net Banking
                                 <i class="feather-chevron-down ml-auto"></i>
                                 </button>
                              </h2>
                           </div>
                           <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                              <div class="osahan-card-body border-top p-3">
                                 <form>
                                    <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                       <label class="btn btn-outline-secondary active">
                                       <input type="radio" name="options" id="option1" checked> HDFC
                                       </label>
                                       <label class="btn btn-outline-secondary">
                                       <input type="radio" name="options" id="option2"> ICICI
                                       </label>
                                       <label class="btn btn-outline-secondary">
                                       <input type="radio" name="options" id="option3"> AXIS
                                       </label>
                                    </div>
                                    <hr>
                                    <div class="form-row">
                                       <div class="col-md-12 form-group mb-0">
                                          <label class="form-label small font-weight-bold">Select Bank</label><br>
                                          <select class="custom-select form-control">
                                             <option>Bank</option>
                                             <option>KOTAK</option>
                                             <option>SBI</option>
                                             <option>UCO</option>
                                          </select>
                                       </div>
                                    </div>
                                 </form>
                              </div>
                           </div>
                        </div> --%>
                        
                        
                        <div class="osahan-card bg-white overflow-hidden">
                           <div class="osahan-card-header" id="headingThree">
                              <h2 class="mb-0">
                                 <button class="d-flex p-3 align-items-center btn btn-link w-100" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                 &#x20B9; &nbsp; Cash on Delivery
                                 <i class="feather-chevron-down ml-auto"></i>
                                 </button>
                              </h2>
                           </div>
                           <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                              <div class="card-body border-top">
                                 <h6 class="mb-3 mt-0 mb-3 font-weight-bold">Cash</h6>
                                 <p class="m-0">Please keep exact change handy to help us serve you better</p>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               
               
               
               
               	   <!-- ****************** checkout card ********************** -->
               		
	               <div class="col-md-4">
					<div class="osahan-cart-item rounded rounded shadow-sm overflow-hidden bg-white sticky_sidebar">
						<div class="d-flex border-bottom osahan-cart-item-profile bg-white p-3">
							<div class="d-flex flex-column">
								<h6 class="mb-1 font-weight-bold">${chef.firstName} ${chef.lastName}</h6>
								<p class="mb-0 small text-muted">
									<i class="feather-map-pin"></i> ${chefAddress.homeNo}, ${chefAddress.societyName}, ${chefAddress.landmark}, ${chefAddress.area} - ${chefAddress.pincode}
								</p>
							</div>
						</div>
						
						<div class="bg-white py-2" id="cart">
							<jstl:choose>
								<jstl:when test="${cartItems.size() eq 0}">
									<div class="mt-3" id="cartEmptyMsg">
										<h6 class="text-muted text-center">Your cart is empty.</h6>
										<h6 class="text-muted text-center">Add items in your cart.</h6>
									</div>
								</jstl:when>
								<jstl:otherwise>
									<jstl:set var="toPay" value="0"></jstl:set>
									<jstl:forEach items="${cartItems}" var="cartItem">
										<div class="gold-members d-flex align-items-center justify-content-between px-3 py-2 border-bottom">
				                           <div class="media align-items-center">
				                              <div class="mr-2 text-success">·</div>
				                              <div class="media-body">
				                                 <p class="m-0">${cartItem.product.name} x ${cartItem.count}</p>
				                              </div>
				                           </div>
				                           <div class="d-flex align-items-center">
				                              <%-- <span class="count-number float-right"><button type="button" class="btn-sm left dec btn btn-outline-secondary"> <i class="feather-minus"></i> </button><input class="count-number-input" type="text" readonly="true" value="${cartItem.count}"><button type="button" class="btn-sm right inc btn btn-outline-secondary"> <i class="feather-plus"></i> </button></span> --%>
				                              <jstl:set var="price" value="${cartItem.product.price * cartItem.count}"></jstl:set>
				                              <jstl:set var="toPay" value="${toPay + price }"></jstl:set>
				                              <p class="text-gray mb-0 float-right ml-2 text-muted small">&#x20B9; ${price}</p>
				                           </div>
				                        </div>
				                    </jstl:forEach>
								</jstl:otherwise>
							</jstl:choose>
						</div>
						
						
						<!-- <div class="bg-white p-3 py-3 border-bottom clearfix">
							<div class="input-group-sm mb-2 input-group">
								<input placeholder="Enter promo code" type="text"
									class="form-control">
								<div class="input-group-append">
									<button type="button" class="btn btn-primary">
										<i class="feather-percent"></i> APPLY
									</button>
								</div>
							</div>
							<div class="mb-0 input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i
										class="feather-message-square"></i></span>
								</div>
								<textarea placeholder="Any suggestions? We will pass it on..."
									aria-label="With textarea" class="form-control"></textarea>
							</div>
						</div> -->
						
						
						<div class="bg-white pb-3 pl-3 pr-3 clearfix border-bottom">
							<!-- <p class="mb-1">
								Item Total <span class="float-right text-dark">$3140</span>
							</p>
							<p class="mb-1">
								Restaurant Charges <span class="float-right text-dark">$62.8</span>
							</p>
							<p class="mb-1">
								Delivery Fee<span class="text-info ml-1"><i
									class="feather-info"></i></span><span class="float-right text-dark">$10</span>
							</p>
							<p class="mb-1 text-success">
								Total Discount<span class="float-right text-success">$1884</span>
							</p> -->
							<hr>
							<h6 class="font-weight-bold mb-0">
								TO PAY <span class="float-right" id="toPay">&#x20B9; ${toPay}</span>
							</h6>
						</div>
						<div class="p-3">
							<form action="/user/placeOrder" method="post">
								<input type="hidden" name="chefId" value="${chef.id}">
								<input type="hidden" name="amount" value="${toPay}">
								<input type="hidden" name="addressId" id="selectedAddress" value="${addressId}">
								<button type="submit" class="btn btn-success btn-block btn-lg" id="checkoutBtn">PLACE ORDER <i class="feather-arrow-right"></i></button>
							</form>
						</div>
					</div>
				</div>
               
            </div>
         </div>
      </div>
		
      <!-- footer start -->
         <jsp:include page="footer.jsp"></jsp:include>
      <!-- footer end -->
     
      <!-- Add address Start -->
							
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Add Delivery Address</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form:form action="/user/addAddress" method="post" modelAttribute="address" id="addressForm">
						<div class="modal-body">
							<form:hidden path="id" id="addressId"/>
								<div class="form-row">
									<div class="col-md-12 form-group">
										<label class="form-label">Home No/ Flat No</label>
										<div class="input-group">
											<form:input path="homeNo" placeholder="Home No/ Flat No" id="homeNo" type="number" class="form-control" required="required"/>
											<div class="input-group-append">
												<button type="button" class="btn btn-outline-secondary">
													<i class="fad fa-location"></i>
												</button>
											</div>
										</div>
									</div>
									<div class="col-md-12 form-group">
										<label class="form-label">Society Name</label>
										<form:input path="societyName" placeholder="Society Name" id="societyName" type="text" class="form-control" required="required"/>
									</div>
									<div class="col-md-12 form-group">
										<label class="form-label">Landmark</label>
										<form:input path="landmark" placeholder="Landmark" id="landmark" type="text" class="form-control" required="required"/>
									</div>
									<div class="col-md-12 form-group">
										<label class="form-label">Area</label>
										<form:select path="area" placeholder="state" id="area" type="text" class="form-control" onchange="setPincode(this);" required="required">
											<option value=""> -- Select --</option>
											<jstl:forEach items="${areas}" var="area">
												<form:option value="${area.pincode}">${area.name}</form:option>
											</jstl:forEach>
										</form:select>
									</div> 
									
									<input type="hidden" name="hiddenArea" id="hiddenArea">
									
									<div class="col-md-12 form-group">
										<label class="form-label">Pin Code </label>
										<form:input path="pincode" placeholder="PIN Code" id="pincode" type="text" class="form-control" required="required"  readonly="true"/>
									</div>
									<div class="mb-0 col-md-12 form-group">
										<label class="form-label">Type</label>
										<div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
											<label class="btn btn-outline-secondary active"  id="Home"> 
												<form:radiobutton path="type" value="Home"/> Home 
											</label> 
											<label class="btn btn-outline-secondary"  id="Work"> 
												<form:radiobutton path="type"  value="Work"/> Work 
											</label> 
											<label class="btn btn-outline-secondary"  id="Other"> 
												<form:radiobutton path="type" value="Other"/> Other
											</label>
										</div>
									</div>
								</div>
							</div>
						<div class="modal-footer p-0 border-0">
							<div class="col-6 m-0 p-0">
								<button type="button" class="btn border-top btn-lg btn-block" data-dismiss="modal">Close</button>
							</div>
							<div class="col-6 m-0 p-0">
								<input type="submit" class="btn btn-primary btn-lg btn-block" value="Save changes"/>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<!-- Add address End -->
      
      
      <jsp:include page="bottomMenu.jsp"></jsp:include>
      
      <script type="text/javascript" src="userResources/js/user.js"></script>
      <script type="text/javascript" src="../chef/chefResources/js/chef.js"></script>
      <script type="text/javascript" src="userResources/js/jquery.min.js"></script>
      <script type="text/javascript" src="userResources/js/bootstrap.bundle.min.js"></script>
      <script type="text/javascript" src="userResources/js/slick.min.js"></script>
      <script type="text/javascript" src="userResources/js/hc-offcanvas-nav.js"></script>
      <script type="text/javascript" src="userResources/js/osahan.js"></script>
      <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7089c43e/cloudflare-static/rocket-loader.min.js" data-cf-settings="4e43def5a3a50859f7969efd-|49" defer=""></script>
      
   </body>
</html>