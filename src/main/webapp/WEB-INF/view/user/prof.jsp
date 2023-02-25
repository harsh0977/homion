
<div class="col-md-4 mb-3">
	<div class="bg-white rounded shadow-sm sticky_sidebar overflow-hidden">
	
		<a class="">
			<div class="d-flex align-items-center p-3">
				<div class="left mr-3">
					<img alt="#" src="userResources/image/profile.png"
						class="img-fluid rounded-circle header-user mr-2 header-user">
				</div>
				<div class="right">
					<h6 class="mb-1 font-weight-bold">
						${user.firstName} ${user.lastName} <i class="feather-check-circle text-success"></i>
					</h6>
					<p class="text-muted m-0 small">
						<span>${user.login.email}</span>
					</p>
				</div>
			</div>
		</a>

		<div class="bg-white profile-details">
			
			<a href="/user/address"
				class="d-flex w-100 align-items-center border-bottom p-3">
				<div class="left mr-3">
					<h6 class="font-weight-bold mb-1 text-dark">Address</h6>
					<p class="small text-muted m-0">Add or remove a delivery
						address</p>
				</div>
			</a>
			
			<!-- <a href="/user/faq"
				class="d-flex w-100 align-items-center border-bottom px-3 py-4">
				<div class="left mr-3">
					<h6 class="font-weight-bold m-0 text-dark">
						<i class="feather-truck bg-danger text-white p-2 rounded-circle mr-2"></i>
						Delivery Support
					</h6>
				</div>
			</a> -->
			
			<a href="/user/contact-us"
				class="d-flex w-100 align-items-center border-bottom px-3 py-4">
				<div class="left mr-3">
					<h6 class="font-weight-bold m-0 text-dark">
						<i class="feather-phone bg-primary text-white p-2 rounded-circle mr-2"></i>
						Contact
					</h6>
				</div>
			</a>
			
			<a href="/user/terms"
				class="d-flex w-100 align-items-center border-bottom px-3 py-4">
				<div class="left mr-3">
					<h6 class="font-weight-bold m-0 text-dark">
						<i class="feather-info bg-success text-white p-2 rounded-circle mr-2"></i>
						Term of use
					</h6>
				</div>
				
			</a>
			
			<a href="/user/privacy" class="d-flex w-100 align-items-center px-3 py-4">
				<div class="left mr-3">
					<h6 class="font-weight-bold m-0 text-dark">
						<i class="feather-lock bg-warning text-white p-2 rounded-circle mr-2"></i>
						Privacy policy
					</h6>
				</div>
			</a>
			
		</div>
	</div>
</div>