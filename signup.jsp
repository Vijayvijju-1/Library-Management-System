
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="signup_page.css">
<title>Signup</title>
<style>
body{
	background-image:url("image/login_img.png");
	background-size:100% 100%;	
	background-repeat:no-repeat;
	
	
}

</style>
</head>
<body>
<div class="wrapper">
	<div class="registration_form">
		<div class="title">
			Sign Up
		</div>

		<form action="RegisterUser" method="post">
			<div class="form_wrap">
				
					<div class="input_wrap">
						<label for="fname">Enter Name</label>
						<input type="text" id="fname" name="username"  required>
					</div>
					
				
				<div class="input_wrap">
					<label for="email">Email Address</label>
					<input type="text" id="email" name="email" required>
				</div>
				<div class="input_wrap">
					<label for="email">Phone num</label>
					<input type="text" id="email" name="login_id" required>
				</div>
				
				<div class="input_wrap">
					<label for="password">Password</label>
					<input type="password" id="Password" name="password" required>
				</div>
				<div class="input_wrap">
					<label>Gender</label>
					<ul>
						<li>
							<label class="radio_wrap">
								<input type="radio" name="gender" value="male" class="input_radio" checked>
								<span>Male</span>
							</label>
						</li>
						<li>
							<label class="radio_wrap">
								<input type="radio" name="gender" value="female" class="input_radio" required>
								<span>Female</span>
							</label>
						</li>
					</ul>
				</div>
				<div class="input_wrap">
					<input type="submit" value="Register Now" class="submit_btn">
				</div>
			</div>
		</form>
	</div>
</div>

</body>
</html>
