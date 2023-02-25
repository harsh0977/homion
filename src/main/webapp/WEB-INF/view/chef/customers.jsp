<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Chef - Harshil</title>
  <link rel="stylesheet" href="chefResources/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="chefResources/css/style.css">
  <link rel="stylesheet" href="chefResources/css/bootstrap.min.css">
  <link rel="stylesheet" href="chefResources/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="chefResources/css/bootstrap-datepicker.min.css">
  <link rel="shortcut icon" href="chefResources/image/favicon.png" />
  <script type="text/javascript">
    $(function () {
    $('[data-toggle="tooltip"]').tooltip()
    })
  </script>
</head>


<body class="sidebar-light">

  <div class="container-scroller">
  	
  	<jsp:include page="header.jsp"></jsp:include>
  	    
    <div class="container-fluid page-body-wrapper">

		<jsp:include page="menu.jsp"></jsp:include>
      
      <div class="main-panel own-body">

        <!-- Working area start-->
        <h2 class="mt-3 ml-4 float-left">Customers</h2>
        <!-- card starts----------------------------------------------------------------------- -->
        <div class="card w-75 mx-auto mt-2">
          <div class="card-body">
            <div class="row">
              <div class="col-md-2 mx-auto custImage">
                  <img src="chefResources/image/face1.jpg" class="rounded-circle max-img-size">
              </div>
              <div class="col-md-10">
                <div class="float-left">
                  <h4>Harshil Dangi</h4>
                  <h4 class="text-danger">Items - 4</h4>
                </div>
                <div class="floatRating">
                  <i class="mdi mdi-star"></i>
                  <i class="mdi mdi-star"></i>
                  <i class="mdi mdi-star"></i>
                  <i class="mdi mdi-star"></i>
                  <i class="mdi mdi-star"></i>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <span class="text-dark d-block mt-2"><i class="mdi mdi-calendar"></i>February 12,2021</span>
                <div class="card-text mt-2">
                  <span>(Review)With supporting text below as a natural lead-in to additional lorem ipsum content. Here goes the review</span>
                  <a href="/invoice" class="btn btn-primary float-right viewDetailsBtn">Invoice</a>
                  <span class="d-block "><i class="mdi mdi-counter mdi-24px viewDetailsBtn mt-3"></i> 3
                </div>
              </div>
            </div>  
        </div>
      </div>
      <!-- card end---------------------------------------------------------------------------------------  -->

      <!-- card starts----------------------------------------------------------------------- -->
        <div class="card w-75 mx-auto mt-5">
          <div class="card-body">
            <div class="row">
              <div class="col-md-2 mx-auto custImage">
                  <img src="chefResources/image/face1.jpg" class="rounded-circle max-img-size">
              </div>
              <div class="col-md-10">
                <div class="float-left">
                  <h4>Harshil Dangi</h4>
                  <h4 class="text-danger">Items - 4</h4>
                </div>
                <div class="floatRating">
                  <i class="mdi mdi-star"></i>
                  <i class="mdi mdi-star"></i>
                  <i class="mdi mdi-star"></i>
                  <i class="mdi mdi-star"></i>
                  <i class="mdi mdi-star"></i>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <span class="text-dark d-block mt-2"><i class="mdi mdi-calendar"></i>February 12,2021</span>
                <div class="card-text mt-2">
                  <span>(Review)With supporting text below as a natural lead-in to additional lorem ipsum content. Here goes the review</span>
                  <a href="/invoice" class="btn btn-primary float-right viewDetailsBtn">Invoice</a>
                  <span class="d-block "><i class="mdi mdi-counter mdi-24px viewDetailsBtn mt-3"></i> 3
                </div>
              </div>
            </div>  
        </div>
      </div>
      <!-- card end---------------------------------------------------------------------------------------  -->

      <!-- card starts----------------------------------------------------------------------- -->
        <div class="card w-75 mx-auto mt-5">
          <div class="card-body">
            <div class="row">
              <div class="col-md-2 mx-auto custImage">
                  <img src="chefResources/image/face1.jpg" class="rounded-circle max-img-size">
              </div>
              <div class="col-md-10">
                <div class="float-left">
                  <h4>Harshil Dangi</h4>
                  <h4 class="text-danger">Items - 4</h4>
                </div>
                <div class="floatRating">
                  <i class="mdi mdi-star"></i>
                  <i class="mdi mdi-star"></i>
                  <i class="mdi mdi-star"></i>
                  <i class="mdi mdi-star"></i>
                  <i class="mdi mdi-star"></i>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <span class="text-dark d-block mt-2"><i class="mdi mdi-calendar"></i>February 12,2021</span>
                <div class="card-text mt-2">
                  <span>(Review)With supporting text below as a natural lead-in to additional lorem ipsum content. Here goes the review</span>
                  <a href="/invoice" class="btn btn-primary float-right viewDetailsBtn">Invoice</a>
                  <span class="d-block "><i class="mdi mdi-counter mdi-24px viewDetailsBtn mt-3"></i> 3
                </div>
              </div>
            </div>  
        </div>
      </div>
      <!-- card end---------------------------------------------------------------------------------------  -->
        <!-- Working area end-->        

        <jsp:include page="footer.jsp"></jsp:include>

      </div>

    </div>
  </div>

  <script src="chefResources/js/vendor.bundle.base.js"></script>
  <script src="chefResources/js/bootstrap-datepicker.min.js"></script>
  <script src="chefResources/js/off-canvas.js"></script>
  <script src="chefResources/js/hoverable-collapse.js"></script>
  <script src="chefResources/js/template.js"></script>
  <script src="chefResources/js/dashboard.js"></script>
  <script src="chefResources/js/jquery.min.js"></script>
  <script src="chefResources/js/popper.min.js"></script>
  <script src="chefResources/js/bootstrap.min.js"></script>

  

</body>
</html>

