<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>products</title>
</head>
<body>
	<h1>Add customer</h1>
	
	<form action="/product/update" method="post">
	<table>
	
			<td><input type="hidden" name="id" value="${product.id}"  /> </td></tr>
	
		<tr>
			<td>Product Name:</td>
			<td><input type="text" name="productName" value="${product.productName}"  /> </td></tr>
			<tr>
			<td>Description:</td>
		<td><input type="text" name="description" value="${product.description}" /> </td></tr>
		<tr>
			<td>Price:</td>
		<td><input type="text" name="price" value="${product.price}" /> </td></tr>
		<tr>
			<td>Product Type:</td>
			<td><input type="text" name="productType" value="${product.productType}" /> </td>
		</tr>
	
				
	</table>
	
	<input type="hidden" name= "${_csrf.parameterName}" value="${_csrf.token}"/>
	
	<input type="submit" value="Update Product"/>
	</form>
	
	<form action="/product/update" method="get">
		<input type="hidden" name= "${_csrf.parameterName}" value="${_csrf.token}"/>
	
	<input type="submit" value="Cancel"/>
	
	</form>
	</body>
</html>