<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Person Page</title>
</head>
<body>

	<h1>Add Person</h1>
	
	<form action="/persons/addperson" method="post">
	<table>
		<tr>
        <td>First Name:</td>
        <td><input type="text" name="firstName"  /> </td></tr>
        <tr>
        <td>Last Name:</td>
		<td><input type="text" name="lastName" /> </td></tr>
		<tr>
        <td>Email:</td>
		<td><input type="text" name="email" /> </td></tr>
		<tr>
        <td>Phone:</td>
		<td><input type="text" name="phone" /> </td></tr>
	    <tr>
        <td>City:</td>
		<td><input type="text" name="city" /> </td></tr>
        <tr>
        <td>State:</td>
		<td><input type="text" name="state" /> </td></tr>
        <tr>
        <td>Country:</td>
		<td><input type="text" name="country" /> </td></tr>
        <tr>
        <td>Zipcode:</td>
		<td><input type="text" name="zipcode" /> </td></tr>
				
	</table>
	
	<input type="hidden" name= "${_csrf.parameterName}" value="${_csrf.token}"/>
	
	<input type="submit" value="Save Data"/>
	</form>
	

	<table>
        <c:forEach var="person" items="${persons}">
        <tr>
            <td>${person.firstName}</td>
            <td>${person.lastName}</td>
            <td>${person.email}</td>
            <td>${person.address.city}</td>
            <td>${person.address.country}</td>
            <td>${person.phone}</td>
            <td><a href="/persons/updateperson/${person.id}">   Edit</a></td>
            <td><a href="${pageContext.request.contextPath}/persons/deleteperson/${person.id}">Delete</a></td>
            </tr>
        </c:forEach>
	</table>
	</body>
</html>


<%--<script>--%>
    <%--$(document).ready(function() {--%>
        <%--var deleteLink = $("a:contains('Delete')");--%>
        <%--$(deleteLink).click(function(event) {--%>
            <%--var conBox = confirm("Are you sure ?");--%>
            <%--if(conBox){--%>
                <%--$.ajax({--%>
                    <%--url: $(event.target).attr("href"),--%>
                    <%--type: "DELETE",--%>

                    <%--beforeSend: function(xhr) {--%>
                        <%--xhr.setRequestHeader("Accept", "application/json");--%>
                        <%--xhr.setRequestHeader("Content-Type", "application/json");--%>
                    <%--},--%>

                    <%--success: function() {--%>
                        <%--var tr = $(event.target).closest("tr");--%>
                        <%--tr.css("background-color","#000000");--%>
                        <%--tr.fadeIn(1000).fadeOut(200, function(){--%>
                            <%--tr.remove();})--%>
                    <%--}--%>
                <%--});--%>
            <%--} else {--%>
                <%--event.preventDefault();--%>
            <%--}--%>
            <%--event.preventDefault();--%>
        <%--});--%>
    <%--});--%>
<%--</script>--%>