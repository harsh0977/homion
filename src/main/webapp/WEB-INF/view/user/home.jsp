<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link rel="icon" type="image/png" href="userResources/image/fav.png">
      <title>Homion - Home</title>
      <link rel="stylesheet" type="text/css" href="userResources/css/slick.min.css" />
      <link rel="stylesheet" type="text/css" href="userResources/css/slick-theme.min.css" />
      <link href="userResources/css/feather.css" rel="stylesheet" type="text/css">
      <link href="userResources/css/bootstrap.min.css" rel="stylesheet">
      <link href="userResources/css/style.css" rel="stylesheet">
      <link href="userResources/css/demo.css" rel="stylesheet">
      <link rel="stylesheet" href="../chef/chefResources/css/materialdesignicons.min.css">
   </head>
   <body class="fixed-bottom-bar">
     
     <!-- header start -->
         <jsp:include page="header.jsp"></jsp:include>
     <!-- header end -->
     
      <div class="osahan-home-page">
         <div class="bg-primary p-3 d-none">
            <div class="text-white">
               <div class="title d-flex align-items-center">
                  <a class="toggle" href="#">
                  <span></span>
                  </a>
                  <h4 class="font-weight-bold m-0 pl-5">Homion</h4>
                  <!-- <a class="text-white font-weight-bold ml-auto" data-toggle="modal" data-target="#exampleModal" href="#">Filter</a> -->
               </div>
            </div>
            <!-- <div class="input-group mt-3 rounded shadow-sm overflow-hidden">
               <div class="input-group-prepend">
                  <button class="border-0 btn btn-outline-secondary text-dark bg-white btn-block"><i class="feather-search"></i></button>
               </div>
               <input type="text" class="shadow-none border-0 form-control" placeholder="Search for restaurants or dishes">
            </div> -->
         </div>
         <div class="container">
            <div class="cat-slider">
               <div class="cat-item px-1 py-3">
                  <a class="bg-white rounded d-block p-2 text-center shadow-sm" href="trending.jsp">
                     <img alt="#" src="userResources/image/Fries.png" class="img-fluid mb-2">
                     <p class="m-0 small">Fries</p>
                  </a>
               </div>
               <div class="cat-item px-1 py-3">
                  <a class="bg-white rounded d-block p-2 text-center shadow-sm" href="trending.jsp">
                     <img alt="#" src="userResources/image/Pizza.png" class="img-fluid mb-2">
                     <p class="m-0 small">Pizza</p>
                  </a>
               </div>
               <div class="cat-item px-1 py-3">
                  <a class="bg-white rounded d-block p-2 text-center shadow-sm" href="trending.jsp">
                     <img alt="#" src="userResources/image/Burger.png" class="img-fluid mb-2">
                     <p class="m-0 small">Burger</p>
                  </a>
               </div>
               <div class="cat-item px-1 py-3">
                  <a class="bg-white rounded d-block p-2 text-center shadow-sm" href="trending.jsp">
                     <img alt="#" src="userResources/image/Sandwich.png" class="img-fluid mb-2">
                     <p class="m-0 small">Sandwich</p>
                  </a>
               </div>
               <div class="cat-item px-1 py-3">
                  <a class="bg-white rounded d-block p-2 text-center shadow-sm" href="trending.jsp">
                     <img alt="#" src="userResources/image/Coffee.png" class="img-fluid mb-2">
                     <p class="m-0 small">Coffee</p>
                  </a>
               </div>
               <div class="cat-item px-1 py-3">
                  <a class="bg-white rounded d-block p-2 text-center shadow-sm" href="trending.jsp">
                     <img alt="#" src="userResources/image/Steak.png" class="img-fluid mb-2">
                     <p class="m-0 small">Steak</p>
                  </a>
               </div>
               <div class="cat-item px-1 py-3">
                  <a class="bg-white rounded d-block p-2 text-center shadow-sm" href="trending.jsp">
                     <img alt="#" src="userResources/image/ColaCan.png" class="img-fluid mb-2">
                     <p class="m-0 small">ColaCan</p>
                  </a>
               </div>
               <div class="cat-item px-1 py-3">
                  <a class="bg-white rounded d-block p-2 text-center shadow-sm" href="trending.jsp">
                     <img alt="#" src="userResources/image/Breakfast.png" class="img-fluid mb-2">
                     <p class="m-0 small">Breakfast</p>
                  </a>
               </div>
               <div class="cat-item px-1 py-3">
                  <a class="bg-white rounded d-block p-2 text-center shadow-sm" href="trending.jsp">
                     <img alt="#" src="userResources/image/Salad.png" class="img-fluid mb-2">
                     <p class="m-0 small">Salad</p>
                  </a>
               </div>
            </div>
         </div>
         
         
         <!--************************************************************
         chef slider
         ********************************************************** -->
         <div class="">
            <div class="container">
               <h5 class="mt-3">Top chefs</h5>
               <form action="/user/chefDetails" method="post" id="myForm"> <input type="hidden" name="chefId" id="chefId"> </form>
             		<div class="offer-slider">
                   <jstl:forEach items="${chefs}" var="chef">
                    <div class="scale cat-item px-1 py-3">
                       <a class="d-block text-center" onclick="setChefId(${chef.id})" style="cursor: pointer;">
                       <jstl:choose>
                         <jstl:when test="${chef.image ne 'NoImage'}">
                           <img alt="chefImage" src="${chef.image}" class="img-fluid round shadow-sm">
                         </jstl:when>
                         <jstl:otherwise>
                           <img alt="chefImage" src="../chef/chefResources/image/defaultChef.jpg" class="img-fluid round shadow-sm">
                         </jstl:otherwise>
                       </jstl:choose>
                       <h5 class="mt-3 text-dark text-center font-weight-bold">${chef.firstName}</h5>
                       </a>
                    </div>
                  </jstl:forEach>
             </div>
            </div>
         </div>
         
         
         <!-- ***************************************************************
         Trending this week
         *************************************************************** -->
         <div class="container">
            <div class="pt-4 pb-2 title d-flex align-items-center">
               <h5 class="m-0" id="trending">Trending this week</h5>
               <!-- <a class="font-weight-bold ml-auto" href="trending.jsp">View all <i class="feather-chevrons-right"></i></a> -->
            </div>
            <div class="trending-slider">
            	<jstl:forEach items="${trending}" var="product">
	               <div class="osahan-slider-item">
	                  <div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
	                     <div class="list-card-image">
	                        <div class="star position-absolute"><span class="badge badge-success"><i class="feather-star"></i> ${product.rating} (${product.count}) </span></div>
	                        <div class="favourite-heart position-absolute">
	                           <i class="mdi-18px mdi mdi-heart-outline" style="cursor: pointer" id="${product.id}" onclick="favourite(${product.id}, 'Product');"></i>
	                        </div>
	                        <jstl:if test="${product.openForHome eq true}">
	                        		<div class="member-plan position-absolute"><span class="badge badge-danger">Available For Home</span></div>
	                        	</jstl:if>
	                        <a onclick="setChefId(${product.chef.id})">
	                        	<img alt="#" src="${product.image}" class="img-fluid item-img w-100">
	                        </a>
	                     </div>
	                     <div class="p-3 position-relative">
	                        <div class="list-card-body">
	                           <h6 class="mb-1"><a onclick="setChefId(${product.chef.id})" class="text-black">${product.name}</a></h6>
	                           <p class="text-gray mb-3">${product.subCategory.name}, ${product.category.name}</p>
	                           <p class="text-gray mb-3 time"><span class="bg-light text-dark rounded-sm pl-2 pb-1 pt-1 pr-2"><i class="feather-clock"></i> ${product.preparationTime} min</span> <span class="float-right text-dark"> &#x20B9; ${product.price} FOR ${product.unitValue} ${product.unit}</span></p>
	                        </div>
	                     </div>
	                  </div>
	               </div>
               </jstl:forEach>
            </div>
            
            
           <!--  *******************************************************
            Most popular
            ******************************************************* -->
            
            <div class="mt-2 py-3 title d-flex align-items-center">
               <h5 class="m-0" id="mostpopular">Most popular</h5>
               <!-- <a class="font-weight-bold ml-auto" href="most-popular.jsp">View all <i class="feather-chevrons-right"></i></a> -->
            </div>
            
            <div class="most_popular">
               <div class="row">
               	 	<jstl:forEach items="${mostPopular}" var="product">
	                  <div class="col-md-3 pb-3">
	                     <div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
	                        <div class="list-card-image">
	                           <div class="star position-absolute"><span class="badge badge-success"><i class="feather-star"></i> ${product.rating} (${product.count})</span></div>
	                           	<div class="favourite-heart position-absolute">
		                           <i class="mdi-18px mdi mdi-heart-outline" style="cursor: pointer" id="${product.id}" onclick="favourite(${product.id}, 'Product');"></i>
		                        </div>
	                            <jstl:if test="${product.openForHome eq true}">
	                        		<div class="member-plan position-absolute"><span class="badge badge-danger">Available For Home</span></div>
	                        	</jstl:if>
	                           <a onclick="setChefId(${product.chef.id})">
	                           <img alt="#" src="${product.image}" class="img-fluid item-img w-100">
	                           </a>
	                        </div>
	                        <div class="p-3 position-relative">
	                           <div class="list-card-body">
	                              <h6 class="mb-1"><a onclick="setChefId(${product.chef.id})" class="text-black">${product.name}</a></h6>
	                          	  <p class="text-gray mb-3">${product.subCategory.name}, ${product.category.name}</p>
	                              <p class="text-gray mb-3 time"><span class="bg-light text-dark rounded-sm pl-2 pb-1 pt-1 pr-2"><i class="feather-clock"></i> ${product.preparationTime} min</span> <span class="float-right text-dark"> &#x20B9; ${product.price} FOR ${product.unitValue} ${product.unit}</span></p>
	                           </div>
	                           <!-- <div class="list-card-badge">
	                              <span class="badge badge-danger">OFFER</span> <small>65% OSAHAN50</small>
	                           </div> -->
	                        </div>
	                     </div>
	                  </div>
                  	</jstl:forEach>
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