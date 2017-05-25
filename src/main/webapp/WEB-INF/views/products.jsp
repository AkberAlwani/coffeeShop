<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product</title>
</head>
<body>
	<h1>Products Master</h1>
	
	<form action="/product/delete" method="post">
		<table>
			<tr>
				<td>productName:</td>
				<td><input type="text" name="productName"  /> </td></tr>
				<tr>
				<td>description:</td>
			<td><input type="text" name="description" /> </td></tr>
			<tr>
				<td>price:</td>
			<td><input type="text" name="price" /> </td></tr>
			<tr>
				<td>productType:</td>
			<td><input type="text" name="productType" /> </td></tr>


		</table>
		<input type="hidden" name= "${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="submit" value="Add Product"/>
	</form>
	<table>
		<c:forEach var="product" items="${products}">
		<tr>

			<td>${product.productName}</td>

			<td>${product.description}</td>
			<td>${product.price}</td>
		   	<td>${product.productType}</td>
				<td><a href="/product/update/${product.id}">Update</a></td>
				<td><a href="/product/delete/${product.id}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	</body>
</html>