<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>All Product</title>
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
<link rel="stylesheet" href="/cssstyle.css">
<!-- Responsive css -->
<link rel="stylesheet" href="/css/responsive.css">
<!-- User style -->
<link rel="stylesheet" href="/css/custom.css">


<!-- Modernizr JS -->
<script src="/js/vendor/modernizr-3.5.0.min.js"></script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Start Bradcaump area -->
	<div class="ht__bradcaump__area"
		style="background: rgba(0, 0, 0, 0) url(/images/product/cart_image.jpg) no-repeat scroll center center/cover;">
		<div class="ht__bradcaump__wrap">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="bradcaump__inner">
							<nav class="bradcaump-inner">
								<a class="breadcrumb-item" href="/">Home</a> <span
									class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
								<span class="breadcrumb-item active">Products</span>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Bradcaump area -->
	<!-- Start Product Grid -->
	<section class="htc__product__grid bg__white ptb--100">
		<div class="container">
			<div class="row">
				<div
					class="col-lg-9 col-lg-push-3 col-md-9 col-md-push-3 col-sm-12 col-xs-12">
					<div class="htc__product__rightidebar">
						<div class="htc__grid__top">
							<div class="htc__select__option">
								<select class="ht__select">
									<option>Default softing</option>
									<option>Sort by popularity</option>
									<option>Sort by average rating</option>
									<option>Sort by newness</option>
								</select> <select class="ht__select">
									<option>Show by</option>
									<option>Sort by popularity</option>
									<option>Sort by average rating</option>
									<option>Sort by newness</option>
								</select>
							</div>
							<div class="ht__pro__qun">
								<span>Showing 1-12 of 1033 products</span>
							</div>
							<!-- Start List And Grid View -->
							<ul class="view__mode" role="tablist">
								<li role="presentation" class="grid-view active"><a
									href="#grid-view" role="tab" data-toggle="tab"><i
										class="zmdi zmdi-grid"></i></a></li>
								<li role="presentation" class="list-view"><a
									href="#list-view" role="tab" data-toggle="tab"><i
										class="zmdi zmdi-view-list"></i></a></li>
							</ul>
							<!-- End List And Grid View -->
						</div>
						<!-- Start Product View -->
						<div class="row">
							<div class="shop__grid__view__wrap">
								<div role="tabpanel" id="grid-view"
									class="single-grid-view tab-pane fade in active clearfix">
									<c:if test="${not empty productList}">
										<c:forEach var="product" items="${productList}"
											varStatus="index">
											<!-- Start Single Product -->
											<div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
												<div class="category">
													<div class="ht__cat__thumb">
														<a href="/guestViewProduct/${product.id}"> <img
															src="images/product/${product.images}"
															alt="product images">
														</a>
													</div>
													<div class="fr__hover__info">
														<ul class="product__action">
															<li><a href="#"><i class="icon-heart icons"></i></a></li>

															<li><a href="/login"><i
																	class="icon-handbag icons"></i></a></li>

															<li><a href="#"><i class="icon-shuffle icons"></i></a></li>
														</ul>
													</div>
													<div class="fr__product__inner">
														<h4>
															<a href="/guestViewProduct/${product.id}">${product.name}</a>
														</h4>
														<ul class="fr__pro__prize">
															<c:choose>
																<c:when test="${product.sale== 0}">
																	<li class="old__prize">${product.price}</li>
																</c:when>
																<c:otherwise>
																	<li class="old__prize old_price">${product.price}</li>
																	<li class="sale_price">${product.sale}</li>
																</c:otherwise>
															</c:choose>

														</ul>
													</div>
												</div>
											</div>
											<!-- End Single Product -->
										</c:forEach>
									</c:if>
									<c:if test="${productList.size()==0}">
										<br>
										<div class="alert alert-warning">There is no data</div>
									</c:if>
								</div>
								<div role="tabpanel" id="list-view"
									class="single-grid-view tab-pane fade clearfix">
									<div class="col-xs-12">
										<div class="ht__list__wrap">
											<c:if test="${not empty productList}">
												<c:forEach var="product" items="${productList}"
													varStatus="index">
													<!-- Start List Product -->
													<div class="ht__list__product">
														<div class="ht__list__thumb">
															<a href="/viewProduct/${product.id}"><img
																src="/images/product/${product.images}"
																alt="product images"></a>
														</div>
														<div class="htc__list__details">
															<h2>
																<a href="/viewProduct/${product.id}">${product.name}
																</a>
															</h2>
															<ul class="pro__prize">
																<c:choose>
																	<c:when test="${product.sale== 0}">
																		<li class="old__prize">${product.price}</li>
																	</c:when>
																	<c:otherwise>
																		<li class="old__prize old_price">${product.price}</li>
																		<li class="sale_price">${product.sale}</li>
																	</c:otherwise>
																</c:choose>
															</ul>
															<ul class="rating">
																<li><i class="icon-star icons"></i></li>
																<li><i class="icon-star icons"></i></li>
																<li><i class="icon-star icons"></i></li>
																<li class="old"><i class="icon-star icons"></i></li>
																<li class="old"><i class="icon-star icons"></i></li>
															</ul>
															<p>Lorem ipsum dolor sit amet, consectetur
																adipisLorem ipsum dolor sit amet, consec adipisicing
																elit, sed do eiusmod tempor incididunt ut labore et
																dolore magna aliqul Ut enim ad minim veniam, quis
																nostrud exercitation ullamco laboris nisi ut aliquip ex
																ea commodo consequat.</p>
															<div class="fr__list__btn">
																<a class="fr__btn" href="/cart/addcart/${product.id}">Add
																	To Cart</a>
															</div>
														</div>
													</div>
													<!-- End List Product -->
												</c:forEach>
											</c:if>
											<c:if test="${productList.size()==0}">
												<br>
												<div class="alert alert-warning">There is no data</div>
											</c:if>

										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- End Product View -->
					</div>
					<!-- Start Pagination -->
					<div class="row">
						<div class="col-xs-12">
							<ul class="htc__pagenation">
								<li><a href="#"><i class="zmdi zmdi-chevron-left"></i></a></li>
								<li><a href="#">1</a></li>
								<li class="active"><a href="#">3</a></li>
								<li><a href="#">19</a></li>
								<li><a href="#"><i class="zmdi zmdi-chevron-right"></i></a></li>
							</ul>
						</div>
					</div>
					<!-- End Pagination -->
				</div>
				<div
					class="col-lg-3 col-lg-pull-9 col-md-3 col-md-pull-9 col-sm-12 col-xs-12 smt-40 xmt-40">
					<div class="htc__product__leftsidebar">
						<!-- Start Prize Range -->
						<div class="htc-grid-range">
							<h4 class="title__line--4">Price</h4>
							<div class="content-shopby">
								<div class="price_filter s-filter clear">
									<form action="#" method="GET">
										<div id="slider-range"></div>
										<div class="slider__range--output">
											<div class="price__output--wrap">
												<div class="price--output">
													<span>Price :</span><input type="text" id="amount" readonly>
												</div>
												<div class="price--filter">
													<a href="#">Filter</a>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- End Prize Range -->
						<!-- Start Category Area -->
						<div class="htc__category">
							<h4 class="title__line--4">categories</h4>
							<ul class="ht__cat__list">
								<li><a href="#">Clothing</a></li>
								<li><a href="#">Bags</a></li>
								<li><a href="#">Shoes</a></li>
								<li><a href="#">Jewelry</a></li>
								<li><a href="#">Accessories</a></li>
								<li><a href="#">Food / Drink Store</a></li>
								<li><a href="#">Gift Store</a></li>
								<li><a href="#">Accessories</a></li>
								<li><a href="#">Watch</a></li>
								<li><a href="#">Other</a></li>
							</ul>
						</div>
						<!-- End Category Area -->

						<!-- Start Pro Color -->
						<div class="ht__pro__color">
							<h4 class="title__line--4">color</h4>
							<ul class="ht__color__list">
								<li class="grey"><a href="#">grey</a></li>
								<li class="lamon"><a href="#">lamon</a></li>
								<li class="white"><a href="#">white</a></li>
								<li class="red"><a href="#">red</a></li>
								<li class="black"><a href="#">black</a></li>
								<li class="pink"><a href="#">pink</a></li>
							</ul>
						</div>
						<!-- End Pro Color -->
						<!-- Start Pro Size -->
						<div class="ht__pro__size">
							<h4 class="title__line--4">Size</h4>
							<ul class="ht__size__list">
								<li><a href="#">xs</a></li>
								<li><a href="#">s</a></li>
								<li><a href="#">m</a></li>
								<li><a href="#">reld</a></li>
								<li><a href="#">xl</a></li>
							</ul>
						</div>
						<!-- End Pro Size -->
						<!-- Start Tag Area -->
						<div class="htc__tag">
							<h4 class="title__line--4">tags</h4>
							<ul class="ht__tag__list">
								<li><a href="#">Clothing</a></li>
								<li><a href="#">bag</a></li>
								<li><a href="#">Shoes</a></li>
								<li><a href="#">Jewelry</a></li>
								<li><a href="#">Food</a></li>
								<li><a href="#">Aceessories</a></li>
								<li><a href="#">Store</a></li>
								<li><a href="#">Watch</a></li>
								<li><a href="#">Other</a></li>
							</ul>
						</div>
						<!-- End Tag Area -->
						<!-- Start Compare Area -->
						<div class="htc__compare__area">
							<h4 class="title__line--4">compare</h4>
							<ul class="htc__compare__list">
								<li><a href="#">White menâs polo<i
										class="icon-trash icons"></i></a></li>
								<li><a href="#">T-shirt for style girl...<i
										class="icon-trash icons"></i></a></li>
								<li><a href="#">Basic dress for women...<i
										class="icon-trash icons"></i></a></li>
							</ul>
							<ul class="ht__com__btn">
								<li><a href="#">clear all</a></li>
								<li class="compare"><a href="#">Compare</a></li>
							</ul>
						</div>
						<!-- End Compare Area -->
						<!-- Start Best Sell Area -->
						<div class="htc__recent__product">
							<h2 class="title__line--4">best seller</h2>
							<div class="htc__recent__product__inner">
								<!-- Start Single Product -->
								<div class="htc__best__product">
									<div class="htc__best__pro__thumb">
										<a href="product-details.html"> <img
											src="images/product-2/sm-smg/1.jpg" alt="small product">
										</a>
									</div>
									<div class="htc__best__product__details">
										<h2>
											<a href="product-details.html">Product Title Here</a>
										</h2>
										<ul class="rating">
											<li><i class="icon-star icons"></i></li>
											<li><i class="icon-star icons"></i></li>
											<li><i class="icon-star icons"></i></li>
											<li class="old"><i class="icon-star icons"></i></li>
											<li class="old"><i class="icon-star icons"></i></li>
										</ul>
										<ul class="pro__prize">
											<li class="old__prize">$82.5</li>
											<li>$75.2</li>
										</ul>
									</div>
								</div>
								<!-- End Single Product -->
								<!-- Start Single Product -->
								<div class="htc__best__product">
									<div class="htc__best__pro__thumb">
										<a href="product-details.html"> <img
											src="images/product-2/sm-smg/2.jpg" alt="small product">
										</a>
									</div>
									<div class="htc__best__product__details">
										<h2>
											<a href="product-details.html">Product Title Here</a>
										</h2>
										<ul class="rating">
											<li><i class="icon-star icons"></i></li>
											<li><i class="icon-star icons"></i></li>
											<li><i class="icon-star icons"></i></li>
											<li class="old"><i class="icon-star icons"></i></li>
											<li class="old"><i class="icon-star icons"></i></li>
										</ul>
										<ul class="pro__prize">
											<li class="old__prize">$82.5</li>
											<li>$75.2</li>
										</ul>
									</div>
								</div>
								<!-- End Single Product -->
								<!-- Start Single Product -->
								<div class="htc__best__product">
									<div class="htc__best__pro__thumb">
										<a href="product-details.html"> <img
											src="images/product-2/sm-smg/1.jpg" alt="small product">
										</a>
									</div>
									<div class="htc__best__product__details">
										<h2>
											<a href="product-details.html">Product Title Here</a>
										</h2>
										<ul class="rating">
											<li><i class="icon-star icons"></i></li>
											<li><i class="icon-star icons"></i></li>
											<li><i class="icon-star icons"></i></li>
											<li class="old"><i class="icon-star icons"></i></li>
											<li class="old"><i class="icon-star icons"></i></li>
										</ul>
										<ul class="pro__prize">
											<li class="old__prize">$82.5</li>
											<li>$75.2</li>
										</ul>
									</div>
								</div>
								<!-- End Single Product -->
							</div>
						</div>
						<!-- End Best Sell Area -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Product Grid -->

	<jsp:include page="footer.jsp"></jsp:include>
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