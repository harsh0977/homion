<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>

<header class="section-header">
	<section class="header-main shadow-sm bg-white">
		<div class="container">
			<div class="row align-items-center">
				<!-- <div class="col-1">
					<a href="/user/home" class="brand-wrap mb-0"> <img alt="#"
						class="img-fluid" src="../chef/chefResources/image/homion-mini.svg">
					</a>
				</div> -->
				
				<div class="col-2 d-flex align-items-center m-none">
					<a href="/user/home"><img src="../admin/adminResources/image/homion-logo.svg" alt="logo" style="height: 30px;"/></a>
				</div>
				
				<div class="col-2 d-flex align-items-center m-none">
		          <%-- <div class="dropdown mr-3">
		            <a
		              class="text-dark dropdown-toggle d-flex align-items-center py-3"
		              href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
		              aria-haspopup="true" aria-expanded="false">
		              <div>
		                <i
		                  class="feather-map-pin mr-2 bg-light rounded-pill p-2 icofont-size"></i>
		              </div>
		              <div>
		                <p class="text-muted mb-0 small">Select Address</p>
		                Home
		              </div>
		            </a>
		            <div class="dropdown-menu p-0 drop-loc" aria-labelledby="navbarDropdown">
		              <div class="osahan-country">
		                <div class="filter">
		                  <h6 class="px-3 py-3 bg-primary text-light pb-1 m-0 border-bottom">Choose your address</h6>
		                  <jstl:forEach items="${addresses}" var="address">
			                  <div class="custom-control  border-bottom px-0 custom-radio">
			                    <input type="radio" id="${address.pincode}" name="address" class="custom-control-input" value="${address.pincode}">
			                    <label class="custom-control-label py-3 w-100 px-3" for="${address.pincode}">${address.type}</label>
			                  </div>
			              </jstl:forEach>
		                </div>
		               </div>
		             </div>
		           </div> --%>
		        </div>
				
				
				<div class="col-8">
					<div class="d-flex align-items-center justify-content-end pr-5">
						<a href="/user/search" class="widget-header mr-4 text-dark">
							<div class="icon d-flex align-items-center">
								<i class="feather-search h6 mr-2 mb-0"></i> <span>Search</span>
							</div>
						</a>
						<!-- <a href="/user/offers"
							class="widget-header mr-4 text-white btn bg-primary m-none">
							<div class="icon d-flex align-items-center">
								<i class="feather-disc h6 mr-2 mb-0"></i> <span>Offers</span>
							</div>
						</a> -->
						<!-- <a href="/user/login" class="widget-header mr-4 text-dark m-none">
							<div class="icon d-flex align-items-center">
								<i class="feather-user h6 mr-2 mb-0"></i> <span>Sign in</span>
							</div>
						</a> -->
						<div class="dropdown mr-4 m-none">
							<a href="#" class="dropdown-toggle text-dark py-3 d-block"
								id="dropdownMenuButton" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <img alt="#"
								src="userResources/image/profile.png"
								class="img-fluid rounded-circle header-user mr-2 header-user">
								Hi ${sessionScope.user.firstName} ${sessionScope.user.lastName}
							</a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" href="/user/profile">My account</a>
								<!-- <aclass="dropdown-item" href="/user/faq">Delivery support</a> -->
								<a
									class="dropdown-item" href="/user/contact-us">Contant us</a> <a
									class="dropdown-item" href="/user/terms">Term of use</a> <a
									class="dropdown-item" href="/user/privacy">Privacy policy</a> <a
									class="dropdown-item" href="/user/logout">Logout</a>
							</div>
						</div>
						<a href="/user/checkout" class="widget-header mr-4 text-dark">
							<div class="icon d-flex align-items-center">
								<i class="feather-shopping-cart h6 mr-2 mb-0"></i> <span>Cart</span>
							</div>
						</a> <a class="toggle" href="#"> <span></span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
</header>

<nav id="main-nav">
		<ul class="second-nav">
			<li><a href="/user/home"><i class="feather-home mr-2"></i>
					Homepage</a></li>
			<li><a href="/user/my-orders"><i class="feather-list mr-2"></i>
					My Orders</a></li>
			<!--<li><a href="#"><i class="feather-edit-2 mr-2"></i>
					Authentication</a>
				<ul>
					<li><a href="/user/login">Login</a></li>
					<li><a href="/user/signup">Register</a></li>
					<li><a href="/user/forgot-password">Forgot Password</a></li>
					<li><a href="/user/verification">Verification</a></li>
					<li><a href="/user/location">Location</a></li>
				</ul></li> -->
			<li><a href="/user/favourites"><i class="feather-heart mr-2"></i>
					Favorites</a></li>
			<li><a href="/user/home#trending"><i
					class="feather-trending-up mr-2"></i> Trending</a></li>
			<li><a href="/user/home#mostpopular"><i
					class="feather-award mr-2"></i> Most Popular</a></li>
			<!-- <li><a href="/user/restaurant"><i
					class="feather-paperclip mr-2"></i> Restaurant Detail</a></li> -->
			<li><a href="/user/checkout"><i class="feather-list mr-2"></i>
					Checkout</a></li>
			<!-- <li><a href="/user/successful"><i
					class="feather-check-circle mr-2"></i> Successful</a></li> -->
			<!-- <li><a href="/user/map"><i class="feather-map-pin mr-2"></i>
					Live Map</a></li> -->
			<li><a href="/user/profile"><i class="feather-user mr-2"></i>
					Profile</a></li>
			<li><a href="/user/logout"><i class="feather-log-out mr-2"></i>
					Logout</a></li>
					
			<!-- <li><a href="#"><i class="feather-alert-triangle mr-2"></i>
					Error</a>
				<ul>
					<li><a href="/user/not-found">Not Found</a>
					<li><a href="/user/maintenance"> Maintenance</a>
					<li><a href="/user/coming-soon">Coming Soon</a>
				</ul></li>
			<li><a href="#"><i class="feather-link mr-2"></i> Navigation
					Link Example</a>
				<ul>
					<li><a href="#">Link Example 1</a>
						<ul>
							<li><a href="#">Link Example 1.1</a>
								<ul>
									<li><a href="#">Link</a></li>
									<li><a href="#">Link</a></li>
									<li><a href="#">Link</a></li>
									<li><a href="#">Link</a></li>
									<li><a href="#">Link</a></li>
								</ul></li>
							<li><a href="#">Link Example 1.2</a>
								<ul>
									<li><a href="#">Link</a></li>
									<li><a href="#">Link</a></li>
									<li><a href="#">Link</a></li>
									<li><a href="#">Link</a></li>
								</ul></li>
						</ul></li>
					<li><a href="#">Link Example 2</a></li>
					<li><a href="#">Link Example 3</a></li>
					<li><a href="#">Link Example 4</a></li>
					<li data-nav-custom-content>
						<div class="custom-message">You can add any custom content
							to your navigation items. This text is just an example.</div>
					</li>
				</ul></li> -->
		</ul>
		
		<ul class="bottom-nav">
			<li class="email"><a class="text-danger" href="/user/home">
					<p class="h5 m-0">
						<i class="feather-home text-danger"></i>
					</p> Home
			</a></li>
			<li class="github"><a href="/user/faq">
					<p class="h5 m-0">
						<i class="feather-message-circle"></i>
					</p> FAQ
			</a></li>
			<li class="ko-fi"><a href="/user/contact-us">
					<p class="h5 m-0">
						<i class="feather-phone"></i>
					</p> Help
			</a></li>
		</ul>
		
	</nav>