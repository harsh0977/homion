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

	<div class="osahan-profile">
		<div class="d-none">
			<div class="bg-primary border-bottom p-3 d-flex align-items-center">
				<a class="toggle togglew toggle-2" href="#"><span></span></a>
				<h4 class="font-weight-bold m-0 text-white">Profile</h4>
			</div>
		</div>
		<div class="container position-relative">
			<div class="py-5 osahan-profile row">
				
				<jsp:include page="prof.jsp"></jsp:include>
				
				<div class="col-md-8 mb-3">
					<div class="osahan-cart-item-profile">
						<div class="box bg-white mb-3 shadow-sm rounded">
							<div class="p-3 d-flex align-items-center">
								<i class="feather-message-circle display-4"></i>
								<div class="ml-3">
									<h6 class="text-dark mb-2 mt-0">Help Forum</h6>
									<p class="mb-0 text-muted">Find the answer to any question,
										from the basics ...</p>
								</div>
							</div>
							<div
								class="overflow-hidden border-top d-flex align-items-center p-3">
								<a class="font-weight-bold d-block" href="#"> Swiggiweb Help
									Forum. </a> <i
									class="feather-arrow-right-circle ml-auto text-primary"></i>
							</div>
						</div>
						<div class="box bg-white mb-3 shadow-sm rounded">
							<div class="p-3 d-flex align-items-center">
								<i class="feather-lock display-4"></i>
								<div class="ml-3">
									<h6 class="text-dark mb-2 mt-0">Safety Center</h6>
									<p class="mb-0 text-muted">Want to learn more about setting
										up and managing ...</p>
								</div>
							</div>
							<div
								class="overflow-hidden border-top d-flex align-items-center p-3">
								<a class="font-weight-bold d-block" href="#"> Swiggiweb
									Safety Center. </a> <i
									class="feather-arrow-right-circle ml-auto text-primary"></i>
							</div>
						</div>
						<div id="basics">
							<div class="mb-2 mt-3">
								<h5 class="font-weight-semi-bold mb-0">Basics</h5>
							</div>
							<div id="basicsAccordion">
								<div
									class="box border-bottom bg-white mb-2 rounded shadow-sm overflow-hidden">
									<div id="basicsHeadingOne">
										<h5 class="mb-0">
											<button
												class="shadow-none btn btn-block d-flex justify-content-between card-btn p-3 collapsed"
												data-toggle="collapse" data-target="#basicsCollapseOne"
												aria-expanded="false" aria-controls="basicsCollapseOne">
												Do you have any built-in caching? <span
													class="card-btn-arrow"> <span
													class="feather-chevron-down"></span>
												</span>
											</button>
										</h5>
									</div>
									<div id="basicsCollapseOne" class="collapse show"
										aria-labelledby="basicsHeadingOne"
										data-parent="#basicsAccordion" style="">
										<div class="card-body border-top p-3 text-muted">Anim
											pariatur cliche reprehenderit, enim eiusmod high life
											accusamus terry richardson ad squid ...</div>
									</div>
								</div>
								<div
									class="box border-bottom bg-white mb-2 rounded shadow-sm overflow-hidden">
									<div id="basicsHeadingTwo">
										<h5 class="mb-0">
											<button
												class="shadow-none btn btn-block d-flex justify-content-between card-btn p-3 collapsed"
												data-toggle="collapse" data-target="#basicsCollapseTwo"
												aria-expanded="false" aria-controls="basicsCollapseTwo">
												Can I add/upgrade my plan at any time? <span
													class="card-btn-arrow"> <span
													class="feather-chevron-down"></span>
												</span>
											</button>
										</h5>
									</div>
									<div id="basicsCollapseTwo" class="collapse"
										aria-labelledby="basicsHeadingTwo"
										data-parent="#basicsAccordion" style="">
										<div class="card-body border-top p-3 text-muted">Anim
											pariatur cliche reprehenderit, enim eiusmod high life
											accusamus terry richardson ad squid ...</div>
									</div>
								</div>
								<div
									class="box border-bottom bg-white mb-2 rounded shadow-sm overflow-hidden">
									<div id="basicsHeadingThree">
										<h5 class="mb-0">
											<button
												class="shadow-none btn btn-block d-flex justify-content-between card-btn p-3 collapsed"
												data-toggle="collapse" data-target="#basicsCollapseThree"
												aria-expanded="false" aria-controls="basicsCollapseThree">
												What access comes with hosting plan? <span
													class="card-btn-arrow"> <span
													class="feather-chevron-down"></span>
												</span>
											</button>
										</h5>
									</div>
									<div id="basicsCollapseThree" class="collapse"
										aria-labelledby="basicsHeadingThree"
										data-parent="#basicsAccordion" style="">
										<div class="card-body border-top p-3 text-muted">Anim
											pariatur cliche reprehenderit, enim eiusmod high life
											accusamus terry richardson ad squid ...</div>
									</div>
								</div>
								<div
									class="box border-bottom bg-white mb-2 rounded shadow-sm overflow-hidden">
									<div id="basicsHeadingFour">
										<h5 class="mb-0">
											<button
												class="shadow-none btn btn-block d-flex justify-content-between card-btn collapsed p-3"
												data-toggle="collapse" data-target="#basicsCollapseFour"
												aria-expanded="false" aria-controls="basicsCollapseFour">
												How do I change my password? <span class="card-btn-arrow">
													<span class="feather-chevron-down"></span>
												</span>
											</button>
										</h5>
									</div>
									<div id="basicsCollapseFour" class="collapse"
										aria-labelledby="basicsHeadingFour"
										data-parent="#basicsAccordion">
										<div class="card-body border-top p-3 text-muted">Anim
											pariatur cliche reprehenderit, enim eiusmod high life
											accusamus terry richardson ad squid ...</div>
									</div>
								</div>
							</div>
						</div>
						<div id="account">
							<div class="mb-2 mt-3">
								<h5 class="font-weight-semi-bold mb-0">Account</h5>
							</div>
							<div id="accountAccordion">
								<div
									class="box border-bottom bg-white mb-2 rounded shadow-sm overflow-hidden">
									<div id="accountHeadingOne">
										<h5 class="mb-0">
											<button
												class="shadow-none btn btn-block d-flex justify-content-between card-btn p-3"
												data-toggle="collapse" data-target="#accountCollapseOne"
												aria-expanded="false" aria-controls="accountCollapseOne">
												How do I change my password? <span class="card-btn-arrow">
													<span class="feather-chevron-down"></span>
												</span>
											</button>
										</h5>
									</div>
									<div id="accountCollapseOne" class="collapse show"
										aria-labelledby="accountHeadingOne"
										data-parent="#accountAccordion">
										<div class="card-body border-top p-3 text-muted">Anim
											pariatur cliche reprehenderit, enim eiusmod high life
											accusamus terry richardson ad squid ...</div>
									</div>
								</div>
								<div
									class="box border-bottom bg-white mb-2 rounded shadow-sm overflow-hidden">
									<div id="accountHeadingTwo">
										<h5 class="mb-0">
											<button
												class="shadow-none btn btn-block d-flex justify-content-between card-btn collapsed p-3"
												data-toggle="collapse" data-target="#accountCollapseTwo"
												aria-expanded="false" aria-controls="accountCollapseTwo">
												How do I delete my account? <span class="card-btn-arrow">
													<span class="feather-chevron-down"></span>
												</span>
											</button>
										</h5>
									</div>
									<div id="accountCollapseTwo" class="collapse"
										aria-labelledby="accountHeadingTwo"
										data-parent="#accountAccordion">
										<div class="card-body border-top p-3 text-muted">Anim
											pariatur cliche reprehenderit, enim eiusmod high life
											accusamus terry richardson ad squid ...</div>
									</div>
								</div>
								<div
									class="box border-bottom bg-white mb-2 rounded shadow-sm overflow-hidden">
									<div id="accountHeadingThree">
										<h5 class="mb-0">
											<button
												class="shadow-none btn btn-block d-flex justify-content-between card-btn collapsed p-3"
												data-toggle="collapse" data-target="#accountCollapseThree"
												aria-expanded="false" aria-controls="accountCollapseThree">
												How do I change my account settings? <span
													class="card-btn-arrow"> <span
													class="feather-chevron-down"></span>
												</span>
											</button>
										</h5>
									</div>
									<div id="accountCollapseThree" class="collapse"
										aria-labelledby="accountHeadingThree"
										data-parent="#accountAccordion">
										<div class="card-body border-top p-3 text-muted">Anim
											pariatur cliche reprehenderit, enim eiusmod high life
											accusamus terry richardson ad squid ...</div>
									</div>
								</div>
								<div
									class="box border-bottom bg-white mb-2 rounded shadow-sm overflow-hidden">
									<div id="accountHeadingFour">
										<h5 class="mb-0">
											<button
												class="shadow-none btn btn-block d-flex justify-content-between card-btn collapsed p-3"
												data-toggle="collapse" data-target="#accountCollapseFour"
												aria-expanded="false" aria-controls="accountCollapseFour">
												I forgot my password. How do I reset it? <span
													class="card-btn-arrow"> <span
													class="feather-chevron-down"></span>
												</span>
											</button>
										</h5>
									</div>
									<div id="accountCollapseFour" class="collapse"
										aria-labelledby="accountHeadingFour"
										data-parent="#accountAccordion">
										<div class="card-body border-top p-3 text-muted">Anim
											pariatur cliche reprehenderit, enim eiusmod high life
											accusamus terry richardson ad squid ...</div>
									</div>
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
					<a href="home.html"
						class="text-dark small font-weight-bold text-decoration-none">
						<p class="h4 m-0">
							<i class="feather-home text-dark"></i>
						</p> Home
					</a>
				</div>
				<div class="col">
					<a href="most_popular.html"
						class="text-dark small font-weight-bold text-decoration-none">
						<p class="h4 m-0">
							<i class="feather-map-pin"></i>
						</p> Trending
					</a>
				</div>
				<div class="col bg-white rounded-circle mt-n4 px-3 py-2">
					<div class="bg-danger rounded-circle mt-n0 shadow">
						<a href="checkout.html"
							class="text-white small font-weight-bold text-decoration-none">
							<i class="feather-shopping-cart"></i>
						</a>
					</div>
				</div>
				<div class="col">
					<a href="favorites.html"
						class="text-dark small font-weight-bold text-decoration-none">
						<p class="h4 m-0">
							<i class="feather-heart"></i>
						</p> Favorites
					</a>
				</div>
				<div class="col selected">
					<a href="profile.html"
						class="text-danger small font-weight-bold text-decoration-none">
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

	<div class="modal fade" id="paycard" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Add Credit/Debit Card</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h6 class="m-0">Add new card</h6>
					<p class="small">
						WE ACCEPT <span class="osahan-card ml-2 font-weight-bold">(
							Master Card / Visa Card / Rupay )</span>
					</p>
					<form>
						<div class="form-row">
							<div class="col-md-12 form-group">
								<label class="form-label font-weight-bold small">Card
									number</label>
								<div class="input-group">
									<input placeholder="Card number" type="number"
										class="form-control">
									<div class="input-group-append">
										<button type="button" class="btn btn-outline-secondary">
											<i class="feather-credit-card"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-md-8 form-group">
								<label class="form-label font-weight-bold small">Valid
									through(MM/YY)</label><input placeholder="Enter Valid through(MM/YY)"
									type="number" class="form-control">
							</div>
							<div class="col-md-4 form-group">
								<label class="form-label font-weight-bold small">CVV</label><input
									placeholder="Enter CVV Number" type="number"
									class="form-control">
							</div>
							<div class="col-md-12 form-group">
								<label class="form-label font-weight-bold small">Name on
									card</label><input placeholder="Enter Card number" type="text"
									class="form-control">
							</div>
							<div class="col-md-12 form-group mb-0">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" id="custom-checkbox1"
										class="custom-control-input"><label title=""
										type="checkbox" for="custom-checkbox1"
										class="custom-control-label small pt-1">Securely save
										this card for a faster checkout next time.</label>
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
						<button type="button" class="btn btn-primary btn-lg btn-block">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Add Delivery Address</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="">
						<div class="form-row">
							<div class="col-md-12 form-group">
								<label class="form-label">Delivery Area</label>
								<div class="input-group">
									<input placeholder="Delivery Area" type="text"
										class="form-control">
									<div class="input-group-append">
										<button type="button" class="btn btn-outline-secondary">
											<i class="feather-map-pin"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-md-12 form-group">
								<label class="form-label">Complete Address</label><input
									placeholder="Complete Address e.g. house number, street name, landmark"
									type="text" class="form-control">
							</div>
							<div class="col-md-12 form-group">
								<label class="form-label">Delivery Instructions</label><input
									placeholder="Delivery Instructions e.g. Opposite Gold Souk Mall"
									type="text" class="form-control">
							</div>
							<div class="mb-0 col-md-12 form-group">
								<label class="form-label">Nickname</label>
								<div class="btn-group btn-group-toggle w-100"
									data-toggle="buttons">
									<label class="btn btn-outline-secondary active"> <input
										type="radio" name="options" id="option1" checked> Home
									</label> <label class="btn btn-outline-secondary"> <input
										type="radio" name="options" id="option2"> Work
									</label> <label class="btn btn-outline-secondary"> <input
										type="radio" name="options" id="option3"> Other
									</label>
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
						<button type="button" class="btn btn-primary btn-lg btn-block">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="inviteModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header border-0">
					<h5 class="modal-title font-weight-bold text-dark">Invite</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body py-0">
					<button class="btn btn-light text-primary btn-sm">
						<i class="feather-plus"></i>
					</button>
					<span class="ml-2 smal text-primary">Send an invite to a
						friend</span>
					<p class="mt-3 small">Invited friends (2)</p>
					<div class="d-flex align-items-center mb-3">
						<div class="mr-3">
							<img alt="#" src="userResources/image/user1.jpg"
								class="img-fluid rounded-circle">
						</div>
						<div>
							<p class="small font-weight-bold text-dark mb-0">Kate Simpson</p>
							<P class="mb-0 small">
								<a href="/cdn-cgi/l/email-protection" class="__cf_email__"
									data-cfemail="83e8e2f7e6f0eaeef3f0ecedc3ecf6f7e1ecece8ade0ecee">[email&#160;protected]</a>
							</P>
						</div>
					</div>
					<div class="d-flex align-items-center mb-3">
						<div class="mr-3">
							<img alt="#" src="userResources/image/user2.png"
								class="img-fluid rounded-circle">
						</div>
						<div>
							<p class="small font-weight-bold text-dark mb-0">Andrew Smith</p>
							<P class="mb-0 small">
								<a href="/cdn-cgi/l/email-protection" class="__cf_email__"
									data-cfemail="42232c26302735312f2b362a02372b7a6c212d2f">[email&#160;protected]</a>
							</P>
						</div>
					</div>
				</div>
				<div class="modal-footer border-0"></div>
			</div>
		</div>
	</div>
	<script data-cfasync="false"
		src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
	<script type="1baae0d75b0d647b0b51fc52-text/javascript"
		src="userResources/js/jquery.min.js"></script>
	<script type="1baae0d75b0d647b0b51fc52-text/javascript"
		src="userResources/js/bootstrap.bundle.min.js"></script>
	<script type="1baae0d75b0d647b0b51fc52-text/javascript"
		src="userResources/js/slick.min.js"></script>
	<script type="1baae0d75b0d647b0b51fc52-text/javascript"
		src="userResources/js/hc-offcanvas-nav.js"></script>
	<script type="1baae0d75b0d647b0b51fc52-text/javascript"
		src="userResources/js/osahan.js"></script>
	<script
		src="https://ajax.cloudflare.com/cdn-cgi/scripts/7089c43e/cloudflare-static/rocket-loader.min.js"
		data-cf-settings="1baae0d75b0d647b0b51fc52-|49" defer=""></script>
</body>
</html>


<!-- 		<div class="box bg-white mb-3 shadow-sm rounded">
			<div class="p-3 d-flex align-items-center">
				<i class="feather-message-circle display-4"></i>
				<div class="ml-3">
					<h6 class="text-dark mb-2 mt-0">Help Forum</h6>
					<p class="mb-0 text-muted">Find the answer to any question,
						from the basics ...</p>
				</div>
			</div>
			<div class="overflow-hidden border-top d-flex align-items-center p-3">
				<a class="font-weight-bold d-block" href="#"> Swiggiweb Help
					Forum. </a> <i class="feather-arrow-right-circle ml-auto text-primary"></i>
			</div>
		</div>
		<div class="box bg-white mb-3 shadow-sm rounded">
			<div class="p-3 d-flex align-items-center">
				<i class="feather-lock display-4"></i>
				<div class="ml-3">
					<h6 class="text-dark mb-2 mt-0">Safety Center</h6>
					<p class="mb-0 text-muted">Want to learn more about setting up
						and managing ...</p>
				</div>
			</div>
			<div class="overflow-hidden border-top d-flex align-items-center p-3">
				<a class="font-weight-bold d-block" href="#"> Swiggiweb Safety
					Center. </a> <i class="feather-arrow-right-circle ml-auto text-primary"></i>
			</div>
		</div>
		<div id="basics">
			<div class="mb-2 mt-3">
				<h5 class="font-weight-semi-bold mb-0">Basics</h5>
			</div>
			<div id="basicsAccordion">
				<div
					class="box border-bottom bg-white mb-2 rounded shadow-sm overflow-hidden">
					<div id="basicsHeadingOne">
						<h5 class="mb-0">
							<button
								class="shadow-none btn btn-block d-flex justify-content-between card-btn p-3 collapsed"
								data-toggle="collapse" data-target="#basicsCollapseOne"
								aria-expanded="false" aria-controls="basicsCollapseOne">
								Do you have any built-in caching? <span class="card-btn-arrow">
									<span class="feather-chevron-down"></span>
								</span>
							</button>
						</h5>
					</div>
					<div id="basicsCollapseOne" class="collapse show"
						aria-labelledby="basicsHeadingOne" data-parent="#basicsAccordion"
						style="">
						<div class="card-body border-top p-3 text-muted">Anim
							pariatur cliche reprehenderit, enim eiusmod high life accusamus
							terry richardson ad squid ...</div>
					</div>
				</div>
				<div
					class="box border-bottom bg-white mb-2 rounded shadow-sm overflow-hidden">
					<div id="basicsHeadingTwo">
						<h5 class="mb-0">
							<button
								class="shadow-none btn btn-block d-flex justify-content-between card-btn p-3 collapsed"
								data-toggle="collapse" data-target="#basicsCollapseTwo"
								aria-expanded="false" aria-controls="basicsCollapseTwo">
								Can I add/upgrade my plan at any time? <span
									class="card-btn-arrow"> <span
									class="feather-chevron-down"></span>
								</span>
							</button>
						</h5>
					</div>
					<div id="basicsCollapseTwo" class="collapse"
						aria-labelledby="basicsHeadingTwo" data-parent="#basicsAccordion"
						style="">
						<div class="card-body border-top p-3 text-muted">Anim
							pariatur cliche reprehenderit, enim eiusmod high life accusamus
							terry richardson ad squid ...</div>
					</div>
				</div>
				<div
					class="box border-bottom bg-white mb-2 rounded shadow-sm overflow-hidden">
					<div id="basicsHeadingThree">
						<h5 class="mb-0">
							<button
								class="shadow-none btn btn-block d-flex justify-content-between card-btn p-3 collapsed"
								data-toggle="collapse" data-target="#basicsCollapseThree"
								aria-expanded="false" aria-controls="basicsCollapseThree">
								What access comes with hosting plan? <span
									class="card-btn-arrow"> <span
									class="feather-chevron-down"></span>
								</span>
							</button>
						</h5>
					</div>
					<div id="basicsCollapseThree" class="collapse"
						aria-labelledby="basicsHeadingThree"
						data-parent="#basicsAccordion" style="">
						<div class="card-body border-top p-3 text-muted">Anim
							pariatur cliche reprehenderit, enim eiusmod high life accusamus
							terry richardson ad squid ...</div>
					</div>
				</div>
				<div
					class="box border-bottom bg-white mb-2 rounded shadow-sm overflow-hidden">
					<div id="basicsHeadingFour">
						<h5 class="mb-0">
							<button
								class="shadow-none btn btn-block d-flex justify-content-between card-btn collapsed p-3"
								data-toggle="collapse" data-target="#basicsCollapseFour"
								aria-expanded="false" aria-controls="basicsCollapseFour">
								How do I change my password? <span class="card-btn-arrow">
									<span class="feather-chevron-down"></span>
								</span>
							</button>
						</h5>
					</div>
					<div id="basicsCollapseFour" class="collapse"
						aria-labelledby="basicsHeadingFour" data-parent="#basicsAccordion">
						<div class="card-body border-top p-3 text-muted">Anim
							pariatur cliche reprehenderit, enim eiusmod high life accusamus
							terry richardson ad squid ...</div>
					</div>
				</div>
			</div>
		</div>
		<div id="account">
			<div class="mb-2 mt-3">
				<h5 class="font-weight-semi-bold mb-0">Account</h5>
			</div>
			<div id="accountAccordion">
				<div
					class="box border-bottom bg-white mb-2 rounded shadow-sm overflow-hidden">
					<div id="accountHeadingOne">
						<h5 class="mb-0">
							<button
								class="shadow-none btn btn-block d-flex justify-content-between card-btn p-3"
								data-toggle="collapse" data-target="#accountCollapseOne"
								aria-expanded="false" aria-controls="accountCollapseOne">
								How do I change my password? <span class="card-btn-arrow">
									<span class="feather-chevron-down"></span>
								</span>
							</button>
						</h5>
					</div>
					<div id="accountCollapseOne" class="collapse show"
						aria-labelledby="accountHeadingOne"
						data-parent="#accountAccordion">
						<div class="card-body border-top p-3 text-muted">Anim
							pariatur cliche reprehenderit, enim eiusmod high life accusamus
							terry richardson ad squid ...</div>
					</div>
				</div>
				<div
					class="box border-bottom bg-white mb-2 rounded shadow-sm overflow-hidden">
					<div id="accountHeadingTwo">
						<h5 class="mb-0">
							<button
								class="shadow-none btn btn-block d-flex justify-content-between card-btn collapsed p-3"
								data-toggle="collapse" data-target="#accountCollapseTwo"
								aria-expanded="false" aria-controls="accountCollapseTwo">
								How do I delete my account? <span class="card-btn-arrow">
									<span class="feather-chevron-down"></span>
								</span>
							</button>
						</h5>
					</div>
					<div id="accountCollapseTwo" class="collapse"
						aria-labelledby="accountHeadingTwo"
						data-parent="#accountAccordion">
						<div class="card-body border-top p-3 text-muted">Anim
							pariatur cliche reprehenderit, enim eiusmod high life accusamus
							terry richardson ad squid ...</div>
					</div>
				</div>
				<div
					class="box border-bottom bg-white mb-2 rounded shadow-sm overflow-hidden">
					<div id="accountHeadingThree">
						<h5 class="mb-0">
							<button
								class="shadow-none btn btn-block d-flex justify-content-between card-btn collapsed p-3"
								data-toggle="collapse" data-target="#accountCollapseThree"
								aria-expanded="false" aria-controls="accountCollapseThree">
								How do I change my account settings? <span
									class="card-btn-arrow"> <span
									class="feather-chevron-down"></span>
								</span>
							</button>
						</h5>
					</div>
					<div id="accountCollapseThree" class="collapse"
						aria-labelledby="accountHeadingThree"
						data-parent="#accountAccordion">
						<div class="card-body border-top p-3 text-muted">Anim
							pariatur cliche reprehenderit, enim eiusmod high life accusamus
							terry richardson ad squid ...</div>
					</div>
				</div>
				<div
					class="box border-bottom bg-white mb-2 rounded shadow-sm overflow-hidden">
					<div id="accountHeadingFour">
						<h5 class="mb-0">
							<button
								class="shadow-none btn btn-block d-flex justify-content-between card-btn collapsed p-3"
								data-toggle="collapse" data-target="#accountCollapseFour"
								aria-expanded="false" aria-controls="accountCollapseFour">
								I forgot my password. How do I reset it? <span
									class="card-btn-arrow"> <span
									class="feather-chevron-down"></span>
								</span>
							</button>
						</h5>
					</div>
					<div id="accountCollapseFour" class="collapse"
						aria-labelledby="accountHeadingFour"
						data-parent="#accountAccordion">
						<div class="card-body border-top p-3 text-muted">Anim
							pariatur cliche reprehenderit, enim eiusmod high life accusamus
							terry richardson ad squid ...</div>
					</div>
				</div>
			</div>
		</div>
 -->