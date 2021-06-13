<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>InHouse</title>
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
<div class="wrapper">
	<!-- Body main wrapper start -->
		<!-- Start Header Style -->
		<header id="htc__header" class="htc__header__area header--one">
			<!-- Start Mainmenu Area -->
			<div id="sticky-header-with-topbar"
				class="mainmenu__wrap sticky__header">
				<div class="container">
					<div class="row">
						<div class="menumenu__container clearfix">
							<div class="col-lg-2 col-md-2 col-sm-3 col-xs-5">
								<div class="logo">
									<a href="/user"><img src="/images/logo/4.png" alt="logo images"></a>
								</div>
							</div>
							<div class="col-md-7 col-lg-8 col-sm-5 col-xs-3">
								<nav class="main__menu__nav hidden-xs hidden-sm">
									<ul class="main__menu">
										<li class="drop"><a href="/user">Home</a></li>
										<li class="drop"><a href="#">Product</a>
											<ul class="dropdown">
												<li><a href="product-grid.html">Table</a></li>
												<li><a href="product-details.html">Chair</a></li>
												<li><a href="product-details.html">Bed</a></li>
												<li><a href="product-details.html">Others</a></li>
											</ul></li>
										<li class="drop"><a href="blog.html">blog</a>
											<ul class="dropdown">
												<li><a href="blog.html">Blog Grid</a></li>
												<li><a href="blog-details.html">Blog Details</a></li>
											</ul></li>
										<li class="drop"><a href="#">Pages</a>
											<ul class="dropdown">
												<li><a href="blog.html">Blog</a></li>
												<li><a href="blog-details.html">Blog Details</a></li>
												<li><a href="/cart">Cart page</a></li>
												<li><a href="checkout.html">checkout</a></li>
												<li><a href="contact.html">contact</a></li>
												<li><a href="/viewAllProducts">product grid</a></li>
												<li><a href="product-details.html">product details</a></li>
												<li><a href="wishlist.html">wishlist</a></li>
											</ul></li>
										<li><a href="/logout">logout</a></li>
									</ul>
								</nav>

								<div class="mobile-menu clearfix visible-xs visible-sm">
									<nav id="mobile_dropdown">
										<ul>
											<li><a href="/user">Home</a></li>
											<li><a href="blog.html">blog</a></li>
											<li><a href="#">pages</a>
												<ul>
													<li><a href="blog.html">Blog</a></li>
													<li><a href="blog-details.html">Blog Details</a></li>
													<li><a href="cart.html">Cart page</a></li>
													<li><a href="/cart">checkout</a></li>
													<li><a href="contact.html">contact</a></li>
													<li><a href="product-grid.html">product grid</a></li>
													<li><a href="product-details.html">product details</a></li>
													<li><a href="wishlist.html">wishlist</a></li>
												</ul></li>
											<li><a href="contact.html">contact</a></li>
										</ul>
									</nav>
								</div>
							</div>
							<div class="col-md-3 col-lg-2 col-sm-4 col-xs-4">
								<div class="header__right">
									<div class="header__search search search__open">
										<a href="#"><i class="icon-magnifier icons"></i></a>
									</div>
									<div class="header__account">
										<a href="#"><i class="icon-user icons"></i></a>
									</div>
									<div class="htc__shopping__cart">
										<a class="cart__menu" href="/cart"><i
											class="icon-handbag icons"></i></a> <a href="/cart"><span
											class="htc__qua">${sessionScope.myCartNum}</span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="mobile-menu-area"></div>
				</div>
			</div>
			<!-- End Mainmenu Area -->
		</header>
		<!-- End Header Area --
        </header>
        <div class="body__overlay"></div>
		<!-- Start Offset Wrapper -->
		<div class="offset__wrapper">
			<!-- Start Search Popap -->
			<div class="search__area">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="search__inner">
								<form:form action="/search" method="get">
									<input name="searchInput" placeholder="Search here... "
										type="text">
									<button type="submit"></button>
								</form:form>
								<div class="search__close__btn">
									<span class="search__close__btn_icon"><i
										class="zmdi zmdi-close"></i></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Search Popap -->
			<!-- Start Cart Panel -->
			<div class="shopping__cart">
				<div class="shopping__cart__inner">
					<div class="offsetmenu__close__btn">
						<a href="#"><i class="zmdi zmdi-close"></i></a>
					</div>
					<div class="shp__cart__wrap">
						<c:if test="${not empty myCartItems}">
							<c:forEach var="map" items="${sessionScope.myCartItems}">
								<div class="shp__single__product">
									<div class="shp__pro__thumb">
										<a href="#"> <img
											src="/images/product/${map.value.productEntity.images}"
											alt="product images">
										</a>
									</div>
									<div class="shp__pro__details">
										<h2>
											<a href="product-details.html">${map.value.productEntity.name}</a>
										</h2>
										<span class="quantity">${map.value.quantity}</span> <span
											class="shp__price">${map.value.productEntity.price}</span>
									</div>
									<div class="remove__btn">
										<a href="/cart/remove/${map.value.productEntity.id}"
											title="Remove this item"><i class="zmdi zmdi-close"></i></a>
									</div>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${myCartItems.size()==0}">
							<br>
							<div class="alert alert-warning">There is no data</div>
						</c:if>
					</div>
					<ul class="shoping__total">
						<li class="subtotal">Subtotal:</li>
						<li class="total__price">$${sessionScope.myCartTotal}</li>
					</ul>
					<ul class="shopping__btn">
						<li><a href="/cart">View Cart</a></li>
						<li class="shp__checkout"><a href="cart/checkout">Checkout</a></li>
					</ul>
				</div>
			</div>
			<!-- End Cart Panel -->
		</div>
		</div>
		<!-- End Offset Wrapper -->
		<!-- End Header Area -->
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