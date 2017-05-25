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
</head>
<div class="row1">
	<jsp:include page="header.jsp"></jsp:include>
</div>
<div class="container">
	<div class="row">
		<c:forEach items="${orders}" var="order">
			<ul>${order.orderDate} => ${order.person.firstName}
				<c:forEach items="${order.orderLines}" var="orderLine">
					<li>Product Name: ${orderLine.product.productName} </li>
					<li>Quantity: ${orderLine.quantity} </li>
				</c:forEach>
			</ul>
		</c:forEach>
	</div>
</div>
</body>
</html>