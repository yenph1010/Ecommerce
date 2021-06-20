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
<meta name="description" content="">
<meta name="author" content="">
<title>Admin Page</title>
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
				<h2 class="mt-30 page-title">Users</h2>
				<ol class="breadcrumb mb-30">
					<li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
					<li class="breadcrumb-item active">Customers</li>
				</ol>
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="card card-static-2 mb-30">
							<div class="card-title-2">
								<div class="col-lg-10 col-md-10">
									<h4>All Users</h4>
								</div>
								<div class="col-lg-2 col-md-2">
									<a href="/newUser" class="btn btn-primary">Create User</a>
								</div>
							</div>
							<div class="card-body-table">
								<div class="table-responsive">
									<c:if test="${not empty users}">
										<table class="table ucp-table table-hover">
											<thead>
												<tr>
													<th style="width: 60px"><input type="checkbox"
														class="check-all"></th>
													<th style="width: 60px">ID</th>
													<th>Name</th>
													<th>Email</th>
													<th>Phone</th>
													<th>Role</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="user" items="${users}" varStatus="index">
													<tr>
														<td><input type="checkbox" class="check-item"
															name="${user.id}" value="10"></td>
														<td>${user.id}</td>
														<td>${user.username}</td>
														<td>${user.accountEntity.email}</td>
														<td>${user.accountEntity.phonenumber}</td>
														<td><c:forEach var="role"
																items="${user.userRoleEntities}" varStatus="index">
																<p>${role.name}</p>
															</c:forEach></td>
														<td class="action-btns"><a href="customer_view"
															class="view-shop-btn" title="View"><i
																class="fas fa-eye"></i></a> <a
															href="editAccountUser/${user.id}" class="edit-btn"
															title="Edit"><i class="fas fa-edit"></i></a> <a href="#"
															class="delete-btn" title="Edit"><i
																class="fas fa-trash-alt"></i></a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</c:if>
									<c:if test="${users.size()==0}">
										<br>
										<div class="alert alert-warning">There is no data</div>
									</c:if>
								</div>
							</div>
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
