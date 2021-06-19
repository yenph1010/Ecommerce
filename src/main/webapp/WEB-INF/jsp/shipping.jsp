<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Shipping</title>
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
<script src="/js/vendor/modernizr-3.5.0.min.js"></script>
</head>

<body>
	<!-- Body main wrapper start -->
	<div class="wrapper">
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
										class="brd-separetor"><i
										class="zmdi zmdi-chevron-right"></i></span> <span
										class="breadcrumb-item active">checkout</span>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Bradcaump area -->
		<!-- cart-main-area start -->
		<div class="checkout-wrap ptb--100">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="checkout__inner">
							<div class="accordion-list">
								<div class="accordion">
									<div class="shipinfo">
										<h3 class="shipinfo__title">Congratulations! Your order
											is being processed.</h3>
										<p>
											<b>Receiver:</b> ${transactionEntity.transactionname}
										</p>
										<p>
											<b>Shipping Address:</b> ${transactionEntity.transactionaddress}
										</p>
										<p>
											<b>Contact Number:</b> ${transactionEntity.transactionphone}
										</p>
										<p>Please check our email sent to your email address ${transactionEntity.transactionmail}</p>

									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<div class="order-details">
							<h5 class="order-details__title">Your Order</h5>
							<div class="order-details__item">
								<c:forEach var="map" items="${sessionScope.myCartItems}">
									<div class="single-item">
										<div class="single-item__thumb">
											<img src="/images/product/${map.value.productEntity.images}"
												alt="ordered item">
										</div>
										<div class="single-item__content">
											<c:choose>
												<c:when test="${map.value.productEntity.sale== 0}">
													<a href="#">${map.value.productEntity.name}</a>
													<span class="price">$${map.value.productEntity.price}</span>
												</c:when>
												<c:otherwise>
													<a href="#">${map.value.productEntity.name}</a>
													<span class="price">$${map.value.productEntity.sale}</span>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="single-item__remove">
											<a href="#"><i class="zmdi zmdi-delete"></i></a>
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="order-details__count">
								<div class="order-details__count__single">
									<h5>sub total</h5>
									<span class="price">$${sessionScope.myCartTotal}</span>
								</div>
								<div class="order-details__count__single">
									<h5>Tax</h5>
									<span class="price">$${sessionScope.myCartTotal/10}</span>
								</div>
								<div class="order-details__count__single">
									<h5>Shipping</h5>
									<span class="price">0</span>
								</div>
							</div>
							<div class="ordre-details__total">
								<h5>Order total</h5>
								<span class="price">$${sessionScope.myCartTotal +
									(sessionScope.myCartTotal/10)}</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- cart-main-area end -->
		<jsp:include page="footer-logout.jsp"></jsp:include>

	</div>
	<!-- Body main wrapper end -->

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