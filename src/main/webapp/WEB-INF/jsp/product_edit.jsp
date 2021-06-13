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

<link rel="stylesheet"
	href="/../../../cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="/vendor/froala_editor_3.1.1/css/froala_editor.css">
<link rel="stylesheet"
	href="/vendor/froala_editor_3.1.1/css/froala_style.css">
<link rel="stylesheet"
	href="/vendor/froala_editor_3.1.1/css/plugins/code_view.css">
<link rel="stylesheet"
	href="/vendor/froala_editor_3.1.1/css/plugins/colors.css">
<link rel="stylesheet"
	href="/vendor/froala_editor_3.1.1/css/plugins/emoticons.css">
<link rel="stylesheet"
	href="/vendor/froala_editor_3.1.1/css/plugins/image_manager.css">
<link rel="stylesheet"
	href="/vendor/froala_editor_3.1.1/css/plugins/image.css">
<link rel="stylesheet"
	href="/vendor/froala_editor_3.1.1/css/plugins/line_breaker.css">
<link rel="stylesheet"
	href="/vendor/froala_editor_3.1.1/css/plugins/table.css">
<link rel="stylesheet"
	href="/vendor/froala_editor_3.1.1/css/plugins/char_counter.css">
<link rel="stylesheet"
	href="/vendor/froala_editor_3.1.1/css/plugins/video.css">
<link rel="stylesheet"
	href="/vendor/froala_editor_3.1.1/css/plugins/fullscreen.css">
<link rel="stylesheet"
	href="/vendor/froala_editor_3.1.1/css/plugins/file.css">
<link rel="stylesheet"
	href="/../../../cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.css">
</head>
<body class="sb-nav-fixed">
	<jsp:include page="header-admin.jsp"></jsp:include>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid">
				<h2 class="mt-30 page-title">Products</h2>
				<ol class="breadcrumb mb-30">
					<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
					<li class="breadcrumb-item"><a href="products.html">Products</a></li>
					<c:choose>
						<c:when test="${type.equals('update')}">
							<li class="breadcrumb-item active">Edit Product</li>
						</c:when>
						<c:otherwise>
							<li class="breadcrumb-item active">Add Product</li>
						</c:otherwise>
					</c:choose>

				</ol>
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="card card-static-2 mb-30">
							<div class="card-title-2">
								<c:choose>
									<c:when test="${type.equals('update')}">
										<h4>Edit Product</h4>
									</c:when>
									<c:otherwise>
										<h4>Add New Product</h4>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="card-body-table">
								<div class="news-content-right pd-20">
									<form:form action="${action}" method="post"
										modelAttribute="product" class="form-horizontal" enctype="multipart/form-data">
										<div class="form-group">
											<label class="form-label">Name*</label>
											<form:input path="name" type="text" class="form-control"
												placeholder="Product Name" required="required" />
											<form:hidden path="id" />
										</div>
										<div class="form-group">
											<label class="form-label">Category*</label>
											<form:select path="categoryEntity.id"
												class="form-control show-tick" required="required">
												<form:option value="-1">-- Please select --</form:option>
												<form:options items="${categories}" />
											</form:select>
										</div>
										<div class="form-group">
											<label class="form-label">Price*</label>
											<form:input type="text" path="price" class="form-control"
												placeholder="$0" required="required" />
										</div>
										<div class="form-group">
											<label class="form-label">Quantity*</label>
											<form:input path="quantity" type="text" class="form-control"
												placeholder="1" required="required" />
										</div>
										<div class="form-group">
											<label class="form-label">Sale</label>
											<form:input type="text" path="sale" class="form-control"
												placeholder="10" />
										</div>
										<div class="form-group">
											<label class="form-label">Description</label>
											<form:input type="text" path="description"
												class="form-control" placeholder="Describe the product" />
										</div>
										<div class="form-group">
											<label class="form-label">Product Image*</label>
											<div class="input-group">
												<div class="custom-file">													
														<input type="file" name="file" path="image"/>

												</div>
											</div>
											<div class="add-cate-img-1">
												<img
													src="/images/product/${product.images}"/>
											</div>
										</div>

										<button class="save-btn hover-btn" type="submit">Save
											Product</button>
										<button class="btn btn-secondary" type="reset">Cancel</button>
									</form:form>
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

	<script type="text/javascript"
		src="/../../../cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.js"></script>
	<script type="text/javascript"
		src="/../../../cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/mode/xml/xml.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/froala_editor.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/align.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/code_beautifier.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/code_view.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/colors.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/emoticons.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/draggable.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/font_size.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/font_family.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/image.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/file.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/image_manager.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/line_breaker.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/link.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/lists.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/paragraph_format.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/paragraph_style.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/video.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/table.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/url.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/entities.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/char_counter.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/inline_style.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/save.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/fullscreen.min.js"></script>
	<script type="text/javascript"
		src="/vendor/froala_editor_3.1.1/js/plugins/quote.min.js"></script>
	<script>
		(function() {
			new FroalaEditor("#edit", {
				zIndex : 10
			})
		})()
	</script>
</body>
</html>
