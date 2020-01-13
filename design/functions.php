<?php 
function isLoggedIn($post_email, $post_password){
	global $con;
	if ($stmt = $con->prepare('SELECT id, password FROM users WHERE email = ?')) {
		// Bind parameters (s = string, i = int, b = blob, etc), in our case the username is a string so we use "s"
		$stmt->bind_param('s', $post_email);
		$stmt->execute();
		// Store the result so we can check if the account exists in the database.
		$stmt->store_result();
		if ($stmt->num_rows > 0) {
			$stmt->bind_result($id, $password);
			$stmt->fetch();
			// Account exists, now we verify the password.
			// Note: remember to use password_hash in your registration file to store the hashed passwords.
			if (password_verify($post_password, $password)) {
				// Verification success! User has loggedin!
				// Create sessions so we know the user is logged in, they basically act like cookies but remember the data on the server.
				session_regenerate_id();
				$_SESSION['loggedin'] = TRUE;
				$_SESSION['email'] = $post_email;
				$_SESSION['id'] = $id;
				echo 'Welcome ' . $_SESSION['name'] . '!';
				return true;
			} else {
				echo 'Incorrect password!';
				return false;
			}
		} else {
			echo 'Incorrect username!';
			return false;
		}
		$stmt->close();
	} else {
		return false;
	}
}
function createCompany($post_name, $post_code, $post_key){
	global $con;
	if ($stmt = $con->prepare('SELECT id, name FROM companies WHERE code = ?')) {
		// Bind parameters (s = string, i = int, b = blob, etc), in our case the username is a string so we use "s"
		$stmt->bind_param('s', $post_code);
		$stmt->execute();
		// Store the result so we can check if the company exists in the database.
		$stmt->store_result();
		if ($stmt->num_rows > 0) {
			$stmt->bind_result($id, $name);
			$stmt->fetch();
			// Account exists, now we verify the password.
			// Note: remember to use password_hash in your registration file to store the hashed passwords.
			// if (password_verify($post_password, $password)) {
			// 	// Verification success! User has loggedin!
			// 	// Create sessions so we know the user is logged in, they basically act like cookies but remember the data on the server.
			// 	session_regenerate_id();
			// 	$_SESSION['loggedin'] = TRUE;
			// 	$_SESSION['email'] = $post_email;
			// 	$_SESSION['id'] = $id;
			// 	echo 'Welcome ' . $_SESSION['name'] . '!';
			// 	return true;
			// } else {
			// 	echo 'Incorrect password!';
			// 	return false;
			// }
			echo "Company already exists";
			return false;
		} else {
			//Insert to db
			// Company doesnt exists, insert new company
			if ($stmt = $con->prepare('INSERT INTO companies (name, code, infusionsoft_key) VALUES (?, ?, ?)')) {
				// We do not want to expose passwords in our database, so hash the password and use password_verify when a user logs in.
				$stmt->bind_param('sss', $post_name, $post_code, $post_key);
				$stmt->execute();
				echo 'You have successfully created a company';
				return true;
			} else {
				// Something is wrong with the sql statement, check to make sure accounts table exists with all 3 fields.
				echo 'Could not prepare statement!';
				return false;
			}
		}
		$stmt->close();
	} else {
		return false;
	}
}
function logOut(){
	session_destroy();
	// Redirect to the login page:
	header('Location: login.php');
}
function getCompany($get_id){
	global $con;
	if ($stmt = $con->prepare('SELECT id, name, code, infusionsoft_key FROM companies WHERE id = ?')) {
		// Bind parameters (s = string, i = int, b = blob, etc), in our case the username is a string so we use "s"
		$stmt->bind_param('s', $get_id);
		$stmt->execute();
		// Store the result so we can check if the company exists in the database.
		$result = $stmt->get_result();
		if ($result->num_rows > 0) {
			//create array and object
			$company = [];
			
			while($row = $result->fetch_assoc()) {
				$company['id'] = $row['id'];
				$company['name'] = $row['name'];
				$company['code'] = $row['code'];
				$company['infusionsoft_key'] = $row['infusionsoft_key'];
			}
			return $company;
		} else {
			//empty, show blank 
			// return false;
		}
		$stmt->close();
	} else {
		// return false;
	}
}
function deleteCompany($get_id){
	global $con;
	if ($stmt = $con->prepare('DELETE FROM companies WHERE id = ?')) {
		// Bind parameters (s = string, i = int, b = blob, etc), in our case the username is a string so we use "s"
		$stmt->bind_param('s', $get_id);
		$stmt->execute();
		$stmt->close();
		return true;
	} else {
		return false;
	}
}
function updateCompany($get_id, $post_name, $post_code, $post_key){
	global $con;
	if ($stmt = $con->prepare('UPDATE companies SET name = ?, code = ?, infusionsoft_key = ? WHERE id = ?')) {
		// Bind parameters (s = string, i = int, b = blob, etc), in our case the username is a string so we use "s"
		$stmt->bind_param('ssss', $post_name, $post_code, $post_key, $get_id);
		$stmt->execute();
		// Store the result so we can check if the company exists in the database.
		// $result = $stmt->get_result();
		// if ($result->num_rows > 0) {
		// 	//create array and object
		// 	$company = [];
			
		// 	while($row = $result->fetch_assoc()) {
		// 		$company['id'] = $row['id'];
		// 		$company['name'] = $row['name'];
		// 		$company['code'] = $row['code'];
		// 		$company['infusionsoft_key'] = $row['infusionsoft_key'];
		// 	}
		// 	return $company;
		// } else {
		// 	//empty, show blank 
		// 	// return false;
		// }
		$stmt->close();
		return true;
	} else {
		return false;
	}
}
function getCompanyList(){
	global $con;
	if ($stmt = $con->prepare('SELECT id, name, code, infusionsoft_key FROM companies')) {
		// Bind parameters (s = string, i = int, b = blob, etc), in our case the username is a string so we use "s"
		// $stmt->bind_param('s', $post_code);
		$stmt->execute();
		// Store the result so we can check if the company exists in the database.
		$result = $stmt->get_result();
		if ($result->num_rows > 0) {
			//create array and object
			$companies = [];
			
			while($row = $result->fetch_assoc()) {
				$company = [];
				$company['id'] = $row['id'];
				$company['name'] = $row['name'];
				$company['code'] = $row['code'];
				$company['infusionsoft_key'] = $row['infusionsoft_key'];
				array_push($companies, $company);
			}
			return $companies;
		} else {
			//empty, show blank 
			// return false;
		}
		$stmt->close();
	} else {
		// return false;
	}
}
?>