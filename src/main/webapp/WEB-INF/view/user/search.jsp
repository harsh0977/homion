<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" type="image/png" href="userResources/image/fav.png">
	<title>Homion - Search</title>
	<link href="userResources/css/feather.css" rel="stylesheet" type="text/css">
	<link href="userResources/css/bootstrap.min.css" rel="stylesheet">
	<link href="userResources/css/style.css" rel="stylesheet">
	<link href="userResources/css/demo.css" rel="stylesheet">
</head>

<body class="fixed-bottom-bar">
	
	<form action="/user/chefDetails" method="post" id="myForm"> <input type="hidden" name="chefId" id="chefId"> </form>

	<!-- header start -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- header end -->

	<div class="d-none">
		<div class="bg-primary p-3 d-flex align-items-center">
			<a class="toggle togglew toggle-2" href="#"><span></span></a>
			<h4 class="font-weight-bold m-0 text-white">Search</h4>
		</div>
	</div>
	<div class="osahan-popular">
		<div class="container">
			<div class="search py-5">
				<div class="input-group mb-4">
					
					<!------------------------------------------- search bar --------------------------------------------->
					
					<input type="text" class="form-control form-control-lg input_search border-right-0" id="searchBar" onkeyup="search()" placeholder="Search your favourite dish or chef...">
					
					<div class="input-group-prepend">
						<div class="btn input-group-text bg-white border_search border-left-0 text-primary">
							<i class="feather-search"></i>
						</div>
					</div>
					
				</div>
				
				<ul class="nav nav-tabs border-0" id="myTab" role="tablist">
					<li class="nav-item float-left" role="presentation">
						<a class="nav-link active border-0 bg-light text-dark rounded" id="dishes-tab" data-toggle="tab" href="#dishes" role="tab" aria-controls="home" aria-selected="true" onclick="enableModal()">
							<i class="feather-home mr-2"></i>Dishes
						</a>
					</li>
					<li class="nav-item float-left" role="presentation">
						<a class="nav-link border-0 bg-light text-dark rounded ml-3" id="chefs-tab" data-toggle="tab" href="#chefs" role="tab" aria-controls="profile" aria-selected="false" onclick="disableModal()">
						<i class="feather-disc mr-2"></i>Chefs</a>
					</li>
				</ul>
				
				<!------------------------------------- Filter button ---------------------------------------->
				
				<span class="float-right" style="margin-top:-35px"><button class="nav-item btn btn-primary" data-toggle="modal" data-target="#filters" id="filterButton"><i class="feather feather-filter"></i></button></span>
				
				<!------------------------------------ Dish or chefs ----------------------------------------->
				
				<div class="tab-content" id="myTabContent">
				
					<!------------------------------------ Dishes -------------------------------------------->

					<div class="tab-pane fade show active" id="dishes" role="tabpanel" aria-labelledby="dishes-tab">
						
						<div class="w-100" style="display: flex;flex-wrap: wrap;margin-top:30px" id="productDiv">
							<jstl:choose>
								<jstl:when test="${fun:length(sessionScope.searchedProducts) == 0  }">
									<div class="row align-items-center justify-content-center py-5 mx-auto">
										<div class="py-5">
											<div class="text-center py-5">
												<p class="h4 mb-4"><i class="feather-search bg-primary text-white rounded p-2"></i></p>
												<p class="font-weight-bold text-dark h5">Search your favourite Dishes!!!!</p>
												<p>we will provide you with the best matches.</p>
											</div>
										</div>
									</div>
								</jstl:when>
								
								<jstl:otherwise>
									<jstl:forEach items="${sessionScope.searchedProducts}" var="product">
											<div class="col-md-3 pb-3">
												<div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
													<div class="list-card-image">
														<div class="star position-absolute">
															<span class="badge badge-success">
															<i class="feather-star"></i> ${product.rating} (${product.count})</span>
														</div>
														<!-- <div class="favourite-heart text-danger position-absolute">
															<a href="#"><i class="feather-heart"></i></a>
														</div> -->
														<jstl:if test="${product.openForHome eq true}">
															<div class="member-plan position-absolute">
																<span class="badge badge-dark">Available for home</span>
															</div>
														</jstl:if>
														<a onclick="setChefId(${product.chef.id})"> <img alt="#" src="${product.image }" class="img-fluid item-img w-100" style="max-height:222px"></a>
													</div>
													<div class="p-3 position-relative">
														<div class="list-card-body">
															<h6 class="mb-1">
																<a onclick="setChefId(${product.chef.id})" class="text-black">${product.name } by ${product.chef.firstName} ${product.chef.lastName } </a>
															</h6>
															<p class="text-gray mb-1 mt-2 small">${product.category.name } | ${product.subCategory.name }</p>
															<p class="text-gray m-0 mt-2">
		                    									<span class="text-danger font-weight-bold"> &#x20B9;${product.price} FOR ${product.unitValue} ${product.unit}</span>
		                  									</p>
															<p class="text-gray mb-1 rating">
															<ul class="rating-stars list-unstyled float-right mt-n4">
																<li>
																	<jstl:forEach begin="1" end="${product.rating }">
																		<i class="feather-star star_active"></i>
																	</jstl:forEach>
																	<jstl:forEach begin="1" end="${5 - product.rating }">
																		<i class="feather-star"></i>
																	</jstl:forEach> 
																</li>
															</ul>
															</p>
														</div>
													</div>
												</div>
											</div>
										</jstl:forEach>
									</jstl:otherwise>
							</jstl:choose>
						</div>
					</div>
					
					<!------------------------------- Chefs -------------------------------->
					
					<div class="tab-pane fade" id="chefs" role="tabpanel" aria-labelledby="chefs-tab">
					
						<div class="w-100" style="display: flex;flex-wrap: wrap;margin-top:30px" id="chefDiv">
						<jstl:choose>
							<jstl:when test="${fun:length(sessionScope.searchedChefs) == 0 }">
								<div class="row align-items-center justify-content-center py-5 mx-auto">
										<div class="py-5">
											<div class="text-center py-5">
												<p class="h4 mb-4"><i class="feather-search bg-primary text-white rounded p-2"></i></p>
												<p class="font-weight-bold text-dark h5">Search your favourite Chefs!!!!</p>
												<p>we will provide you with the best matches.</p>
											</div>
										</div>
									</div>
							</jstl:when>
							
							<jstl:otherwise>
								<jstl:forEach items="${sessionScope.searchedChefs }" var="chef">
											<div class="col-md-3 pb-3">
												<div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
													<div class="list-card-image">
														<div class="star position-absolute">
															<span class="badge badge-success">
															<i class="feather-star"></i> ${chef.rating} (${chef.count})</span>
														</div>
														<!-- <div class="favourite-heart text-danger position-absolute">
															<a href="#"><i class="feather-heart"></i></a>
														</div> -->
														
														<jstl:choose>
										                  	<jstl:when test="${chef.image ne 'NoImage'}">
										                  		<a onclick="setChefId(${chef.id})"><img alt="chefImage" src="${chef.image}" class="img-fluid item-img w-100" style="max-height:222px"></a>
										                  	</jstl:when>
										                  	<jstl:otherwise>
										                  		<a onclick="setChefId(${chef.id})"><img alt="chefImage" src="../chef/chefResources/image/defaultChef.jpg" class="img-fluid item-img w-100" style="max-height:222px"></a>
										                  	</jstl:otherwise>
										                 </jstl:choose>
													</div>
													<div class="p-3 position-relative">
														<div class="list-card-body">
															<h6 class="mb-1">
																<a onclick="setChefId(${chef.id})" class="text-black">${chef.firstName} ${chef.lastName } </a>
															</h6>
															<p class="text-gray mb-1 rating">
															<ul class="rating-stars list-unstyled float-right mt-n4">
																<li>
																	<jstl:forEach begin="1" end="${chef.rating }">
																		<i class="feather-star star_active"></i>
																	</jstl:forEach>
																	<jstl:forEach begin="1" end="${5 - chef.rating }">
																		<i class="feather-star"></i>
																	</jstl:forEach> 
																</li>
															</ul>
															</p>
														</div>
														
													</div>
												</div>
											</div>
									</jstl:forEach>
								</jstl:otherwise>
							</jstl:choose>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<jsp:include page="bottomMenu.jsp"></jsp:include>

	<!-- footer start -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer end -->

	<div class="modal fade" id="filters" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Filters</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="filterForm">
					
						<h6>SORT BY</h6>
						<div class="custom-control  border-bottom custom-radio">
							<input type="radio" id="topRated" name="sort" class="custom-control-input" value=1  checked> 
							<label class="custom-control-label w-100" for="topRated" style="cursor:pointer">Top Rated</label>
						</div>
						<div class="custom-control mt-3 border-bottom custom-radio">
							<input type="radio" id="costHighToLow" name="sort" class="custom-control-input" value=2> 
							<label class="custom-control-label w-100" for="costHighToLow" style="cursor:pointer">Cost High to Low</label>
						</div>
						<div class="custom-control mt-3 border-bottom custom-radio">
							<input type="radio" id="costLowToHigh" name="sort" class="custom-control-input" value=3> 
							<label class="custom-control-label w-100" for="costLowToHigh" style="cursor:pointer">Cost Low to High</label>
						</div>
						
						<h6 class="mt-4">FILTER</h6>
						<div class="custom-control border-bottom mt-3 custom-checkbox">
							<input type="checkbox" class="custom-control-input filter" id="prepareAtHome" value=4> 
							<label class="custom-control-label w-100" for="prepareAtHome" style="cursor:pointer">Available to prepare at home</label>
						</div>
						<div class="custom-control border-bottom mt-3 custom-checkbox">
							<input type="checkbox" class="custom-control-input filter" id="jain" value=5> 
							<label class="custom-control-label w-100" for="jain" style="cursor:pointer">Jain Available</label>
						</div>
						
					</form>
				</div>
				<div class="modal-footer p-0 border-0">
					<div class="col-6 m-0 p-0">
						<button type="button" class="btn border-top btn-lg btn-block" data-dismiss="modal">Close</button>
					</div>
					<div class="col-6 m-0 p-0">
						<button type="button" class="btn btn-primary btn-lg btn-block" data-dismiss="modal" onclick="filter()">Apply</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="userResources/js/user.js"></script>
    <script type="text/javascript" src="userResources/js/jquery.min.js"></script>
    <script type="text/javascript" src="userResources/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="userResources/js/slick.min.js"></script>
    <script type="text/javascript" src="userResources/js/hc-offcanvas-nav.js"></script>
    <script type="text/javascript" src="userResources/js/osahan.js"></script>
    <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7089c43e/cloudflare-static/rocket-loader.min.js" data-cf-settings="4e43def5a3a50859f7969efd-|49" defer=""></script>
	
</body>
</html>