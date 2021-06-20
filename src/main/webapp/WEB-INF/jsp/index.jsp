<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Furniture Website</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Place favicon.ico in the root directory -->
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico">
<link rel="apple-touch-icon" href="/apple-touch-icon.png">


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

	<jsp:include page="header.jsp"></jsp:include>
	<!-- Start Slider Area -->
	<div class="slider__container slider--one bg__cat--3">
		<div class="slide__container slider__activation__wrap owl-carousel">
			<!-- Start Single Slide -->
			<div class="single__slide animation__style01 slider__fixed--height">
				<div class="container">
					<div class="row align-items__center">
						<div class="col-md-7 col-sm-7 col-xs-12 col-lg-6">
							<div class="slide">
								<div class="slider__inner">
									<h2>collection 2021</h2>
									<h1>NICE CHAIR</h1>
									<div class="cr__btn">
										<a href="/login">Shop Now</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-sm-5 col-xs-12 col-md-5">
							<div class="slide__thumb">
								<img
									src="/images/slider/fornt-img/catina-fabric-chair-dining-indoor-1-624x468.jpg"
									alt="slider images">
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Single Slide -->
			<!-- Start Single Slide -->
			<div class="single__slide animation__style01 slider__fixed--height">
				<div class="container">
					<div class="row align-items__center">
						<div class="col-md-7 col-sm-7 col-xs-12 col-lg-6">
							<div class="slide">
								<div class="slider__inner">
									<h2>collection 2021</h2>
									<h1>NICE CHAIR</h1>
									<div class="cr__btn">
										<a href="/login">Shop Now</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-sm-5 col-xs-12 col-md-5">
							<div class="slide__thumb">
								<img src="images/slider/fornt-img/2.png" alt="slider images">
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Single Slide -->
		</div>
	</div>
	<!-- Start Slider Area -->
	<!-- Start Category Area -->
	<section class="htc__category__area ptb--100">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="section__title--2 text-center">
						<h2 class="title__line">Our Products</h2>
						<p>Check the best designed furniture here</p>
					</div>
				</div>
			</div>
			<div class="htc__product__container">
				<div class="row">
					<div class="product__list clearfix mt--30">
						<c:if test="${not empty productList}">
							<c:forEach var="product" items="${productList}" varStatus="index">
								<!-- Start Single Category -->
								<div class="col-md-4 col-lg-4 col-sm-4 col-xs-12">
									<div class="category">
										<div class="ht__cat__thumb">
											<a href="/guestViewProduct/${product.id}"> <img
												src="images/product/${product.images}" alt="product images">
											</a>
										</div>
										<div class="fr__hover__info">
											<ul class="product__action">
												<li><a href="#"><i class="icon-heart icons"></i></a></li>

												<li><a href="/login"><i class="icon-handbag icons"></i></a></li>

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
														<li class="old__prize">$${product.price}</li>
													</c:when>
													<c:otherwise>
														<li class="old__prize old_price">$${product.price}</li>
														<li class="sale_price">$${product.sale}</li>
													</c:otherwise>
												</c:choose>
											</ul>
										</div>
									</div>
								</div>
								<!-- End Single Category -->
							</c:forEach>
							<!-- Start Pagination -->
					<div class="row">
						<div class="col-xs-12">
							<ul class="htc__pagenation">
								<c:choose>
									<c:when test="${currentPage > 1}">
										<li><a href="/guestpage/1">First</a></li>
										<li><a href="/guestpage/${currentPage - 1}">Pre</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="#">First</a></li>
										<li><a href="#">Pre</a></li>
									</c:otherwise>
								</c:choose>
								<c:forEach var="i" begin="1" end="${totalPages}"
									varStatus="index">
									<c:choose>
										<c:when test="${currentPage != i}">
											<li><a href="/guestpage/${i}">${i}</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="#">${i}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${currentPage < totalPages}">
										<li><a href="/guestpage/${currentPage + 1}}">Next</a></li>
										<li><a href="/guestpage/${totalPages}">Last</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="#">Next</a></li>
										<li><a href="#">Last</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
					<!-- End Pagination -->
						</c:if>
						<c:if test="${productList.size()==0}">
							<br>
							<div class="alert alert-warning">There is no data</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Category Area -->
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