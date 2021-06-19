<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Cart</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Place favicon.ico in the root directory -->
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico">
<link rel="apple-touch-icon" href="apple-touch-icon.png">


<!-- All css files are included here. -->
<!-- Bootstrap fremwork main css -->
<link rel="stylesheet" href="/css/bootstrap.min.css">
<!-- Owl Carousel min css -->
<link rel="stylesheet" href="/css/owl.carousel.min.css">
<link rel="stylesheet" href="/css/owl.theme.default.min.css">
<!-- This core.css file contents all plugings css file. -->
<link rel="stylesheet" href="/css/core.css">
<!-- Theme shortcodes/elements style -->
<link rel="stylesheet" href="/css/shortcode/shortcodes.css">
<!-- Theme main style -->
<link rel="stylesheet" href="/css/style.css">
<!-- Responsive css -->
<link rel="stylesheet" href="/css/responsive.css">
<!-- User style -->
<link rel="stylesheet" href="/css/custom.css">


<!-- Modernizr JS -->
<script src="js/vendor/modernizr-3.5.0.min.js"></script>
</head>

<body>
	<jsp:include page="header-logout.jsp"></jsp:include>
	<!-- Start Bradcaump area -->
	<div class="ht__bradcaump__area"
		style="background: rgba(0, 0, 0, 0) url(/images/product/cart_image.jpg) no-repeat scroll center center/cover;">
		<div class="ht__bradcaump__wrap">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="bradcaump__inner">
							<nav class="bradcaump-inner">
								<a class="breadcrumb-item" href="/user">Home</a> <span
									class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
								<span class="breadcrumb-item active">shopping cart</span>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Bradcaump area -->
	<!-- cart-main-area start -->
	<div class="cart-main-area ptb--100 bg__white">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<form action="#">
						<div class="table-content table-responsive">
							<table>
								<thead>
									<tr>
										<th class="product-thumbnail">products</th>
										<th class="product-name">name of products</th>
										<th class="product-price">Price</th>
										<th class="product-quantity">Quantity</th>
										<th class="product-subtotal">Total</th>
										<th class="product-remove">Remove</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${not empty myCartItems}">
										<c:forEach var="map" items="${sessionScope.myCartItems}">
											<tr>
												<td class="product-thumbnail"><a href="#"><img
														src="/images/product/${map.value.productEntity.images}"
														alt="product img" /></a></td>
												<c:choose>
													<c:when test="${map.value.productEntity.sale== 0}">
														<td class="product-name"><a href="#">${map.value.productEntity.name}</a>
															<ul class="pro__prize">
																<li class="old__prize">$${map.value.productEntity.price}</li>
															</ul></td>
														<td class="product-price"><span class="amount">$${map.value.productEntity.price}</span></td>
														<td class="product-quantity"><input type="number"
															min="1" value="${map.value.quantity}" max="10" /></td>
														<td class="product-subtotal">$${map.value.quantity *
															map.value.productEntity.price}</td>
													</c:when>
													<c:otherwise>
													<td class="product-name"><a href="#">${map.value.productEntity.name}</a>
															<ul class="pro__prize">
														<li class="old__prize old_price">$${map.value.productEntity.price}</li>
														<li class="sale_price">$${map.value.productEntity.sale}</li>
														</ul></td>
														<td class="product-price"><span class="amount">$${map.value.productEntity.sale}</span></td>
														<td class="product-quantity"><input type="number"
															min="1" value="${map.value.quantity}" max="10" /></td>
														<td class="product-subtotal">$${map.value.quantity *
															map.value.productEntity.sale}</td>
													</c:otherwise>
												</c:choose>
												<td class="product-remove"><a
													href="/cart/remove/${map.value.productEntity.id}"><i
														class="icon-trash icons"></i></a></td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${myCartItems.size()==0}">
										<br>
										<div class="alert alert-warning">There is no data</div>
									</c:if>
								</tbody>
							</table>
						</div>
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">
								<div class="buttons-cart--inner">
									<div class="buttons-cart">
										<a href="/user">Continue Shopping</a>
									</div>
									<div class="buttons-cart checkout--btn">
										<a href="#">update</a> <a href="/cart/checkoutforms">checkout</a>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-sm-12 col-xs-12">
								<div class="ht__coupon__code">
									<span>enter your discount code</span>
									<div class="coupon__box">
										<input type="text" placeholder="">
										<div class="ht__cp__btn">
											<a href="#">enter</a>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-sm-12 col-xs-12 smt-40 xmt-40">
								<div class="htc__cart__total">
									<h6>cart total</h6>
									<div class="cart__desk__list">
										<ul class="cart__desc">
											<li>cart total</li>
											<li>tax</li>
											<li>shipping</li>
										</ul>
										<ul class="cart__price">
											<li>$${sessionScope.myCartTotal}</li>
											<li>$${sessionScope.myCartTotal/10}</li>
											<li>0</li>
										</ul>
									</div>
									<div class="cart__total">
										<span>order total</span> <span>$${sessionScope.myCartTotal
											+ (sessionScope.myCartTotal/10)}</span>
									</div>
									<ul class="payment__btn">
										<li class="active"><a href="#">payment</a></li>
										<li><a href="/user">continue shopping</a></li>
									</ul>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- cart-main-area end -->

	<jsp:include page="footer-logout.jsp"></jsp:include>

	<!-- Placed js at the end of the document so the pages load faster -->

	<!-- jquery latest version -->
	<script src="/js/vendor/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap framework js -->
	<script src="/js/bootstrap.min.js"></script>
	<!-- All js plugins included in this file. -->
	<script src="/js/plugins.js"></script>
	<script src="/js/slick.min.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<!-- Waypoints.min.js. -->
	<script src="/js/waypoints.min.js"></script>
	<!-- Main js file that contents all jQuery plugins activation. -->
	<script src="/js/main.js"></script>

</body>

</html>