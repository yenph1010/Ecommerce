<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Error</title>
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
	<jsp:include page="header.jsp"></jsp:include>

	<div class="p-2 container">
		<div class="checkout-method__login">
			<div class="col-md-4 col-sm-4 col-xs-12 col-lg-4"></div>
			<div class="col-lg-4 col-sm-4 col-xs-12 col-md-4">
				<div style="text-align: center">
					<br>
					<br>
					<h5>There is something wrong.</h5>
					<h5>Please try again!</h5>
					<br>
					<br>
				</div>
				
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
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