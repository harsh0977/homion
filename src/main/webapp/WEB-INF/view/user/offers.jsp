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
<link rel="icon" type="image/png" href="userResources/image/fav.png">
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
			<h4 class="font-weight-bold m-0 text-white">Offer</h4>
		</div>
	</div>
	<div class="offer-section">
		<div class="container">
			<div class="py-5 d-flex align-items-center">
				<div>
					<h2 class="text-white">Offers for you</h2>
					<p class="h6 text-white">Explore top deals and offers
						exclusively for you!</p>
				</div>
				<div class="ml-auto">
					<img alt="#" src="userResources/image/offers.png"
						class="img-fluid offers_img">
				</div>
			</div>
		</div>
	</div>
	<div class="bg-white shadow-sm">
		<div class="container">
			<div class="bg-white">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation"><a
						class="px-0 py-3 nav-link text-dark h6 border-0 mb-0 active"
						id="profile-tab" data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false">Payment
							offers/Coupons</a></li>
					<li class="nav-item bottom-tab" role="presentation"><a
						class="px-0 py-3 nav-link text-dark h6 border-0 mb-0 ml-3"
						id="home-tab" data-toggle="tab" href="#home" role="tab"
						aria-controls="home" aria-selected="true">Restaurant offers</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade py-4" id="home" role="tabpanel"
				aria-labelledby="home-tab">
				<h5 class="mb-1">All offers (163)</h5>
				<p>All offers and deals, from restaurants near you</p>
				<div class="row">
					<div class="col-md-3 pb-3">
						<div
							class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
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
									src="userResources/image/popular1.png"
									class="img-fluid item-img w-100">
								</a>
							</div>
							<div class="p-3 position-relative">
								<div class="list-card-body">
									<h6 class="mb-1">
										<a href="restaurant.jsp" class="text-black">The osahan
											Restaurant </a>
									</h6>
									<p class="text-gray mb-1 small">• North • Hamburgers</p>
									<p class="text-gray mb-1 rating">
									<ul class="rating-stars list-unstyled">
										<li><i class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i class="feather-star"></i>
										</li>
									</ul>
									</p>
								</div>
								<div class="list-card-badge">
									<span class="badge badge-danger">OFFER</span> <small>65%
										OSAHAN50</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3 pb-3">
						<div
							class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
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
									src="userResources/image/popular2.png"
									class="img-fluid item-img w-100">
								</a>
							</div>
							<div class="p-3 position-relative">
								<div class="list-card-body">
									<h6 class="mb-1">
										<a href="restaurant.jsp" class="text-black">Thai Famous
											Indian Cuisine</a>
									</h6>
									<p class="text-gray mb-1 small">• Indian • Pure veg</p>
									<p class="text-gray mb-1 rating">
									<ul class="rating-stars list-unstyled">
										<li><i class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i class="feather-star"></i>
										</li>
									</ul>
									</p>
								</div>
								<div class="list-card-badge">
									<span class="badge badge-success">OFFER</span> <small>65%
										off</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3 pb-3">
						<div
							class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
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
									src="userResources/image/popular3.png"
									class="img-fluid item-img w-100">
								</a>
							</div>
							<div class="p-3 position-relative">
								<div class="list-card-body">
									<h6 class="mb-1">
										<a href="restaurant.jsp" class="text-black">The osahan
											Restaurant </a>
									</h6>
									<p class="text-gray mb-1 small">• Hamburgers • Pure veg</p>
									<p class="text-gray mb-1 rating">
									<ul class="rating-stars list-unstyled">
										<li><i class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i class="feather-star"></i>
										</li>
									</ul>
									</p>
								</div>
								<div class="list-card-badge">
									<span class="badge badge-danger">OFFER</span> <small>65%
										OSAHAN50</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3 pb-3">
						<div
							class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
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
									src="userResources/image/popular4.png"
									class="img-fluid item-img w-100">
								</a>
							</div>
							<div class="p-3 position-relative">
								<div class="list-card-body">
									<h6 class="mb-1">
										<a href="restaurant.jsp" class="text-black">Bite Me Now
											Sandwiches</a>
									</h6>
									<p class="text-gray mb-1 small">American • Pure veg</p>
									<p class="text-gray mb-1 rating">
									<ul class="rating-stars list-unstyled">
										<li><i class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i class="feather-star"></i>
										</li>
									</ul>
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
					<div class="col-md-3 pb-3">
						<div
							class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
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
									src="userResources/image/popular5.png"
									class="img-fluid item-img w-100">
								</a>
							</div>
							<div class="p-3 position-relative">
								<div class="list-card-body">
									<h6 class="mb-1">
										<a href="restaurant.jsp" class="text-black">The osahan
											Restaurant </a>
									</h6>
									<p class="text-gray mb-1 small">• North • Hamburgers</p>
									<p class="text-gray mb-1 rating">
									<ul class="rating-stars list-unstyled">
										<li><i class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i class="feather-star"></i>
										</li>
									</ul>
									</p>
								</div>
								<div class="list-card-badge">
									<span class="badge badge-danger">OFFER</span> <small>65%
										OSAHAN50</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3 pb-3">
						<div
							class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
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
									src="userResources/image/popular6.png"
									class="img-fluid item-img w-100">
								</a>
							</div>
							<div class="p-3 position-relative">
								<div class="list-card-body">
									<h6 class="mb-1">
										<a href="restaurant.jsp" class="text-black">Thai Famous
											Indian Cuisine</a>
									</h6>
									<p class="text-gray mb-1 small">• Indian • Pure veg</p>
									<p class="text-gray mb-1 rating">
									<ul class="rating-stars list-unstyled">
										<li><i class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i class="feather-star"></i>
										</li>
									</ul>
									</p>
								</div>
								<div class="list-card-badge">
									<span class="badge badge-success">OFFER</span> <small>65%
										off</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3 pb-3">
						<div
							class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
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
									src="userResources/image/popular7.png"
									class="img-fluid item-img w-100">
								</a>
							</div>
							<div class="p-3 position-relative">
								<div class="list-card-body">
									<h6 class="mb-1">
										<a href="restaurant.jsp" class="text-black">The osahan
											Restaurant </a>
									</h6>
									<p class="text-gray mb-1 small">• Hamburgers • Pure veg</p>
									<p class="text-gray mb-1 rating">
									<ul class="rating-stars list-unstyled">
										<li><i class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i class="feather-star"></i>
										</li>
									</ul>
									</p>
								</div>
								<div class="list-card-badge">
									<span class="badge badge-danger">OFFER</span> <small>65%
										OSAHAN50</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3 pb-3">
						<div
							class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
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
									src="userResources/image/popular8.png"
									class="img-fluid item-img w-100">
								</a>
							</div>
							<div class="p-3 position-relative">
								<div class="list-card-body">
									<h6 class="mb-1">
										<a href="restaurant.jsp" class="text-black">Bite Me Now
											Sandwiches</a>
									</h6>
									<p class="text-gray mb-1 small">American • Pure veg</p>
									<p class="text-gray mb-1 rating">
									<ul class="rating-stars list-unstyled">
										<li><i class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i class="feather-star"></i>
										</li>
									</ul>
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
					<div class="col-md-3 pb-3">
						<div
							class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
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
									src="imuserResources/image/popular5.png"
									class="img-fluid item-img w-100">
								</a>
							</div>
							<div class="p-3 position-relative">
								<div class="list-card-body">
									<h6 class="mb-1">
										<a href="restaurant.jsp" class="text-black">The osahan
											Restaurant </a>
									</h6>
									<p class="text-gray mb-1 small">• North • Hamburgers</p>
									<p class="text-gray mb-1 rating">
									<ul class="rating-stars list-unstyled">
										<li><i class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i class="feather-star"></i>
										</li>
									</ul>
									</p>
								</div>
								<div class="list-card-badge">
									<span class="badge badge-danger">OFFER</span> <small>65%
										OSAHAN50</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3 pb-3">
						<div
							class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
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
									src="userResources/image/popular2.png"
									class="img-fluid item-img w-100">
								</a>
							</div>
							<div class="p-3 position-relative">
								<div class="list-card-body">
									<h6 class="mb-1">
										<a href="restaurant.jsp" class="text-black">Thai Famous
											Indian Cuisine</a>
									</h6>
									<p class="text-gray mb-1 small">• Indian • Pure veg</p>
									<p class="text-gray mb-1 rating">
									<ul class="rating-stars list-unstyled">
										<li><i class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i
											class="feather-star star_active"></i> <i class="feather-star"></i>
										</li>
									</ul>
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
			<div class="tab-pane fade show active py-4" id="profile"
				role="tabpanel" aria-labelledby="profile-tab">
				<h5 class="mb-3 mt-0">Available Coupons</h5>
				<div class="row">
					<div class="col-md-4 mb-3">
						<div class="bg-white shadow-sm rounded p-4">
							<p class="h6 mb-3">
								<span class="feather-home text-primary"></span><span
									class="ml-3">SBI75</span>
							</p>
							<p class="font-weight-bold mb-2">Get 15% discount using SBI
								Credit Cards</p>
							<p class="mb-4">Use code SBI75 and get 15% discount up to
								Rs.75 on orders above Rs.400</p>
							<p>
								<a href="#" class="text-primary">+ MORE</a>
							</p>
							<a href="#" class="btn btn-outline-primary">COPY CODE</a>
						</div>
					</div>
					<div class="col-md-4 mb-3">
						<div class="bg-white shadow-sm rounded p-4">
							<p class="h6 mb-3">
								<span class="feather-home text-primary"></span><span
									class="ml-3">PAYZAPP100</span>
							</p>
							<p class="font-weight-bold mb-2">Get 15% discount using HDFC
								PayZapp Card</p>
							<p class="mb-4">Use code PAYZAPP100 & get 15% discount up to
								Rs.100 on orders above Rs.250</p>
							<p>
								<a href="#" class="text-primary">+ MORE</a>
							</p>
							<a href="#" class="btn btn-outline-primary">COPY CODE</a>
						</div>
					</div>
					<div class="col-md-4 mb-3">
						<div class="bg-white shadow-sm rounded p-4">
							<p class="h6 mb-3">
								<span class="feather-home text-primary"></span><span
									class="ml-3">LP75</span>
							</p>
							<p class="font-weight-bold mb-2">Get flat cashback of Rs.75
								using LazyPay</p>
							<p class="mb-4">Use code LP75 & get flat cashback of Rs.75 on
								orders above Rs.250 on first LazyPay</p>
							<p>
								<a href="#" class="text-primary">+ MORE</a>
							</p>
							<a href="#" class="btn btn-outline-primary">COPY CODE</a>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 mb-3">
						<div class="bg-white shadow-sm rounded p-4">
							<p class="h6 mb-3">
								<span class="feather-home text-primary"></span><span
									class="ml-3">RUPAYFEST</span>
							</p>
							<p class="font-weight-bold mb-2">Get 30% discount using RuPay
								Cards</p>
							<p class="mb-4">Use code RUPAYFEST and get 30% discount up to
								Rs.100 on orders above Rs.199</p>
							<p>
								<a href="#" class="text-primary">+ MORE</a>
							</p>
							<a href="#" class="btn btn-outline-primary">COPY CODE</a>
						</div>
					</div>
					<div class="col-md-4 mb-3">
						<div class="bg-white shadow-sm rounded p-4">
							<p class="h6 mb-3">
								<span class="feather-home text-primary"></span><span
									class="ml-3">FCH50</span>
							</p>
							<p class="font-weight-bold mb-2">Get 20% cashback using
								Freecharge</p>
							<p class="mb-4">Use code FCH50 and get 20% cashback up to
								Rs.50 on transaction using Freecharge.</p>
							<p>
								<a href="#" class="text-primary">+ MORE</a>
							</p>
							<a href="#" class="btn btn-outline-primary">COPY CODE</a>
						</div>
					</div>
				</div>
				<h5 class="mb-3 mt-2">Bank Offers</h5>
				<div class="row">
					<div class="col-md-4 mb-3">
						<div class="bg-white shadow-sm rounded p-4 d-flex">
							<div>
								<img alt="#" src="userResources/image/axis.png"
									class="img-fluid">
							</div>
							<div class="ml-4">
								<p class="mb-1 font-weight-bold">Get 4% cashback with
									Flipkart Axis Bank Credit Card</p>
								<p class="text-muted">Get 4% cashback on orders using
									Flipkart Axis Bank Credit Cards</p>
								<p class="mb-0">
									<a href="#" class="text-primary">+ MORE</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 mb-3">
						<div class="bg-white shadow-sm rounded p-4 d-flex">
							<div>
								<img alt="#" src="userResources/image/axis.png"
									class="img-fluid">
							</div>
							<div class="ml-4">
								<p class="mb-1 font-weight-bold">Get 4% cashback using Axis
									Bank Ace Credit Cards</p>
								<p class="text-muted">Get 4% cashback on orders using Axis
									Bank Ace Credit Cards</p>
								<p class="mb-0">
									<a href="#" class="text-primary">+ MORE</a>
								</p>
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
						<i class="feather-home text-dark"></i>
					</p> Home
				</a>
			</div>
			<div class="col selected">
				<a href="trending.jsp"
					class="text-danger small font-weight-bold text-decoration-none">
					<p class="h4 m-0">
						<i class="feather-map-pin"></i>
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

	<div class="modal fade" id="extras" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Extras</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="recepie-body">
							<div class="custom-control custom-radio border-bottom py-2">
								<input type="radio" id="customRadio1f" name="location"
									class="custom-control-input" checked> <label
									class="custom-control-label" for="customRadio1f">Tuna <span
									class="text-muted">+$35.00</span></label>
							</div>
							<div class="custom-control custom-radio border-bottom py-2">
								<input type="radio" id="customRadio2f" name="location"
									class="custom-control-input"> <label
									class="custom-control-label" for="customRadio2f">Salmon
									<span class="text-muted">+$20.00</span>
								</label>
							</div>
							<div class="custom-control custom-radio border-bottom py-2">
								<input type="radio" id="customRadio3f" name="location"
									class="custom-control-input"> <label
									class="custom-control-label" for="customRadio3f">Wasabi
									<span class="text-muted">+$25.00</span>
								</label>
							</div>
							<div class="custom-control custom-radio border-bottom py-2">
								<input type="radio" id="customRadio4f" name="location"
									class="custom-control-input"> <label
									class="custom-control-label" for="customRadio4f">Unagi
									<span class="text-muted">+$10.00</span>
								</label>
							</div>
							<div class="custom-control custom-radio border-bottom py-2">
								<input type="radio" id="customRadio5f" name="location"
									class="custom-control-input"> <label
									class="custom-control-label" for="customRadio5f">Vegetables
									<span class="text-muted">+$5.00</span>
								</label>
							</div>
							<div class="custom-control custom-radio border-bottom py-2">
								<input type="radio" id="customRadio6f" name="location"
									class="custom-control-input"> <label
									class="custom-control-label" for="customRadio6f">Noodles
									<span class="text-muted">+$30.00</span>
								</label>
							</div>
							<h6 class="font-weight-bold mt-4">QUANTITY</h6>
							<div class="d-flex align-items-center">
								<p class="m-0">1 Item</p>
								<div class="ml-auto">
									<span class="count-number"><button type="button"
											class="btn-sm left dec btn btn-outline-secondary">
											<i class="feather-minus"></i>
										</button>
										<input class="count-number-input" type="text" readonly=""
										value="1">
									<button type="button"
											class="btn-sm right inc btn btn-outline-secondary">
											<i class="feather-plus"></i>
										</button></span>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer p-0 border-0">
					<div class="col-6 m-0 p-0">
						<button type="button" class="btn border-top btn-lg btn-block"
							data-dismiss="modal">Close</button>
					</div>
					<div class="col-6 m-0 p-0">
						<button type="button" class="btn btn-primary btn-lg btn-block">Apply</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="4e43def5a3a50859f7969efd-text/javascript"
		src="userResources/js/jquery.min.js"></script>
	<script type="4e43def5a3a50859f7969efd-text/javascript"
		src="userResources/js/bootstrap.bundle.min.js"></script>
	<script type="4e43def5a3a50859f7969efd-text/javascript"
		src="userResources/js/slick.min.js"></script>
	<script type="4e43def5a3a50859f7969efd-text/javascript"
		src="userResources/js/hc-offcanvas-nav.js"></script>
	<script type="4e43def5a3a50859f7969efd-text/javascript"
		src="userResources/js/osahan.js"></script>
	<script
		src="https://ajax.cloudflare.com/cdn-cgi/scripts/7089c43e/cloudflare-static/rocket-loader.min.js"
		data-cf-settings="4e43def5a3a50859f7969efd-|49" defer=""></script>
</body>
</html>