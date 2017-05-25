<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
	<div class="container1">
		<div class="row1">
			<nav class="navbar navbar-default">
				<div class="container-fluid">

					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">Home</a>
					</div>

					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
                            <c:choose>
                                <c:when test="${user == 'ADMIN'}">
                                    <li><a href="/product/list">Products</a></li>
                                    <li><a href="/persons/addperson">Persons</a></li>
                                    <li><a href="/order/list">Orders</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="active"><a href="/">Products</a></li>
                                    <li class=""><a href="/orders/view">Orders</a></li>
                                </c:otherwise>
                            </c:choose>
						</ul>

						<ul class="nav navbar-nav navbar-right">
							<li><a href="/signup">Sign Up</a></li>
							<c:choose>
                                <c:when test="${pageContext.request.userPrincipal.name == null}">
                                    <li><a href="/login">Login</a></li>
								</c:when>
								<c:otherwise>
                                    <li><a href="/logout">Logout</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<div class="container">
			<div class="row" id="products">

			</div>
			<div class="row">
				<div class="col-md-2">
					<c:choose>
						<c:when test="${user == 'USER'}">
							<button class="btn btn-success placeOrder">Place Order</button>
						</c:when>
						<c:otherwise>
							<a class="btn btn-success" href="/products/add">Add Product</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</body>
</html>