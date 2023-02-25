<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Askbootstrap">
<meta name="author" content="Askbootstrap">
<link rel="icon" type="image/png" href="userResources/image//fav.png">
<title>Swiggiweb - Online Food Ordering Website Template</title>
<link rel="stylesheet" type="text/css"
	href="userResources/css/slick.min.css" />
<link rel="stylesheet" type="text/css"
	href="userResources/css/slick-theme.min.css" />
<link href="userResources/css/feather.css" rel="stylesheet"
	type="text/css">
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
			<h4 class="font-weight-bold m-0 text-white">Trending</h4>
		</div>
	</div>
	<div class="osahan-trending">
		<div class="container">
			<div class="most_popular py-5">
				<div class="d-flex align-items-center mb-4">
					<h3 class="font-weight-bold text-dark mb-0">Trending</h3>
					<a href="#" data-toggle="modal" data-target="#filters"
						class="ml-auto btn btn-primary">Filters</a>
				</div>
				<div class="row">
					<div class="col-lg-4 mb-3">
						<div
							class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm grid-card">
							<div class="list-card-image">
								<div class="star position-absolute">
									<span class="badge badge-success"><i
										class="feather-star"></i> 3.1 (300+)</span>
								</div>
								<div class="favourite-heart text-danger position-absolute">
									<a href="#"><i class="feather-heart"></i></a>
								</div>
								<div class="member-plan position-absolute">
									<span class="badge badge-dark">Promoted</span>
								</div>
								<a href="restaurant.jsp"> <img alt="#"
									src="userResources/image/trending1.png"
									class="img-fluid item-img w-100">
								</a>
							</div>
							<div class="p-3 position-relative">
								<div class="list-card-body">
									<h6 class="mb-1">
										<a href="restaurant.jsp" class="text-black">The osahan
											Restaurant </a>
									</h6>
									<p class="text-gray mb-3">North • Hamburgers • Pure veg</p>
									<p class="text-gray mb-3 time">
										<span
											class="bg-light text-dark rounded-sm pl-2 pb-1 pt-1 pr-2"><i
											class="feather-clock"></i> 15–25 min</span> <span
											class="float-right text-black-50"> $500 FOR TWO</span>
									</p>
								</div>
								<div class="list-card-badge">
									<span class="badge badge-danger">OFFER</span> <small>65%
										OSAHAN50</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 mb-3">
						<div
							class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm grid-card">
							<div class="list-card-image">
								<div class="star position-absolute">
									<span class="badge badge-success"><i
										class="feather-star"></i> 3.1 (300+)</span>
								</div>
								<div class="favourite-heart text-danger position-absolute">
									<a href="#"><i class="feather-heart"></i></a>
								</div>
								<div class="member-plan position-absolute">
									<span class="badge badge-dark">Promoted</span>
								</div>
								<a href="restaurant.jsp"> <img alt="#"
									src="userResources/image/trending2.png"
									class="img-fluid item-img w-100">
								</a>
							</div>
							<div class="p-3 position-relative">
								<div class="list-card-body">
									<h6 class="mb-1">
										<a href="restaurant.jsp" class="text-black">Thai Famous
											Cuisine</a>
									</h6>
									<p class="text-gray mb-3">North Indian • Indian • Pure veg</p>
									<p class="text-gray mb-3 time">
										<span
											class="bg-light text-dark rounded-sm pl-2 pb-1 pt-1 pr-2"><i
											class="feather-clock"></i> 30–35 min</span> <span
											class="float-right text-black-50"> $250 FOR TWO</span>
									</p>
								</div>
								<div class="list-card-badge">
									<span class="badge badge-success">OFFER</span> <small>65%
										off</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 mb-3">
						<div
							class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm grid-card">
							<div class="list-card-image">
								<div class="star position-absolute">
									<span class="badge badge-success"><i
										class="feather-star"></i> 3.1 (300+)</span>
								</div>
								<div class="favourite-heart text-danger position-absolute">
									<a href="#"><i class="feather-heart"></i></a>
								</div>
								<div class="member-plan position-absolute">
									<span class="badge badge-dark">Promoted</span>
								</div>
								<a href="restaurant.jsp"> <img alt="#"
									src="userResources/image/trending3.png"
									class="img-fluid item-img w-100">
								</a>
							</div>
							<div class="p-3 position-relative">
								<div class="list-card-body">
									<h6 class="mb-1">
										<a href="restaurant.jsp" class="text-black">The osahan
											Restaurant </a>
									</h6>
									<p class="text-gray mb-3">North • Hamburgers • Pure veg</p>
									<p class="text-gray mb-3 time">
										<span
											class="bg-light text-dark rounded-sm pl-2 pb-1 pt-1 pr-2"><i
											class="feather-clock"></i> 15–25 min</span> <span
											class="float-right text-black-50"> $500 FOR TWO</span>
									</p>
								</div>
								<div class="list-card-badge">
									<span class="badge badge-danger">OFFER</span> <small>65%
										OSAHAN50</small>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4 mb-3">
						<div
							class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm grid-card">
							<div class="list-card-image">
								<div class="star position-absolute">
									<span class="badge badge-success"><i
										class="feather-star"></i> 3.1 (300+)</span>
								</div>
								<div class="favourite-heart text-danger position-absolute">
									<a href="#"><i class="feather-heart"></i></a>
								</div>
								<div class="member-plan position-absolute">
									<span class="badge badge-dark">Promoted</span>
								</div>
								<a href="restaurant.jsp"> <img alt="#"
									src="userResources/image/trending4.png"
									class="img-fluid item-img w-100">
								</a>
							</div>
							<div class="p-3 position-relative">
								<div class="list-card-body">
									<h6 class="mb-1">
										<a href="restaurant.jsp" class="text-black">Bite Me
											Sandwiches</a>
									</h6>
									<p class="text-gray mb-3">North Indian • American • Pure
										veg</p>
									<p class="text-gray mb-3 time">
										<span
											class="bg-light text-dark rounded-sm pl-2 pb-1 pt-1 pr-2"><i
											class="feather-clock"></i> 30–35 min</span> <span
											class="float-right text-black-50"> $250 FOR TWO</span>
									</p>
								</div>
								<div class="list-card-badge">
									<span class="badge badge-success">OFFER</span> <small>65%
										off</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 mb-3">
						<div
							class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm grid-card">
							<div class="list-card-image">
								<div class="star position-absolute">
									<span class="badge badge-success"><i
										class="feather-star"></i> 3.1 (300+)</span>
								</div>
								<div class="favourite-heart text-danger position-absolute">
									<a href="#"><i class="feather-heart"></i></a>
								</div>
								<div class="member-plan position-absolute">
									<span class="badge badge-dark">Promoted</span>
								</div>
								<a href="restaurant.jsp"> <img alt="#"
									src="userResources/image/trending5.png"
									class="img-fluid item-img w-100">
								</a>
							</div>
							<div class="p-3 position-relative">
								<div class="list-card-body">
									<h6 class="mb-1">
										<a href="restaurant.jsp" class="text-black">The osahan
											Restaurant </a>
									</h6>
									<p class="text-gray mb-3">North • Hamburgers • Pure veg</p>
									<p class="text-gray mb-3 time">
										<span
											class="bg-light text-dark rounded-sm pl-2 pb-1 pt-1 pr-2"><i
											class="feather-clock"></i> 15–25 min</span> <span
											class="float-right text-black-50"> $500 FOR TWO</span>
									</p>
								</div>
								<div class="list-card-badge">
									<span class="badge badge-danger">OFFER</span> <small>65%
										OSAHAN50</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 mb-3">
						<div
							class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm grid-card">
							<div class="list-card-image">
								<div class="star position-absolute">
									<span class="badge badge-success"><i
										class="feather-star"></i> 3.1 (300+)</span>
								</div>
								<div class="favourite-heart text-danger position-absolute">
									<a href="#"><i class="feather-heart"></i></a>
								</div>
								<div class="member-plan position-absolute">
									<span class="badge badge-dark">Promoted</span>
								</div>
								<a href="restaurant.jsp"> <img alt="#"
									src="userResources/image/trending6.png"
									class="img-fluid item-img w-100">
								</a>
							</div>
							<div class="p-3 position-relative">
								<div class="list-card-body">
									<h6 class="mb-1">
										<a href="restaurant.jsp" class="text-black">Bite Me
											Sandwiches</a>
									</h6>
									<p class="text-gray mb-3">North Indian • American • Pure
										veg</p>
									<p class="text-gray mb-3 time">
										<span
											class="bg-light text-dark rounded-sm pl-2 pb-1 pt-1 pr-2"><i
											class="feather-clock"></i> 30–35 min</span> <span
											class="float-right text-black-50"> $250 FOR TWO</span>
									</p>
								</div>
								<div class="list-card-badge">
									<span class="badge badge-success">OFFER</span> <small>65%
										off</small>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4 mb-3">
						<div
							class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm grid-card">
							<div class="list-card-image">
								<div class="star position-absolute">
									<span class="badge badge-success"><i
										class="feather-star"></i> 3.1 (300+)</span>
								</div>
								<div class="favourite-heart text-danger position-absolute">
									<a href="#"><i class="feather-heart"></i></a>
								</div>
								<div class="member-plan position-absolute">
									<span class="badge badge-dark">Promoted</span>
								</div>
								<a href="restaurant.jsp"> <img alt="#"
									src="userResources/image/trending7.png"
									class="img-fluid item-img w-100">
								</a>
							</div>
							<div class="p-3 position-relative">
								<div class="list-card-body">
									<h6 class="mb-1">
										<a href="restaurant.jsp" class="text-black">The osahan
											Restaurant </a>
									</h6>
									<p class="text-gray mb-3">North • Hamburgers • Pure veg</p>
									<p class="text-gray mb-3 time">
										<span
											class="bg-light text-dark rounded-sm pl-2 pb-1 pt-1 pr-2"><i
											class="feather-clock"></i> 15–25 min</span> <span
											class="float-right text-black-50"> $500 FOR TWO</span>
									</p>
								</div>
								<div class="list-card-badge">
									<span class="badge badge-danger">OFFER</span> <small>65%
										OSAHAN50</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 mb-3">
						<div
							class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm grid-card">
							<div class="list-card-image">
								<div class="star position-absolute">
									<span class="badge badge-success"><i
										class="feather-star"></i> 3.1 (300+)</span>
								</div>
								<div class="favourite-heart text-danger position-absolute">
									<a href="#"><i class="feather-heart"></i></a>
								</div>
								<div class="member-plan position-absolute">
									<span class="badge badge-dark">Promoted</span>
								</div>
								<a href="restaurant.jsp"> <img alt="#"
									src="userResources/image/trending8.png"
									class="img-fluid item-img w-100">
								</a>
							</div>
							<div class="p-3 position-relative">
								<div class="list-card-body">
									<h6 class="mb-1">
										<a href="restaurant.jsp" class="text-black">Bite Me
											Sandwiches</a>
									</h6>
									<p class="text-gray mb-3">North Indian • American • Pure
										veg</p>
									<p class="text-gray mb-3 time">
										<span
											class="bg-light text-dark rounded-sm pl-2 pb-1 pt-1 pr-2"><i
											class="feather-clock"></i> 30–35 min</span> <span
											class="float-right text-black-50"> $250 FOR TWO</span>
									</p>
								</div>
								<div class="list-card-badge">
									<span class="badge badge-success">OFFER</span> <small>65%
										off</small>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div
			class="osahan-menu-fotter fixed-bottom bg-white px-3 py-2 text-center d-none">
			<div class="row">
				<div class="col">
					<a href="home.jsp"
						class="text-dark small font-weight-bold text-decoration-none">
						<p class="h4 m-0">
							<i class="feather-home"></i>
						</p> Home
					</a>
				</div>
				<div class="col selected">
					<a href="trending.jsp"
						class="text-danger small font-weight-bold text-decoration-none">
						<p class="h4 m-0">
							<i class="feather-map-pin text-danger"></i>
						</p> Trending
					</a>
				</div>
				<div class="col bg-white rounded-circle mt-n4 px-3 py-2">
					<div class="bg-danger rounded-circle mt-n0 shadow">
						<a href="checkout.jsp"
							class="text-white small font-weight-bold text-decoration-none">
							<i class="feather-shopping-cart"></i>
						</a>
					</div>
				</div>
				<div class="col">
					<a href="favourites.jsp"
						class="text-dark small font-weight-bold text-decoration-none">
						<p class="h4 m-0">
							<i class="feather-heart"></i>
						</p> Favorites
					</a>
				</div>
				<div class="col">
					<a href="profile.jsp"
						class="text-dark small font-weight-bold text-decoration-none">
						<p class="h4 m-0">
							<i class="feather-user"></i>
						</p> Profile
					</a>
				</div>
			</div>
		</div>
	</div>

	<!-- footer start -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer end -->

	<div class="modal fade" id="filters" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Filters</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body p-0">
					<div class="osahan-filter">
						<div class="filter">
							<div class="p-3 bg-light border-bottom">
								<h6 class="m-0">SORT BY</h6>
							</div>
							<div class="custom-control border-bottom px-0  custom-radio">
								<input type="radio" id="customRadio1" name="location"
									class="custom-control-input" checked> <label
									class="custom-control-label py-3 w-100 px-3" for="customRadio1">Top
									Rated</label>
							</div>
							<div class="custom-control border-bottom px-0  custom-radio">
								<input type="radio" id="customRadio2" name="location"
									class="custom-control-input"> <label
									class="custom-control-label py-3 w-100 px-3" for="customRadio2">Nearest
									Me</label>
							</div>
							<div class="custom-control border-bottom px-0  custom-radio">
								<input type="radio" id="customRadio3" name="location"
									class="custom-control-input"> <label
									class="custom-control-label py-3 w-100 px-3" for="customRadio3">Cost
									High to Low</label>
							</div>
							<div class="custom-control border-bottom px-0  custom-radio">
								<input type="radio" id="customRadio4" name="location"
									class="custom-control-input"> <label
									class="custom-control-label py-3 w-100 px-3" for="customRadio4">Cost
									Low to High</label>
							</div>
							<div class="custom-control border-bottom px-0  custom-radio">
								<input type="radio" id="customRadio5" name="location"
									class="custom-control-input"> <label
									class="custom-control-label py-3 w-100 px-3" for="customRadio5">Most
									Popular</label>
							</div>
							<div class="p-3 bg-light border-bottom">
								<h6 class="m-0">FILTER</h6>
							</div>
							<div class="custom-control border-bottom px-0  custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="defaultCheck1" checked> <label
									class="custom-control-label py-3 w-100 px-3"
									for="defaultCheck1">Open Now</label>
							</div>
							<div class="custom-control border-bottom px-0  custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="defaultCheck2"> <label
									class="custom-control-label py-3 w-100 px-3"
									for="defaultCheck2">Credit Cards</label>
							</div>
							<div class="custom-control border-bottom px-0  custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="defaultCheck3"> <label
									class="custom-control-label py-3 w-100 px-3"
									for="defaultCheck3">Alcohol Served</label>
							</div>
							<div class="p-3 bg-light border-bottom">
								<h6 class="m-0">ADDITIONAL FILTERS</h6>
							</div>
							<div class="px-3 pt-3">
								<input type="range" class="custom-range" min="0" max="100"
									name="minmax">
								<div class="form-row">
									<div class="form-group col-6">
										<label>Min</label> <input class="form-control"
											placeholder="$0" type="number">
									</div>
									<div class="form-group text-right col-6">
										<label>Max</label> <input class="form-control"
											placeholder="$1,0000" type="number">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer p-0 border-0">
					<div class="col-6 m-0 p-0">
						<a href="#" class="btn border-top btn-lg btn-block"
							data-dismiss="modal">Close</a>
					</div>
					<div class="col-6 m-0 p-0">
						<a href="most-popular.jsp"
							class="btn btn-primary btn-lg btn-block">Apply</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="5d78d0ee77d8b82a75f67b54-text/javascript"
		src="userResources/js/jquery.min.js"></script>
	<script type="5d78d0ee77d8b82a75f67b54-text/javascript"
		src="userResources/js/bootstrap.bundle.min.js"></script>
	<script type="5d78d0ee77d8b82a75f67b54-text/javascript"
		src="userResources/js/slick.min.js"></script>
	<script type="5d78d0ee77d8b82a75f67b54-text/javascript"
		src="userResources/js/hc-offcanvas-nav.js"></script>
	<script type="5d78d0ee77d8b82a75f67b54-text/javascript"
		src="userResources/js/osahan.js"></script>
	<script
		src="https://ajax.cloudflare.com/cdn-cgi/scripts/7089c43e/cloudflare-static/rocket-loader.min.js"
		data-cf-settings="5d78d0ee77d8b82a75f67b54-|49" defer=""></script>
</body>
</html>