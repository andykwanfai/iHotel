<!DOCTYPE html>
<!-- HTML5 Hello world by kirupa - http://www.kirupa.com/html5/getting_your_feet_wet_html5_pg1.htm -->
<html lang="en-us">

<head>
	<meta charset="utf-8">
	<title>Hotel Booking Web Applciation - Find Password</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/main.css">
	<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

</head>

<body>
	<%@ include file="navbar.jsp" %>
	<div class="container-fluid">
		<div class="row">
                    <form role="form" id="recPwForm" method="get" action="AccountController.do">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<br>
				<div class="panel panel-default">
					<div class="panel-heading">Find Password</div>
					<div class="panel-body">
							<input type="text" class="form-control" name="Email" placeholder="Your email" aria-describedby="basic-addon1">
				<br>
                                <input type="hidden" name="action" value="fpw" />
					<a id="btn-login" href="#" class="btn btn-success btn-block" onclick="document.getElementById('recPwForm').submit(); return false;">Reset Password  </a>
					<a href="login.html">back</a>

					</div>
				</div>
			</div>
                                            </form>
			<div class="col-md-4"></div>
		</div>
	</div>
</body>

</html>
