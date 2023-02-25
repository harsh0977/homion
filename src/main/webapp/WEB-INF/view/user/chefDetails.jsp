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
	<title>Homion - Chef Name</title>
	<link rel="stylesheet" type="text/css" href="userResources/css/slick.min.css" />
	<link rel="stylesheet" type="text/css" href="userResources/css/slick-theme.min.css" />
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
		<div class="bg-primary p-3 d-flex align-items-center">
			<a class="toggle togglew toggle-2" href="#"><span></span></a>
			<h4 class="font-weight-bold m-0 text-white">Homion</h4>
		</div>
	</div>
	
	
	
	<!-- ***************** Chef Details start ********************************* -->
	
	<div class="offer-section py-4">
		<div class="container position-relative">
			<jstl:choose>
				<jstl:when test="${chef.image ne 'NoImage'}">
					<img alt="#" src="${chef.image}" class="restaurant-pic">
				</jstl:when>
				<jstl:otherwise>
					<img alt="#" src="../chef/chefResources/image/defaultChef.jpg" class="restaurant-pic">						
				</jstl:otherwise>
			</jstl:choose>
			
			<div class="pt-3 text-white">
				<h2 class="font-weight-bold">${chef.firstName} ${chef.lastName}</h2>
				<p class="text-white m-0">${address.homeNo}, ${address.societyName}, ${address.landmark}, ${address.area} - ${address.pincode}</p>
				<div class="rating-wrap d-flex align-items-center mt-2">
					<ul class="rating-stars list-unstyled">
						<li>
							<jstl:forEach begin="1" end="${chef.rating}">
								<i class="feather-star text-warning"></i>
							</jstl:forEach>
							<jstl:forEach begin="1" end="${5 - chef.rating}">
								<i class="feather-star"></i>
							</jstl:forEach>
						</li>
					</ul>
					<p class="label-rating text-white ml-2 small">(${chef.count} Reviews)</p>
				</div>
			</div>
			<div class="pb-4">
				<div class="row">
					<div class="col-6 col-md-2">
						<p class="text-white-50 font-weight-bold m-0 small">Start Time</p>
						<p class="text-white m-0">${chef.startTime}</p>
					</div>
					<div class="col-6 col-md-2">
						<p class="text-white-50 font-weight-bold m-0 small">Close Time</p>
						<p class="text-white m-0">${chef.endTime}</p>
					</div>
				</div>
			</div>
			<jstl:choose>
		        <jstl:when test="${isFavourite}">
		          <button type="button" class="btn btn-danger" id="${chef.id}" onclick="favouriteChef(${chef.id});"><i class="feather-heart"></i> Remove from Favourite </button>
		        </jstl:when>
		        <jstl:otherwise>
		          <button type="button" class="btn btn-light" id="${chef.id}" onclick="favouriteChef(${chef.id});"><i class="feather-heart"></i> Add to Favourite </button>
		        </jstl:otherwise>
		    </jstl:choose>
		</div>
	</div>
	
	<jstl:if test="${chef.about ne null}">
		<div class="container">
			<div class="p-3 bg-primary bg-primary mt-n3 rounded position-relative">
				<div class="d-flex align-items-center">
					<div class="feather_icon text-white text-justify mr-3">
						${chef.about}
					</div>
					<!-- <a href="#review" class="btn btn-sm btn-outline-light ml-auto">Review</a> -->
				</div>
			</div>
		</div>
	</jstl:if>
	
	<!-- ***************** Chef Details end ********************************* -->
	
	
	
	<!-- ********************** Product slider *********************************** -->
	<div class="container">
		<div class="">
			<p class="font-weight-bold pt-4 m-0">FEATURED ITEMS</p>
			<div class="trending-slider rounded">
				<jstl:forEach items="${products}" var="product" begin="0" end="4">
					<div class="osahan-slider-item">
						<div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
							<div class="list-card-image">
								<div class="star position-absolute"><span class="badge badge-success"><i class="feather-star"></i> ${product.rating} (${product.count})</span></div>
								<div class="favourite-heart text-danger position-absolute"><a href="#"><i class="feather-heart"></i></a></div>
								<jstl:if test="${product.openForHome eq true}">
	                        		<div class="member-plan position-absolute"><span class="badge badge-danger">Available For Home</span></div>
	                        	</jstl:if>
								<img alt="#" src="${product.image}" class="img-fluid item-img w-100" style="max-height: 185px;">
							</div>
							<div class="p-3 position-relative">
								<div class="list-card-body">
									<h6 class="mb-1">
										<p class="text-black">${product.name}</p>
									</h6>
									<span class="bg-light text-dark rounded-sm pl-2 pb-1 pt-1 pr-2 float-right mt-n5"><i class="feather-clock"></i> ${product.preparationTime} min</span>
									<p class="text-gray mb-3 mt-n3">${product.subCategory.name}, ${product.category.name}</p>
									<p class="text-gray m-0 mt-n2">
										<span class="text-danger font-weight-bold"> &#x20B9;${product.price} FOR ${product.unitValue} ${product.unit}</span>
									</p>
									<jstl:choose>
										<jstl:when test="${product.status eq 'available'}">
											<span class="float-right mt-n4"><button class="btn btn-primary btn-sm text-white" id="slider${product.id}" onclick="addToCart(${product.id},'${product.name}',${product.price})">ADD</button></span>
										</jstl:when>
										<jstl:otherwise>
											<span class="float-right mt-n4 p-2 badge badge-dark">OUT OF STOCK</span>
										</jstl:otherwise>
									</jstl:choose>
								</div>
							</div>
						</div>
					</div>
				</jstl:forEach>
			</div>
		</div>
	</div>
	
	
	
	
	<!-- **************************** Chef menu ****************************** -->
	
	<div class="container position-relative">
		<div class="row">
			<div class="col-md-8 pt-3">
				<div class="shadow-sm rounded bg-white mb-3 overflow-hidden">
					<div class="d-flex item-aligns-center">
						<p class="font-weight-bold h6 p-3 border-bottom mb-0 w-100">Menu</p>
					</div>
					
					<jstl:forEach items="${subCategories}" var="subCategory">
						<div class="row m-0">
							<h6 class="p-3 m-0 bg-light w-100">
								${subCategory}
							</h6>
							<jstl:forEach items="${products}" var="product">
								<jstl:if test="${product.subCategory.name eq subCategory}">
									<div class="col-md-12 px-0 border-top">
										<div class="">
											<div class="p-3 border-bottom gold-members">
												<jstl:choose>
													<jstl:when test="${product.status eq 'available'}">
														<span class="float-right"><button class="btn btn-outline-secondary btn-sm" id="${product.id}" onclick="addToCart(${product.id},'${product.name}',${product.price})">ADD</button></span>
													</jstl:when>
													<jstl:otherwise>
														<span class="float-right badge badge-dark p-2">OUT OF STOCK</span>
													</jstl:otherwise>
												</jstl:choose>
												<div class="media">
													<div class="mr-3 font-weight-bold text-success non_veg">.</div>
													<div class="media-body">
														<h6 class="mb-1">${product.name}
															<jstl:if test="${product.rating ge 4}"> 
																<span class="badge badge-danger">Best Seller</span>
															</jstl:if>
														</h6>
														<p class="text-muted mb-0">&#x20B9;${product.price} FOR ${product.unitValue} ${product.unit}</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</jstl:if>
							</jstl:forEach>
						</div>
					</jstl:forEach>
				</div>
				
				
				
				
				
				<div class="mb-3">
				
					<!-- ******************************* Rating & Review ****************** -->
					
					<div class="bg-white rounded p-3 mb-1 clearfix graph-star-rating rounded shadow-sm">
						<h6 class="mb-0 mb-1">Ratings and Reviews</h6>
						<p class="text-muted mb-4 mt-1 small">Rated ${chef.rating} out of 5</p>
						<div class="graph-star-rating-body">
							<jstl:forEach items="${ratings}" var="rating">
								<div class="rating-list">
									<div class="rating-list-left font-weight-bold small">${rating.key} Star</div>
									<div class="rating-list-center">
										<div class="progress">
											<div role="progressbar" class="progress-bar bg-info"
												aria-valuenow="${rating.value}" aria-valuemin="0" aria-valuemax="100"
												style="width: ${rating.value}%;"></div>
										</div>
									</div>
									<div class="rating-list-right font-weight-bold small"><fmt:formatNumber type="number" maxFractionDigits="1" value="${rating.value}" /> %</div>
								</div>
							</jstl:forEach>
						</div>
						<!-- <div class="graph-star-rating-footer text-center mt-3">
							<button type="button" class="btn btn-primary btn-block btn-sm">Rate
								and Review</button>
						</div> -->
					</div>
					
					
					
					<!-- ************************ Reviews********************** -->
					
					<div class="bg-white p-3 mb-3 mt-4 restaurant-detailed-ratings-and-reviews shadow-sm rounded">
						<p class="text-primary float-right">Top Rated</p>
						<h6 class="mb-1">All Ratings and Reviews</h6>
						<jstl:forEach items="${feedbacks}" var="feedback">
							<div class="reviews-members py-3">
								<div class="media">
									<img alt="#" src="userResources/image/profile.png" class="mr-3 rounded-pill" style ="height: 25px;">
									<div class="media-body">
										<div class="reviews-members-header">
											<div class="star-rating float-right">
												<div class="d-inline-block" style="font-size: 14px;">
													<jstl:forEach begin="1" end="${feedback.chefRating}">
														<i class="feather-star text-warning"></i>
													</jstl:forEach>
													<jstl:forEach begin="1" end="${5 - feedback.chefRating}">
														<i class="feather-star"></i>
													</jstl:forEach>
												</div>
											</div>
										    <!-- <p class="h6  text-dark">Trump</p>
											<p class="text-muted small">Tue, 20 Mar 2020</p> -->
										</div>
										<div class="reviews-members-body">
											<p style="font-size: 14px;">${feedback.comment}</p>
										</div>
									</div>
								</div>
							</div>
							<hr>
						</jstl:forEach>
						
						<!-- <a class="text-center w-100 d-block mt-3 font-weight-bold" href=" /user/">See All Reviews</a> -->
					</div>
					
					
					
					
					
					
					<!-- <div id="review" class="bg-white p-3 rating-review-select-page rounded shadow-sm">
						<h6 class="mb-3">Leave Comment</h6>
						<div class="d-flex align-items-center mb-3">
							<p class="m-0 small">Rate the Place</p>
							<div class="star-rating ml-auto">
								<div class="d-inline-block">
									<i class="feather-star text-warning"></i> <i
										class="feather-star text-warning"></i> <i
										class="feather-star text-warning"></i> <i
										class="feather-star text-warning"></i> <i class="feather-star"></i>
								</div>
							</div>
						</div>
						<form>
							<div class="form-group">
								<label class="form-label small">Your Comment</label>
								<textarea class="form-control"></textarea>
							</div>
							<div class="form-group mb-0">
								<button type="button" class="btn btn-primary btn-block">
									Submit Comment</button>
							</div>
						</form>
					</div> -->
					
					
					
				</div>
			</div>
			<div class="col-md-4 pt-3">
				<div
					class="osahan-cart-item rounded rounded shadow-sm overflow-hidden bg-white sticky_sidebar">
					<div class="d-flex border-bottom osahan-cart-item-profile bg-white p-3">
						<div class="d-flex flex-column">
							<h6 class="mb-1 font-weight-bold">${chef.firstName} ${chef.lastName}</h6>
							<p class="mb-0 small text-muted">
								<i class="feather-map-pin"></i> ${address.homeNo}, ${address.societyName}, ${address.landmark}, ${address.area} - ${address.pincode}
							</p>
						</div>
					</div>
					
					<div class="bg-white py-2" id="cart">
						<!-- cart items added here -->
						<div class="mt-3" id="cartEmptyMsg">
							<h6 class="text-muted text-center">Your cart is empty.</h6>
							<h6 class="text-muted text-center">Add items in your cart.</h6>
						</div>
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
							TO PAY <span class="float-right" id="toPay">&#x20B9; 0</span>
						</h6>
					</div>
					<div class="p-3">
						<button class="btn btn-success btn-block btn-lg disabled" onclick="checkout()" id="checkoutBtn">CHECKOUT<i class="feather-arrow-right"></i></button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<jsp:include page="bottomMenu.jsp"></jsp:include>

	<!-- footer start -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer end -->
	
	
	  <script type="text/javascript" src="userResources/js/user.js"></script>
      <script type="text/javascript" src="userResources/js/jquery.min.js"></script>
      <script type="text/javascript" src="userResources/js/bootstrap.bundle.min.js"></script>
      <script type="text/javascript" src="userResources/js/slick.min.js"></script>
      <script type="text/javascript" src="userResources/js/hc-offcanvas-nav.js"></script>
      <script type="text/javascript" src="userResources/js/osahan.js"></script>
      <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7089c43e/cloudflare-static/rocket-loader.min.js" data-cf-settings="4e43def5a3a50859f7969efd-|49" defer=""></script>
      
</body>
</html>