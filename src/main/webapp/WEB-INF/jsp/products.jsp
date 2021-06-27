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
<!-- Theme main style -->
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
					<li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
					<li class="breadcrumb-item active">Products</li>
				</ol>
				<div class="row justify-content-between">
					<div class="col-lg-3 col-md-4">
						<div class="bulk-section mt-30">
							<a href="/addProduct" class="add-btn hover-btn">Add New</a>
						</div>
					</div>
					<div class="col-lg-5 col-md-6">
						<div class="bulk-section mt-30">
							<div class="search-by-name-input">
								<form:form action="/productSearch" method="get">
									<input type="text" name="searchInput" class="form-control"
										placeholder="Search">
								</form:form>
							</div>
							<!-- <div class="input-group">
								<select id="category" name="category" class="form-control">
									<option value="1">Table</option>
									<option value="2">Chair</option>
									<option value="3">Bed</option>
									<option value="4">Other</option>
								</select>
								<div class="input-group-append">
									<button class="status-btn hover-btn" type="submit">Search
										Category</button>
								</div>
							</div> -->
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
										<div style="text-align: right">

											<c:choose>
												<c:when test="${currentPage-1<0}">
													<span>Showing results</span>
												</c:when>
												<c:when test="${currentPage*9<totalItems}">
													<span>Showing ${currentPage*9-8}-${currentPage*9} of
														${totalItems} products</span>
												</c:when>
												<c:otherwise>
													<span>Showing ${currentPage*9-8}-${totalItems} of
														${totalItems} products</span>
												</c:otherwise>
											</c:choose>

										</div>
										<table class="table ucp-table table-hover">
											<thead>
												<tr>
													<th style="width: 60px">ID</th>
													<th style="width: 100px">Image</th>
													<th>Name</th>
													<th>Category</th>
													<th>Description</th>
													<th>Quantity</th>
													<th>Price</th>
													<th>Sale</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="product" items="${productList}"
													varStatus="index">
													<tr>

														<td>${product.id}</td>
														<td>
															<div class="cate-img-5">
																<img src="/images/product/${product.images}" alt="">
															</div>
														</td>
														<td>${product.name}</td>
														<td>${product.categoryEntity.category}</td>
														<td>${product.description}</td>
														<td>${product.quantity}</td>
														<td>${product.price}</td>
														<td>${product.sale}</td>
														<td class="action-btns"><a
															href="/editProduct/${product.id}" class="edit-btn"
															title="Edit"><i class="fas fa-edit"></i></a> <a
															href="/deleteproduct/${product.id}" class="delete-btn"
															title="Delete"><i class="fas fa-trash-alt"></i></a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<!-- Start Pagination -->
										<div class="row">
											<div class="col-lg-4 col-md-4 col-xs-12"></div>
											<div class="col-lg-4 col-md-4 col-xs-12">
												<ul class="pagination">
													<c:if test="${currentPage-1>=0}">
														<span></span>
														<c:choose>
															<c:when test="${currentPage > 1}">
																<li><a href="/adminpage/1">First</a></li>
																<li><a href="/adminpage/${currentPage - 1}">Pre</a></li>
															</c:when>
															<c:otherwise>
																<li><a href="#">First</a></li>
																<li><a href="#">Pre</a></li>
															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${currentPage> totalPages}">
																<c:forEach var="i" begin="${currentPage}"
																	end="${currentPage}" varStatus="index">
																	<c:choose>
																		<c:when test="${currentPage != i}">
																			<li><a href="/adminpage/${i}">${i}</a></li>
																		</c:when>
																		<c:otherwise>
																			<li><a href="#">${i}</a></li>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</c:when>

															<c:otherwise>
																<c:forEach var="i" begin="${currentPage}"
																	end="${totalPages}" varStatus="index">
																	<c:choose>
																		<c:when test="${currentPage != i}">
																			<li><a href="/adminpage/${i}">${i}</a></li>
																		</c:when>
																		<c:otherwise>
																			<li><a href="#">${i}</a></li>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${currentPage < totalPages}">
																<li><a href="/adminpage/${currentPage + 1}}">Next</a></li>
																<li><a href="/adminpage/${totalPages}">Last</a></li>
															</c:when>
															<c:otherwise>
																<li><a href="#">Next</a></li>
																<li><a href="#">Last</a></li>
															</c:otherwise>
														</c:choose>
													</c:if>
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
				</div>
			</div>
		</main>
		<jsp:include page="footer-admin.jsp"></jsp:include>
	</div>

	<script src="/js/jquery-3.4.1.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/js/scripts.js"></script>
</body>
</html>
