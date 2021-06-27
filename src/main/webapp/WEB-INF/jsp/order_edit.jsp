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
					<li class="breadcrumb-item"><a href="/orders">Orders</a></li>
					<li class="breadcrumb-item active">Order Edit</li>
				</ol>
				<div class="row">
					<div class="col-xl-12 col-md-12">
						<div class="card card-static-2 mb-30">
						<form:form action="/updateOrder/${transactionEntity.id}" method="post" modelAttribute="transactionEntity">
							<div class="card-title-2">
								<h2 class="title1458">Invoice</h2>								
								<span class="order-id">Order ${transactionEntity.id}</span>
							</div>
							<div class="invoice-content">
								<div class="row">
									<div class="col-lg-6 col-sm-6">
										<div class="ordr-date">
											<b>Order Date :</b> ${transactionEntity.transactiondate}
										</div>
									</div>
									<div class="col-lg-6 col-sm-6">
										<div class="ordr-date right-text">
											<b>Order Address :</b><br>
											${transactionEntity.transactionaddress}<br>
										</div>
									</div>
									<div class="col-lg-12">
										<div class="card card-static-2 mb-30 mt-30">
											<div class="card-title-2">
												<h4>Details</h4>
											</div>
											<div class="card-body-table">
												<div class="table-responsive">
													<table class="table ucp-table table-hover">
														<thead>
															<tr>
																<th style="width: 130px">ID</th>
																<th>Item</th>
																<th style="width: 150px" class="text-center">Price</th>
																<th style="width: 150px" class="text-center">Quantity</th>
																<th style="width: 100px" class="text-center">Total</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="s" items="${orderEntities}">
																<tr>
																	<td>${s.productEntity.id}</td>
																	<td><h5>${s.productEntity.name}</h5>
																		<p class="text-muted mb-0">${s.productEntity.categoryEntity.category}</p></td>
																	<c:choose>
																		<c:when test="${s.productEntity.sale== 0}">
																			<td class="text-center">$${s.productEntity.price}</td>
																			<td class="text-center">${s.quantity}</td>
																	<td class="text-center">$${s.quantity * s.productEntity.price}</td>
																		</c:when>
																		<c:otherwise>
																			<td class="text-center">$${s.productEntity.sale}</td>
																			<td class="text-center">${s.quantity}</td>
																	<td class="text-center">$${s.quantity * s.productEntity.sale}</td>
																		</c:otherwise>
																	</c:choose>
																	
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-7"></div>
									<div class="col-lg-5">
										<div class="order-total-dt">
											<div class="order-total-left-text">Sub Total</div>
											<div class="order-total-right-text">$${transactionEntity.payment*10/11}</div>
										</div>
										<div class="order-total-dt">
											<div class="order-total-left-text">Tax</div>
											<div class="order-total-right-text">$${transactionEntity.payment/11}</div>
										</div>
										<div class="order-total-dt">
											<div class="order-total-left-text fsz-18">Total Amount
											</div>
											<div class="order-total-right-text fsz-18">$${transactionEntity.payment}</div>
										</div>
									</div>
									<div class="col-lg-7"></div>
									<div class="col-lg-5">
										<div class="select-status">
											<label for="status">Status*</label>
											<div class="input-group">
													<form:input path="transactionstatus" type="text"
														class="form-control" />
												<div class="input-group-append">
													<button class="status-btn hover-btn" type="submit">Submit</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						
						</form:form>
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
