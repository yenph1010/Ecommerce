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
<link href="/css/styles.css" rel="stylesheet">
<link href="/css/admin-style.css" rel="stylesheet">

<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
</head>
<body class="sb-nav-fixed">
	<jsp:include page="header-admin.jsp"></jsp:include>
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
							<form:form action="${action}" method="post" modelAttribute="user">
								<div class="card-body-table">
									<div class="news-content-right pd-20">
										<div class="form-group">
											<label class="form-label">Name*</label>
											<form:input path="username" type="text" class="form-control"
												placeholder="Enter Name" required="required" />
										</div>
										<c:if test="${type.equals('newUser')}">
											<div class="form-group">
												<label class="form-label">Password*</label>
												<form:input path="password" type="text" class="form-control"
													id="id" placeholder="Enter Password" required="required" />
											</div>
										</c:if>
										<div class="form-group">
											<label class="form-label">Email*</label>
											<form:input path="accountEntity.email" type="email"
												class="form-control" placeholder="Enter Email Address"
												required="required" />
										</div>
										<div class="form-group">
											<label class="form-label">Phone*</label>
											<form:input path="accountEntity.phonenumber" type="text"
												class="form-control" placeholder="Enter Phone Number"
												required="required" />
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

		<jsp:include page="footer-admin.jsp"></jsp:include>
	</div>
	<script data-cfasync="false"
		src="/../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
	<script src="/js/jquery-3.4.1.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/js/scripts.js"></script>
</body>

</html>
