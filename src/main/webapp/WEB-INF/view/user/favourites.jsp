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
	<title>Homion - Favourites</title>
	<link rel="stylesheet" href="../chef/chefResources/css/materialdesignicons.min.css">
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
			<h4 class="font-weight-bold m-0 text-white">Favourites</h4>
		</div>
	</div>

	<div class="osahan-popular">
		<div class="container">
			<div class="search py-5">
				
				<ul class="nav nav-tabs border-0" id="myTab" role="tablist">
					<li class="nav-item float-left" role="presentation">
						<a class="nav-link active border-0 bg-light text-dark rounded" id="dishes-tab" data-toggle="tab" href="#dishes" role="tab" aria-controls="home" aria-selected="true" onclick="updateProducts()">
							<i class="feather-home mr-2"></i>Dishes
						</a>
					</li>
					<li class="nav-item float-left" role="presentation">
						<a class="nav-link border-0 bg-light text-dark rounded ml-3" id="chefs-tab" data-toggle="tab" href="#chefs" role="tab" aria-controls="profile" aria-selected="false" onclick="updateChefs()">
						<i class="feather-disc mr-2"></i>Chefs</a>
					</li>
				</ul>
								
				<div class="tab-content" id="myTabContent">
				
					<!------------------------------------ Dishes -------------------------------------------->

					<div class="tab-pane fade show active" id="dishes" role="tabpanel" aria-labelledby="dishes-tab">
						
						<div class="w-100" style="display: flex;flex-wrap: wrap;margin-top:30px" id="productDiv">
							<jstl:choose>
								<jstl:when test="${empty favouriteProducts}">
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
									<jstl:forEach items="${favouriteProducts}" var="product">
											<div class="col-md-3 pb-3">
												<div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
													<div class="list-card-image">
														<div class="star position-absolute">
															<span class="badge badge-success">
															<i class="feather-star"></i> ${product.rating} (${product.count})</span>
														</div>
														<div class="favourite-heart position-absolute">
								                       		<i class="mdi-18px mdi mdi-heart favourite" style="cursor: pointer" id="${product.id}" onclick="favourite(${product.id}, 'Product');"></i>
								                        </div>
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
							<jstl:when test="${empty favouriteChefs}">
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
								<form action="/user/chefDetails" method="post" id="myForm"> <input type="hidden" name="chefId" id="chefId"> </form>
								<jstl:forEach items="${favouriteChefs}" var="chef">
											<div class="col-md-3 pb-3">
												<div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
													<div class="list-card-image">
														<div class="star position-absolute">
															<span class="badge badge-success">
															<i class="feather-star"></i> ${chef.rating} (${chef.count})</span>
														</div>
														<div class="favourite-heart position-absolute">
								                       		<i class="mdi-18px mdi mdi-heart favourite" style="cursor: pointer" id="${chef.id}" onclick="favourite(${chef.id}, 'Chef');"></i>
								                        </div>
														<a class="d-block text-center" onclick="setChefId(${chef.id})" style="cursor: pointer;">
															<jstl:choose>
											                  	<jstl:when test="${chef.image ne 'NoImage'}">
											                  		<a onclick="setChefId(${chef.id})"><img alt="chefImage" src="${chef.image}" class="img-fluid item-img w-100" style="max-height:222px"></a>
											                  	</jstl:when>
											                  	<jstl:otherwise>
											                  		<a onclick="setChefId(${chef.id})"><img alt="chefImage" src="../chef/chefResources/image/defaultChef.jpg" class="img-fluid item-img w-100" style="max-height:222px"></a>
											                  	</jstl:otherwise>
											                 </jstl:choose>
										                 </a>
													</div>
													<div class="p-3 position-relative">
														<div class="list-card-body">
															<h6 class="mb-1">
																<a onclick="setChefId(${chef.id})" style="cursor: pointer;" class="text-black">${chef.firstName} ${chef.lastName } </a>
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