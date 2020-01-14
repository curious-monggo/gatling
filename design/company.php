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
// if(isset($_GET['company_id'])){
// 	if(getCompany($_GET['company_id'])){
// 		echo "Success!";
// 		// header('Location: index.php');
// 	} else {
// 		echo "Error!";
// 		header('Location: index.php');
// 	}
// }
if(isset($_POST['save'])){
  if(isset($_GET['company_id'], $_POST['company_name'], $_POST['company_code'], $_POST['infusionsoft_key'])){
    if(updateCompany($_GET['company_id'], $_POST['company_name'], $_POST['company_code'], $_POST['infusionsoft_key'])){
      echo "Success!";
      header('Location: index.php');
    } else {
      echo "Error!";
    }
  }
} else if(isset($_POST['delete'], $_GET['company_id'])) {
    if(deleteCompany($_GET['company_id'])){
      echo 'delete success';
      header('Location: index.php');
    } else{
      echo 'delete error';

    }
}
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Gatling | Manage Company</title>

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

	        <?php 
	        if($company = getCompany($_GET['company_id'])){
		        echo "
 		<form action='company.php?company_id=".$_GET['company_id']."' method='POST'>
	        <!-- Inputs -->
	        <h3 class='h4 text-warning font-weight-bold mb-4'>Manage company
          <button name='delete' type='delete' class='btn btn-outline-danger btn-md float-right'>
<span class='btn-inner--icon'><i class='fa fa-trash'></i></span>
          </button></h3>
	        <div class='mb-3'>
	          <small class='text-uppercase font-weight-bold'>Company details</small>
	        </div>
		        <div class='row'>
		          <div class='col-lg-4 col-sm-6'>
		            <div class='form-group'>
		              <div class='input-group mb-4'>
		                <input name='company_name' class='form-control' placeholder='Name' value='".$company['name']."' type='text'>
		              </div>
		            </div>
		          </div>
		          <div class='col-lg-2 col-sm-6'>
		            <div class='form-group'>
		              <div class='input-group mb-4'>
		                <input name='company_code' class='form-control' placeholder='Code' value='".$company['code']."' type='text'>
		              </div>
		            </div>
		          </div>
		          <div class='col-lg-6 col-sm-6'>
		            <div class='form-group'>
		              <div class='input-group mb-4'>
		                <div class='input-group-prepend'>
		                  <span class='input-group-text'><i class='ni ni-key-25'></i></span>
		                </div>
		                <input name='infusionsoft_key' class='form-control' placeholder='Infusionsoft API Key' value='".$company['infusionsoft_key']."' type='password'>
		              </div>
		            </div>
		          </div>
		        </div>
	    	<button type='submit' name='save' class='btn btn-warning'>Save</button>
	    	<a href='index.php' class='btn btn-outline-secondary'>Cancel</a>


      	</form>  
		        ";
	        } else {
            header('Location: index.php');
          }
	        ?>
	        

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

