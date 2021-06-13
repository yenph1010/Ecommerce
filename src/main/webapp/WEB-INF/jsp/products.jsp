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
				<h2 class="mt-30 page-title">Products</h2>
				<ol class="breadcrumb mb-30">
					<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
					<li class="breadcrumb-item active">Products</li>
				</ol>
				<div class="row justify-content-between">
					<div class="col-lg-12">
						<a href="addProduct" class="add-btn hover-btn">Add New</a>
					</div>
					<div class="col-lg-3 col-md-4">
						<div class="bulk-section mt-30">
							<div class="input-group">
								<select id="action" name="action" class="form-control">
									<option selected>Bulk Actions</option>
									<option value="1">Active</option>
									<option value="2">Inactive</option>
									<option value="3">Delete</option>
								</select>
								<div class="input-group-append">
									<button class="status-btn hover-btn" type="submit">Apply</button>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-5 col-md-6">
						<div class="bulk-section mt-30">
							<div class="search-by-name-input">
								<input type="text" class="form-control" placeholder="Search">
							</div>
							<div class="input-group">
								<%-- <form:select path="categories.id" id="category" name="category"
									class="form-control show-tick">
									<form:option value="-1">-- Please select --</form:option>
									<form:options items="${categories}" />
								</form:select> --%>
								<div class="input-group-append">
									<button class="status-btn hover-btn" type="submit">Search
										Category</button>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12">
						<div class="card card-static-2 mt-30 mb-30">
							<div class="card-title-2">
								<h4>All Categories</h4>
							</div>
							<div class="card-body-table">
								<div class="table-responsive">
									<c:if test="${not empty productList}">
										<table class="table ucp-table table-hover">
											<thead>
												<tr>
													<th style="width: 60px"><input type="checkbox"
														class="check-all"></th>
													<th style="width: 60px">ID</th>
													<th style="width: 100px">Image</th>
													<th>Name</th>
													<th>Category</th>
													<th>Description</th>
													<th>Quantity</th>
													<th>Sale</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="product" items="${productList}"
													varStatus="index">
													<tr>
														<td><input type="checkbox" class="check-item"
															name="id" value="product.id"></td>
														<td>${product.id}</td>
														<td>
															<div class="cate-img-5">
																<img src="images/product/${product.images}" alt="">
															</div>
														</td>
														<td>${product.name}</td>
														<td>${product.categoryEntity.category}</td>
														<td>${product.description}</td>
														<td>${product.quantity}</td>
														<td>${product.sale}</td>
														<td class="action-btns"><a
															href="editProduct/${product.id}" class="edit-btn"
															title="Edit"><i class="fas fa-edit"></i></a> <a
															href="deleteproduct/${product.id}" class="delete-btn"
															title="Delete"><i class="fas fa-trash-alt"></i></a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
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
