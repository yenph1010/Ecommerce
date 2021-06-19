<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
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
				<h2 class="mt-30 page-title">Orders</h2>
				<ol class="breadcrumb mb-30">
					<li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
					<li class="breadcrumb-item active">Orders</li>
				</ol>
				<div class="row justify-content-between">
					<div class="col-lg-3 col-md-4">						
					</div>
					<div class="col-lg-5 col-md-6">
						<div class="bulk-section mb-30">
							<div class="search-by-name-input">
								<input type="text" class="form-control" placeholder="Search">
							</div>
							<div class="input-group">
								<select id="categeory" name="categeory" class="form-control">
									<option value="1">Pending</option>
									<option value="2">Cancel</option>
									<option value="3">Process</option>
									<option value="4">Complete</option>
								</select>
								<div class="input-group-append">
									<button class="status-btn hover-btn" type="submit">Search
										Order</button>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12">
						<div class="card card-static-2 mb-30">
							<div class="card-title-2">
								<h4>All Orders</h4>
							</div>
							<div class="card-body-table">
								<div class="table-responsive">
									<table class="table ucp-table table-hover">
										<thead>
											<tr>
												<th style="width: 60px"><input type="checkbox"
													class="check-all"></th>
												<th style="width: 130px">ID</th>												
												<th style="width: 200px">Name</th>
												<th style="width: 200px">Email</th>												
												<th style="width: 300px">Address</th>
												<th style="width: 200px">Date</th>
												<th style="width: 130px">Status</th>
												<th style="width: 130px">Total</th>
												<th style="width: 100px">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty transaction}">
												<c:forEach var="s" items="${transaction}">
													<tr>
														<td><input type="checkbox" class="check-item"
															name="ids[]" value="${s.id}"></td>
														<td>${s.id}</td>
														<td>${s.transactionname}</td>
														<td>${s.transactionmail}</td>
														<td>${s.transactionaddress}</td>
														<td>${s.transactiondate}</td>
														<td>${s.transactionstatus}</td>
														<td>$${s.payment}</td>
														<td class="action-btns"><a href="/viewdetails/${s.id}"
															class="views-btn"><i class="fas fa-eye"></i></a> <a
															href="/editOrder/${s.id}" class="edit-btn"><i
																class="fas fa-edit"></i></a></td>
													</tr>
												</c:forEach>
											</c:if>
											<c:if test="${transaction.size()==0}">
												<br>
												<div class="alert alert-warning">There is no data</div>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<jsp:include page="footer-admin.jsp"></jsp:include>
	</div>
	</div>
	<script src="/js/jquery-3.4.1.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/js/scripts.js"></script>
</body>
</html>
