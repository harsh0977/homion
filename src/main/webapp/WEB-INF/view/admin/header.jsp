
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
	<div
		class="navbar-menu-wrapper d-flex align-items-stretch justify-content-between">
		<ul class="navbar-nav mr-lg-2 d-none d-lg-flex">
			<li class="nav-item nav-toggler-item">
				<button class="navbar-toggler align-self-center" type="button"
					data-toggle="minimize">
					<span class="mdi mdi-menu"></span>
				</button>
			</li>
			
			<!-- <li class="nav-item nav-search d-none d-lg-flex">        search bar
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text" id="search"> <i
							class="mdi mdi-magnify"></i>
						</span>
					</div>
					<input type="text" class="form-control" placeholder="search"
						aria-label="search" aria-describedby="search">
				</div>
			</li> -->
			
		</ul>
		<div
			class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
			<a class="navbar-brand brand-logo" href="/admin/viewChef"><img
				src="adminResources/image/homion-logo.svg" alt="logo" /></a> <a
				src="adminResources/image/logo.svg" alt="logo" /></a> <!-- CalmUI logo --> <a 			
				src="adminResources/image/logo.svg" alt="logo" /></a> <!-- CalmUI logo --> <a
				class="navbar-brand brand-logo-mini" href="/admin/viewChef"><img
				src="adminResources/image/fav.png" alt="logo" /></a>
		</div>
		<ul class="navbar-nav navbar-nav-right">
			
			<li class="nav-item nav-profile dropdown"><a
				class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
				id="profileDropdown"> <img src="adminResources/image/face1.jpg"
					alt="profile" /> <span class="nav-profile-name">${sessionScope.admin.name}</span>
			</a>
				<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
					aria-labelledby="profileDropdown">
					<!-- <a class="dropdown-item"> <i
						class="mdi mdi-settings text-primary"></i> Settings
					</a> -->
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="/admin/logout"> <i
						class="mdi mdi-logout text-primary"></i> Logout
					</a>
				</div></li>			
			
			<li class="nav-item nav-toggler-item-right d-lg-none">
				<button class="navbar-toggler align-self-center" type="button"
					data-toggle="offcanvas">
					<span class="mdi mdi-menu"></span>
				</button>
			</li>
		</ul>
	</div>
</nav>
