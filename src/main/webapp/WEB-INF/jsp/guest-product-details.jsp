<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Product Details</title>
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
<link rel="stylesheet" href="/style.css">
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
								<a class="breadcrumb-item" href="/guestViewAllProducts">Products</a>
								<span class="brd-separetor"><i
									class="zmdi zmdi-chevron-right"></i></span> <span
									class="breadcrumb-item active">Product Details</span>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Bradcaump area -->
	<!-- Start Product Details Area -->
	<section class="htc__product__details bg__white ptb--100">
		<!-- Start Product Details Top -->
		<div class="htc__product__details__top">
			<div class="container">
				<div class="row">
					<div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
						<div class="htc__product__details__tab__content">
							<!-- Start Product Big Images -->
							<div class="product__big__images">
								<div class="portfolio-full-image tab-content">
									<div role="tabpanel" class="tab-pane fade in active"
										id="img-tab-1">
										<img src="/images/product/${product.images}" alt="full-image">
									</div>
									<div role="tabpanel" class="tab-pane fade" id="img-tab-2">
										<img src="images/product-2/big-img/2.jpg" alt="full-image">
									</div>
									<div role="tabpanel" class="tab-pane fade" id="img-tab-3">
										<img src="images/product-2/big-img/3.jpg" alt="full-image">
									</div>
								</div>
							</div>
							<!-- End Product Big Images -->

						</div>
					</div>
					<div class="col-md-7 col-lg-7 col-sm-12 col-xs-12 smt-40 xmt-40">
						<div class="ht__product__dtl">
							<h2>${product.name}</h2>
							<h6>
								Model: <span>MNG001</span>
							</h6>
							<ul class="rating">
								<li><i class="icon-star icons"></i></li>
								<li><i class="icon-star icons"></i></li>
								<li><i class="icon-star icons"></i></li>
								<li class="old"><i class="icon-star icons"></i></li>
								<li class="old"><i class="icon-star icons"></i></li>
							</ul>
							<ul class="pro__prize">
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
							<p class="pro__info">Lorem ipsum dolor sit amet, consectetuer
								adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
								laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad
								minim veniam, quis nostrud exerci tation ullamcorper suscipit
								lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel
								eum iriure dolor in hendrerit in vulputate velit esse molestie
								consequat, vel illum dolore eu feugiat nulla facilisis at vero
								eros et accumsan</p>
							<div class="ht__pro__desc">
								<div class="sin__desc">
									<p>
										<span>Availability:</span> In Stock
									</p>
								</div>
								<div class="sin__desc align--left">
									<p>
										<span>color:</span>
									</p>
									<ul class="pro__color">
										<li class="red"><a href="#">red</a></li>
										<li class="green"><a href="#">green</a></li>
										<li class="balck"><a href="#">balck</a></li>
									</ul>
									<div class="pro__more__btn">
										<a href="#">more</a>
									</div>
								</div>
								<div class="sin__desc align--left">
									<p>
										<span>size</span>
									</p>
									<select class="select__size">
										<option>s</option>
										<option>l</option>
										<option>xs</option>
										<option>xl</option>
										<option>m</option>
										<option>s</option>
									</select>
								</div>
								<div class="sin__desc align--left">
									<p>
										<span>Categories:</span>
									</p>
									<ul class="pro__cat__list">
										<li><a href="#">Fashion,</a></li>
										<li><a href="#">Accessories,</a></li>
										<li><a href="#">Women,</a></li>
										<li><a href="#">Men,</a></li>
										<li><a href="#">Kid,</a></li>
										<li><a href="#">Mobile,</a></li>
										<li><a href="#">Computer,</a></li>
										<li><a href="#">Hair,</a></li>
										<li><a href="#">Clothing,</a></li>
									</ul>
								</div>
								<div class="sin__desc align--left">
									<p>
										<span>Product tags:</span>
									</p>
									<ul class="pro__cat__list">
										<li><a href="#">Fashion,</a></li>
										<li><a href="#">Accessories,</a></li>
										<li><a href="#">Women,</a></li>
										<li><a href="#">Men,</a></li>
										<li><a href="#">Kid,</a></li>
									</ul>
								</div>

								<div class="sin__desc product__share__link">
									<p>
										<span>Share this:</span>
									</p>
									<ul class="pro__share">
										<li><a href="#" target="_blank"><i
												class="icon-social-twitter icons"></i></a></li>

										<li><a href="#" target="_blank"><i
												class="icon-social-instagram icons"></i></a></li>

										<li><a
											href="https://www.facebook.com/Furny/?ref=bookmarks"
											target="_blank"><i class="icon-social-facebook icons"></i></a></li>

										<li><a href="#" target="_blank"><i
												class="icon-social-google icons"></i></a></li>

										<li><a href="#" target="_blank"><i
												class="icon-social-linkedin icons"></i></a></li>

										<li><a href="#" target="_blank"><i
												class="icon-social-pinterest icons"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Product Details Top -->
	</section>
	<!-- End Product Details Area -->
	<!-- Start Product Description -->
	<section class="htc__produc__decription bg__white">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<!-- Start List And Grid View -->
					<ul class="pro__details__tab" role="tablist">
						<li role="presentation" class="description active"><a
							href="#description" role="tab" data-toggle="tab">description</a></li>
						<li role="presentation" class="review"><a href="#review"
							role="tab" data-toggle="tab">review</a></li>
						<li role="presentation" class="shipping"><a href="#shipping"
							role="tab" data-toggle="tab">shipping</a></li>
					</ul>
					<!-- End List And Grid View -->
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<div class="ht__pro__details__content">
						<!-- Start Single Content -->
						<div role="tabpanel" id="description"
							class="pro__single__content tab-pane fade in active">
							<div class="pro__tab__content__inner">
								<p>Formfitting clothing is all about a sweet spot. That
									elusive place where an item is tight but not clingy, sexy but
									not cloying, cool but not over the top. Alexandra Alvarezâs
									label, Alix, hits that mark with its range of comfortable,
									minimal, and neutral-hued bodysuits.</p>
								<h4 class="ht__pro__title">Description</h4>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
									sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
									aliquam erat volutpat. Ut wisi enim ad minim veniam, quis
									nostrud exerci tation ullamcorper suscipit lobortis nisl ut
									aliquip ex ea commodo consequat. Duis autem vel eum iriure
									dolor in hendrerit in vulputate velit esse molestie consequat,
									vel illum dolore eu feugiat nulla facilisis at vero eros et
									accumsan et iusto odio dignissim qui blandit praesent luptatum
									zzril delenit augue duis dolore te feugait nulla facilisi. Nam
									liber tempor cum soluta nobis eleifend option congue nihil
									imperdiet doming id quod mazim placerat facer possim assum.
									Typi non habent claritatem insitam; est usus legentis in iis
									qui facit eorum claritatem</p>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
									sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
									aliquam erat volutpat. Duis autem vel eum iriure dolor in
									hendrerit in vulputate velit esse molestie consequat, vel illum
									dolore eu feugiat nulla facilisis at vero eros et accumsan et
									iusto odio dignissim qui blandit praesent luptatum zzril
									delenit augue duis dolore te feugait nulla facilisi.</p>
								<h4 class="ht__pro__title">Standard Featured</h4>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
									sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
									aliquam erat volutpat. Ut wisi enim ad minim veniam, quis
									nostrud exerci tation ullamcorper suscipit lobortis nisl ut
									aliquip ex ea commodo consequat. Duis autem vel eum iriure
									dolor in hendrerit in vulputate velit esse molestie consequat,
									vel illum dolore eu feugiat nulla facilisis at vero eros et
									accumsan et iusto odio dignissim qui blandit praesent luptatum
									zzril delenit augue duis dolore te feugait nulla facilisi. Nam
									liber tempor cum soluta nobis eleifend option congue nihil
									imperdiet doming id quod mazim placerat facer possim assum.
									Typi non habent claritatem insitam; est usus legentis in</p>
							</div>
						</div>
						<!-- End Single Content -->
						<!-- Start Single Content -->
						<div role="tabpanel" id="review"
							class="pro__single__content tab-pane fade">
							<div class="pro__tab__content__inner">
								<p>Formfitting clothing is all about a sweet spot. That
									elusive place where an item is tight but not clingy, sexy but
									not cloying, cool but not over the top. Alexandra Alvarezâs
									label, Alix, hits that mark with its range of comfortable,
									minimal, and neutral-hued bodysuits.</p>
								<h4 class="ht__pro__title">Description</h4>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
									sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
									aliquam erat volutpat. Ut wisi enim ad minim veniam, quis
									nostrud exerci tation ullamcorper suscipit lobortis nisl ut
									aliquip ex ea commodo consequat. Duis autem vel eum iriure
									dolor in hendrerit in vulputate velit esse molestie consequat,
									vel illum dolore eu feugiat nulla facilisis at vero eros et
									accumsan et iusto odio dignissim qui blandit praesent luptatum
									zzril delenit augue duis dolore te feugait nulla facilisi. Nam
									liber tempor cum soluta nobis eleifend option congue nihil
									imperdiet doming id quod mazim placerat facer possim assum.
									Typi non habent claritatem insitam; est usus legentis in iis
									qui facit eorum claritatem</p>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
									sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
									aliquam erat volutpat. Duis autem vel eum iriure dolor in
									hendrerit in vulputate velit esse molestie consequat, vel illum
									dolore eu feugiat nulla facilisis at vero eros et accumsan et
									iusto odio dignissim qui blandit praesent luptatum zzril
									delenit augue duis dolore te feugait nulla facilisi.</p>
								<h4 class="ht__pro__title">Standard Featured</h4>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
									sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
									aliquam erat volutpat. Ut wisi enim ad minim veniam, quis
									nostrud exerci tation ullamcorper suscipit lobortis nisl ut
									aliquip ex ea commodo consequat. Duis autem vel eum iriure
									dolor in hendrerit in vulputate velit esse molestie consequat,
									vel illum dolore eu feugiat nulla facilisis at vero eros et
									accumsan et iusto odio dignissim qui blandit praesent luptatum
									zzril delenit augue duis dolore te feugait nulla facilisi. Nam
									liber tempor cum soluta nobis eleifend option congue nihil
									imperdiet doming id quod mazim placerat facer possim assum.
									Typi non habent claritatem insitam; est usus legentis in iis
									qui facit eorum claritatem</p>
							</div>
						</div>
						<!-- End Single Content -->
						<!-- Start Single Content -->
						<div role="tabpanel" id="shipping"
							class="pro__single__content tab-pane fade">
							<div class="pro__tab__content__inner">
								<p>Formfitting clothing is all about a sweet spot. That
									elusive place where an item is tight but not clingy, sexy but
									not cloying, cool but not over the top. Alexandra Alvarezâs
									label, Alix, hits that mark with its range of comfortable,
									minimal, and neutral-hued bodysuits.</p>
								<h4 class="ht__pro__title">Description</h4>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
									sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
									aliquam erat volutpat. Ut wisi enim ad minim veniam, quis
									nostrud exerci tation ullamcorper suscipit lobortis nisl ut
									aliquip ex ea commodo consequat. Duis autem vel eum iriure
									dolor in hendrerit in vulputate velit esse molestie consequat,
									vel illum dolore eu feugiat nulla facilisis at vero eros et
									accumsan et iusto odio dignissim qui blandit praesent luptatum
									zzril delenit augue duis dolore te feugait nulla facilisi. Nam
									liber tempor cum soluta nobis eleifend option congue nihil
									imperdiet doming id quod mazim placerat facer possim assum.
									Typi non habent claritatem insitam; est usus legentis in iis
									qui facit eorum claritatem</p>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
									sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
									aliquam erat volutpat. Duis autem vel eum iriure dolor in
									hendrerit in vulputate velit esse molestie consequat, vel illum
									dolore eu feugiat nulla facilisis at vero eros et accumsan et
									iusto odio dignissim qui blandit praesent luptatum zzril
									delenit augue duis dolore te feugait nulla facilisi.</p>
								<h4 class="ht__pro__title">Standard Featured</h4>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
									sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
									aliquam erat volutpat. Ut wisi enim ad minim veniam, quis
									nostrud exerci tation ullamcorper suscipit lobortis nisl ut
									aliquip ex ea commodo consequat. Duis autem vel eum iriure
									dolor in hendrerit in vulputate velit esse molestie consequat,
									vel illum dolore eu feugiat nulla facilisis at vero eros et
									accumsan et iusto odio dignissim qui blandit praesent luptatum
									zzril delenit augue duis dolore te feugait nulla facilisi. Nam
									liber tempor cum soluta nobis eleifend option congue nihil
									imperdiet doming id quod mazim placerat facer possim assum.
									Typi non habent claritatem insitam; est usus legentis in iis
									qui facit eorum claritatem</p>
							</div>
						</div>
						<!-- End Single Content -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Product Description -->
	<!-- Start Product Area -->
	<section class="htc__product__area--2 pb--100 product-details-res">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="section__title--2 text-center">
						<h2 class="title__line">New Arrivals</h2>
						<p>But I must explain to you how all this mistaken idea</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="product__wrap clearfix">
					<!-- Start Single Product -->
					<div class="col-md-3 col-lg-3 col-sm-6 col-xs-12">
						<div class="category">
							<div class="ht__cat__thumb">
								<a href="product-details.html"> <img
									src="images/product/1.jpg" alt="product images">
								</a>
							</div>
							<div class="fr__hover__info">
								<ul class="product__action">
									<li><a href="wishlist.html"><i
											class="icon-heart icons"></i></a></li>

									<li><a href="cart.html"><i class="icon-handbag icons"></i></a></li>

									<li><a href="#"><i class="icon-shuffle icons"></i></a></li>
								</ul>
							</div>
							<div class="fr__product__inner">
								<h4>
									<a href="product-details.html">Product Title Here </a>
								</h4>
								<ul class="fr__pro__prize">
									<li class="old__prize">$30.3</li>
									<li>$25.9</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- End Single Product -->
					<!-- Start Single Product -->
					<div class="col-md-3 col-lg-3 col-sm-6 col-xs-12">
						<div class="category">
							<div class="ht__cat__thumb">
								<a href="product-details.html"> <img
									src="images/product/2.jpg" alt="product images">
								</a>
							</div>
							<div class="fr__hover__info">
								<ul class="product__action">
									<li><a href="wishlist.html"><i
											class="icon-heart icons"></i></a></li>

									<li><a href="cart.html"><i class="icon-handbag icons"></i></a></li>

									<li><a href="#"><i class="icon-shuffle icons"></i></a></li>
								</ul>
							</div>
							<div class="fr__product__inner">
								<h4>
									<a href="product-details.html">Product Title Here </a>
								</h4>
								<ul class="fr__pro__prize">
									<li class="old__prize">$30.3</li>
									<li>$25.9</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- End Single Product -->
					<!-- Start Single Product -->
					<div class="col-md-3 col-lg-3 col-sm-6 col-xs-12">
						<div class="category">
							<div class="ht__cat__thumb">
								<a href="product-details.html"> <img
									src="images/product/3.jpg" alt="product images">
								</a>
							</div>
							<div class="fr__hover__info">
								<ul class="product__action">
									<li><a href="wishlist.html"><i
											class="icon-heart icons"></i></a></li>

									<li><a href="cart.html"><i class="icon-handbag icons"></i></a></li>

									<li><a href="#"><i class="icon-shuffle icons"></i></a></li>
								</ul>
							</div>
							<div class="fr__product__inner">
								<h4>
									<a href="product-details.html">Product Title Here </a>
								</h4>
								<ul class="fr__pro__prize">
									<li class="old__prize">$30.3</li>
									<li>$25.9</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- End Single Product -->
					<!-- Start Single Product -->
					<div class="col-md-3 col-lg-3 col-sm-6 col-xs-12">
						<div class="category">
							<div class="ht__cat__thumb">
								<a href="product-details.html"> <img
									src="images/product/4.jpg" alt="product images">
								</a>
							</div>
							<div class="fr__hover__info">
								<ul class="product__action">
									<li><a href="wishlist.html"><i
											class="icon-heart icons"></i></a></li>

									<li><a href="cart.html"><i class="icon-handbag icons"></i></a></li>

									<li><a href="#"><i class="icon-shuffle icons"></i></a></li>
								</ul>
							</div>
							<div class="fr__product__inner">
								<h4>
									<a href="product-details.html">Product Title Here </a>
								</h4>
								<ul class="fr__pro__prize">
									<li class="old__prize">$30.3</li>
									<li>$25.9</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- End Single Product -->
				</div>
			</div>
		</div>
	</section>
	<!-- End Product Area -->
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