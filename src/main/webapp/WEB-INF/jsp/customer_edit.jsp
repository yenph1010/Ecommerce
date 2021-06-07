<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description-gambolthemes" content="">
<meta name="author-gambolthemes" content="">
<title>Admin</title>
<link href="css/styles.css" rel="stylesheet">
<link href="css/admin-style.css" rel="stylesheet">

<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-light bg-clr">
		<a class="navbar-brand logo-brand" href="admin">Admin Page</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<a
			href="https://gambolthemes.net/html-items/gambo_supermarket_demo/index.html"
			class="frnt-link"><i class="fas fa-external-link-alt"></i>Home</a>
		<ul class="navbar-nav ml-auto mr-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="userDropdown" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item admin-dropdown-item"
						href="edit_profile.html">Edit Profile</a> <a
						class="dropdown-item admin-dropdown-item"
						href="change_password.html">Change Password</a> <a
						class="dropdown-item admin-dropdown-item" href="login.html">Logout</a>
				</div></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<a class="nav-link" href="index.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Dashboard
						</a> <a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-newspaper"></i>
							</div> Posts
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link sub_nav_link" href="posts.html">All Posts</a>
								<a class="nav-link sub_nav_link" href="add_post.html">Add
									New</a> <a class="nav-link sub_nav_link"
									href="post_categories.html">Categories</a> <a
									class="nav-link sub_nav_link" href="post_tags.html">Tags</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapseLocations" aria-expanded="false"
							aria-controls="collapseLocations">
							<div class="sb-nav-link-icon">
								<i class="fas fa-map-marker-alt"></i>
							</div> Locations
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLocations"
							aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link sub_nav_link" href="locations.html">All
									Locations</a> <a class="nav-link sub_nav_link"
									href="add_location.html">Add Location</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapseAreas" aria-expanded="false"
							aria-controls="collapseAreas">
							<div class="sb-nav-link-icon">
								<i class="fas fa-map-marked-alt"></i>
							</div> Areas
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseAreas"
							aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link sub_nav_link" href="areas.html">All Areas</a>
								<a class="nav-link sub_nav_link" href="add_area.html">Add
									Area</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapseCategories" aria-expanded="false"
							aria-controls="collapseCategories">
							<div class="sb-nav-link-icon">
								<i class="fas fa-list"></i>
							</div> Categories
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseCategories"
							aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link sub_nav_link" href="category.html">All
									Categories</a> <a class="nav-link sub_nav_link"
									href="add_category.html">Add Category</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapseShops" aria-expanded="false"
							aria-controls="collapseShops">
							<div class="sb-nav-link-icon">
								<i class="fas fa-store"></i>
							</div> Shops
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseShops"
							aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link sub_nav_link" href="shops.html">All Shops</a>
								<a class="nav-link sub_nav_link" href="add_shop.html">Add
									Shop</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapseProducts" aria-expanded="false"
							aria-controls="collapseProducts">
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
								<a class="nav-link sub_nav_link" href="products.html">All
									Products</a> <a class="nav-link sub_nav_link"
									href="add_product.html">Add Product</a>
							</nav>
						</div>
						<a class="nav-link" href="orders.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-cart-arrow-down"></i>
							</div> Orders
						</a> <a class="nav-link active" href="customer">
							<div class="sb-nav-link-icon">
								<i class="fas fa-users"></i>
							</div> Customers
						</a> <a class="nav-link" href="offers.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-gift"></i>
							</div> Offers
						</a> <a class="nav-link" href="pages.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> Pages
						</a> <a class="nav-link" href="menu.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-layer-group"></i>
							</div> Menu
						</a> <a class="nav-link" href="updater.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-cloud-upload-alt"></i>
							</div> Updater
						</a> <a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapseSettings" aria-expanded="false"
							aria-controls="collapseSettings">
							<div class="sb-nav-link-icon">
								<i class="fas fa-cog"></i>
							</div> Setting
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseSettings"
							aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link sub_nav_link" href="general_setting.html">General
									Settings</a> <a class="nav-link sub_nav_link"
									href="payment_setting.html">Payment Settings</a> <a
									class="nav-link sub_nav_link" href="email_setting.html">Email
									Settings</a>
							</nav>
						</div>
						<a class="nav-link" href="reports.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-bar"></i>
							</div> Reports
						</a>
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h2 class="mt-30 page-title">Customers</h2>
					<ol class="breadcrumb mb-30">
						<li class="breadcrumb-item"><a href="admin">Dashboard</a></li>
						<li class="breadcrumb-item"><a href="customer">Customers</a></li>
						<li class="breadcrumb-item active">Customer Edit</li>
					</ol>
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<div class="card card-static-2 mb-30">
								<div class="card-title-2">
									<c:choose>
										<c:when test="${type.equals('update')}">
											<h4>Edit User</h4>
										</c:when>
										<c:otherwise>
											<h4>Create New User</h4>
										</c:otherwise>
									</c:choose>
								</div>
								<form:form action="${action}" method="post"
									modelAttribute="user">
									<div class="card-body-table">
										<div class="news-content-right pd-20">
											<div class="form-group">
												<label class="form-label">Name*</label>
												<form:input path="username" type="text" class="form-control"
													placeholder="Enter Name" required />
											</div>
											<c:if test="${type.equals('newUser')}">
												<div class="form-group">
													<label class="form-label">Password*</label>
													<form:input path="password" type="text"
														class="form-control" id="id" placeholder="Enter Password" required/>
												</div>
											</c:if>
											<div class="form-group">
												<label class="form-label">Email*</label>
												<form:input path="accountEntity.email" type="email"
													class="form-control" placeholder="Enter Email Address" required/>
											</div>
											<div class="form-group">
												<label class="form-label">Phone*</label>
												<form:input path="accountEntity.phonenumber" type="text"
													class="form-control" placeholder="Enter Phone Number" required/>
											</div>
											<div class="form-group">
												<label class="form-label">Role*</label>
												<c:choose>
													<c:when test="${type.equals('update')}">
														<c:forEach var="role" items="${user.userRoleEntities}"
															varStatus="index">
															<form:input path="id" value="${role.name}" type="text"
																class="form-control"
																placeholder="Enter Role: ADMIN or USER" />
														</c:forEach>
													</c:when>
													<c:otherwise>
														<form:input path="id" value=" " type="text"
															class="form-control"
															placeholder="Enter Role: ADMIN or USER" />
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<button class="save-btn hover-btn" type="submit">Save</button>
										<button class="btn btn-default" type="reset">Cancel</button>
									</div>
								</form:form>
							</div>

						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-footer mt-auto">
				<div class="container-fluid">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted-1">
							Â© 2020 <b>Admin Page</b>. by <a
								href="../../../themeforest.net/user/gambolthemes.html">Gambolthemes</a>
						</div>
						<div class="footer-links">
							<a
								href="https://gambolthemes.net/html-items/gambo_supermarket_demo/privacy_policy.html">Privacy
								Policy</a> <a
								href="https://gambolthemes.net/html-items/gambo_supermarket_demo/term_and_conditions.html">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script data-cfasync="false"
		src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>

</html>
