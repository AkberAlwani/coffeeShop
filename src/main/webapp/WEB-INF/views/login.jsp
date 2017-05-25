<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>You are in!</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<a href="/signup">Sign Up</a>
			<a href="/home">Home</a>
			<form action="/login" method="POST" class="form-signin">

				<h3 class="form-signin-heading">Login Page</h3>
				<div class="form-group">
					<input type="text" id="email" name="email"  placeholder="Email" class="form-control" placeholder="Enter email" value="${cookie.email.value}"  required />
				</div>
				<div class="form-group">
					<input type="password"  placeholder="Password" id="password" name="password" class="form-control" />
				</div>
				<div class="checkbox">
					<label><input type="checkbox" name="rememberMeChk"
								  <c:if test="${not empty cookie.email.value}">checked</c:if>
					/>Keep me signed in</label>
				</div>
				<button class="btn btn-lg btn-primary btn-block"
						name="Submit" value="Login" type="Submit">Login</button>
			</form>
		</div>
	</div>


</body>
</html>