<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Cake_shop_Project.admin.adminlogin" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="admin/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="admin/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="admin/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="admin/vendor/animate/animate.css">	
	<link rel="stylesheet" type="text/css" href="admin/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="admin/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="admin/vendor/select2/select2.min.css">	
	<link rel="stylesheet" type="text/css" href="admin/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="admin/css/util.css">
	<link rel="stylesheet" type="text/css" href="admin/css/main.css">
</head>
<body>
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
				<form id="login" runat="server" class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-53">
						Sign In With
					</span>
					<div class="p-t-31 p-b-9">
						<span class="txt1">
							Username
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Username is required">
						<asp:TextBox ID="username" runat="server"  CssClass="input100"></asp:TextBox>
						<span class="focus-input100"></span>
					</div>
					
					<div class="p-t-13 p-b-9">
						<span class="txt1">
							Password
						</span>

						<a href="#" class="txt2 bo1 m-l-5">
							Forgot?
						</a>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<asp:TextBox TextMode="Password" ID="password" runat="server" CssClass="input100"></asp:TextBox>
						<span class="focus-input100"></span>
					</div>
					<br>
					<asp:Label id="Error" runat="server" Text="" CssClass="text-danger"></asp:Label>
					<br>
					<div class="container-login100-form-btn m-t-17">
						<asp:Button ID="SignIn" runat="server" Text="Sign In" CssClass="login100-form-btn" OnClick="SignIn_Click" />
					</div>
					<div class="w-full text-center p-t-55">
						<span class="txt2">
							Not a member?
						</span>
						<a href="register.aspx" class="txt2 bo1">
							Sign up now
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="dropDownSelect1"></div>
	<script src="admin/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="admin/vendor/animsition/js/animsition.min.js"></script>
	<script src="admin/vendor/bootstrap/js/popper.js"></script>
	<script src="admin/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="admin/vendor/select2/select2.min.js"></script>
	<script src="admin/vendor/daterangepicker/moment.min.js"></script>
	<script src="admin/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="admin/vendor/countdowntime/countdowntime.js"></script>
	<script src="admin/js/main.js"></script>
</body>
</html>
