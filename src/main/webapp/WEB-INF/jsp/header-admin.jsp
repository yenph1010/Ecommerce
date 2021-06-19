<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Admin Page</title>
<link href="/css/styles.css" rel="stylesheet">
<link href="/css/admin-style.css" rel="stylesheet">

<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-light bg-clr">
		<a class="navbar-brand logo-brand" href="/admin">Admin Page</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<a href="/admin" class="frnt-link"><i class="fas fa-external-link-alt"></i>Home</a>
		<ul class="navbar-nav ml-auto mr-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="userDropdown" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item admin-dropdown-item"
						href="#">Edit Profile</a> <a
						class="dropdown-item admin-dropdown-item"
						href="#">Change Password</a> <a
						class="dropdown-item admin-dropdown-item" href="/logout">Logout</a>
				</div></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<a class="nav-link" href="/admin">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Dashboard
						</a> 
						<a class="nav-link active collapsed" href="#"
							data-toggle="collapse" data-target="#collapseProducts"
							aria-expanded="false" aria-controls="collapseProducts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-box"></i>
							</div> Products
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseProducts"
							aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link sub_nav_link active" href="/productsadmin">All
									Products</a> <a class="nav-link sub_nav_link"
									href="/addProduct">Add Product</a>
							</nav>
						</div>
						<a class="nav-link" href="/orders">
							<div class="sb-nav-link-icon">
								<i class="fas fa-cart-arrow-down"></i>
							</div> Orders
						</a> <a class="nav-link" href="/customer">
							<div class="sb-nav-link-icon">
								<i class="fas fa-users"></i>
							</div> Users
						</a> 
					</div>
				</div>
			</nav>
		</div>
	<script src="/js/jquery-3.4.1.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/js/scripts.js"></script>
</body>
</html>