<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css"/>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js" type="text/javascript"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home Page</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
</body>
</html>



<script type="text/javascript">
	$(document).ready(function () {
	  loadProductList();

	  $('.placeOrder').on('click', function () {
			placeOrder();
      });
	  $('#products').on('click', '.add', function () {
		 var orders = localStorage.getItem('orders');
		 if(orders===null)
           localStorage.setItem('orders', JSON.stringify({}));
		 orders=JSON.parse(localStorage.getItem('orders'));
		 orders[$(this).data('id')]=parseInt($(this).data('q'))+1;
        localStorage.setItem('orders', JSON.stringify(orders));
        $(this).data('q', parseInt($(this).data('q'))+1);
        refreshQuantity();

      })

    });
	function refreshQuantity(){
     var  orders=JSON.parse(localStorage.getItem('orders'));
      if(orders!==null){
        for(var key in orders){
          if(orders.hasOwnProperty(key)){
            $('#products').find('.add[data-id="'+key+'"]').next().text(orders[key]);
		  }
		}
	  }
	}

	function loadProductList(){
	  $.ajax({
		url:'/products/list',
		success:function (s) {
		  	console.log(s);
		  	var i=1;
		  	for(var key in s) {
              if (s.hasOwnProperty(key)) {
                var item ='<div class="col-sm-6 col-md-4"><div class="thumbnail"> ' +
                    '<div class="caption"> ' +
                    '<h3>'+s[key].productName+'</h3> ' +
                    '<p>'+s[key].description +'</p> ' +
                    '<p><strong>Price $'+s[key].price +'</strong></p> ' +
                    '<div><img width="100" height="60" align="right" src="../resources/image/image'+i+++'.jpg"/></div>'+
                    '<p> ' +
                    '<a href="#" class="btn btn-default add" data-q="0" data-id="'+s[key].id+'" role="button">Add to Cart</a> ' +
                    '<span></span>' +
					'</p> ' +
                    '</div> ' +
                    '</div> ' +
                    '</div>';
                $('#products').append(item);
              }
              refreshQuantity();
            }
        },
		error:function (e) {
		  console.log(e);
        }
	  })
	}

	function placeOrder(){
      var  orders=JSON.parse(localStorage.getItem('orders'));
      if(orders!==null){
        console.log(orders);
        $.ajax({
		  url:'/orders',
		  type:'post',
		  data:orders,
          async:false,
		  success:function (s) {
			console.log(s);
            $('#products').find('.add').each(function () {
			  	$(this).next().text('');
            });
            alert('Order Placed');
			localStorage.clear();

          },
		  error:function (e) {
			console.log(e);
			location.href='/login';
          }
		})
	  }
	  console.log(orders);
	}
</script>