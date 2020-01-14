<?php 
require 'config.php';
require 'functions.php';

// If the user is not logged in redirect to the login page...
if (!isset($_SESSION['loggedin'])) {
	header('Location: login.php');
	exit();
} else {
	//echo " login user:".$_SESSION['email'];
}
// var_dump(getCompanyList());
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Gatling | Manage</title>

  <!-- Favicon -->
<!--   <link href="assets/img/brand/favicon.png" rel="icon" type="image/png"> -->

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

  <!-- Icons -->
  <link href="assets/vendor/nucleo/css/nucleo.css" rel="stylesheet">
  <link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">


  <!-- Argon CSS -->
  <link type="text/css" href="assets/css/argon.css" rel="stylesheet">
</head>
<body>
  <header id="header" class="header-global">
    <nav class="navbar navbar-expand-lg navbar-dark bg-default">
        <div class="container">
            <a class="navbar-brand" href="#">GATLING API</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-default" aria-controls="navbar-default" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbar-default">
                <div class="navbar-collapse-header">
                    <div class="row">
                        <div class="col-6 collapse-brand">
                            <a href="index.html">
                                <img src="assets/img/brand/blue.png">
                            </a>
                        </div>
                        <div class="col-6 collapse-close">
                            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar-default" aria-controls="navbar-default" aria-expanded="false" aria-label="Toggle navigation">
                                <span></span>
                                <span></span>
                            </button>
                        </div>
                    </div>
                </div>

                <ul class="navbar-nav ml-lg-auto">
                    <li class="nav-item">
                        <a class="nav-link nav-link-icon" href="create_company.php">
                            <i class="ni ni-istanbul"></i>
                            <span class="nav-link-inner--text d-lg-none">Create a company</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-icon" href="index.php">
                            <i class="ni ni-settings-gear-65"></i>
                            <span class="nav-link-inner--text d-lg-none">Manage APIs</span>
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link nav-link-icon" href="#" id="navbar-default_dropdown_1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="ni ni-circle-08"></i>
                            <span class="nav-link-inner--text d-lg-none">Account</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbar-default_dropdown_1">
                            <a class="dropdown-item" href="logout.php">Log out</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                </ul>

            </div>
        </div>
    </nav>

    
  </header><!-- /header -->
  <main>
    <section class="section">
      <div class="container">
        <div class="container mb-5">
        <!-- Inputs -->
        <h3 class="h4 text-primary font-weight-bold mb-4">Manage APIs</h3>
        <div class="mb-3">
          <small class="text-uppercase font-weight-bold">Companies</small>
        </div>
        <div class="row">
          <div class="col-sm-12 col-lg-4 mb-4">
            <div class="card shadow-sm btn btn-primary p-0 pb-3"  onclick="window.location.href = 'create_company.php'">
              <div class="card-body">
                <h6 class="text-white text-capitalize  align-text-middle">Create a company</h6>
                <div class="icon icon-shape icon-shape-primary rounded-circle">
                  <i class="ni ni-fat-add"></i>
                </div>
                <!-- <i class="fa fa-plus"></i> -->
              </div>
            </div>
          </div>
          <?php 
          if($companies = getCompanyList()){
            foreach ($companies as $key => $value) {
              echo "
                <div class='col-sm-12 col-lg-4 mb-4'>
                <a href='company.php?company_id=".$companies[$key]['id']."'>
                  <div class='card shadow-sm btn btn-secondary text-left p-0'>
                    <div class='card-body'>
                      <h6 class='text-primary text-capitalize'>".$companies[$key]['name']."</h6>
                      <p class='description text-capitalize'>".$companies[$key]['code']."</p>
                      <small class='text-muted'>12:01 PM, 10/01/2020</small>
                    </div>
                  </div>
                  </a>
                </div>
              ";
            }
          }
          //   echo "


          // <div class='col-sm-12 col-lg-4 mb-4'>
          //   <div class='card shadow-sm btn btn-secondary text-left p-0'  onclick='window.location.href = 'company.html''>
          //     <div class='card-body'>
          //       <h6 class='text-primary text-capitalize'>Sample Company</h6>
          //       <p class='description text-capitalize'>Lorem ipsum dolor sit amet.</p>
          //       <small class='text-muted'>12:01 PM, 10/01/2020</small>
          //     </div>
          //   </div>
          // </div>
          //   ";


          ?>
        </div> 
      </div>   
      </div>
    </section>
  </main>
  <!-- Core -->
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/popper/popper.min.js"></script>
  <script src="assets/vendor/bootstrap/bootstrap.min.js"></script>

  <!-- Optional plugins -->
  <script src="assets/vendor/PLUGIN_FOLDER/PLUGIN_SCRIPT.js"></script>

  <!-- Theme JS -->
  <script src="assets/js/argon.js"></script>
  </body>
</html>

