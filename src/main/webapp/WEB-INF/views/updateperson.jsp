<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>

	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css"/>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js" type="text/javascript"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Update Person</title>
	</head>


<body>
	<h1>Update Person</h1>
	
	<form action="/persons/updateperson" method="post">
	<table>
		<tr>
			<td>firstName:</td>
			<td><input type="text" name="firstName" value="${person.firstName}"  /> </td></tr>
			<tr>
			<td>lastName:</td>
		<td><input type="text" name="lastName" value="${person.lastName}" /> </td></tr>
		<tr>
			<td>email:</td>
		<td><input type="text" name="email" value="${person.email}" /> </td></tr>
		<tr>
			<td>phone:</td>
		<td><input type="text" name="phone"  value="${person.phone}" /> </td></tr>
	
			<tr>
			<td>city:</td>
		<td><input type="text" name="city" value="${person.address.city}"  /> </td></tr>
	
			<tr>
			<td>state:</td>
		<td><input type="text" name="state" value="${person.address.state}" /> </td></tr>
	
			<tr>
			<td>country:</td>
		<td><input type="text" name="country" value="${person.address.country}" /> </td></tr>
	

			<tr>
			<td>zipcode:</td>
		<td><input type="text" name="zipcode" value="${person.address.zipcode}" /> </td></tr>
				
	</table>
	
	<input type="hidden" name= "${_csrf.parameterName}" value="${_csrf.token}"/>
	
	<input type="submit" value="Save Data"/>
	</form>
	</body>
</html>
	