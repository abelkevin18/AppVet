<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>Lista de Usuarios</title>
</head>
<body>

	<h1>Lista de Usuarios s</h1>

	<table class="table table-striped">
		<thead>
			<th scope="row">#ID</th>
			<th scope="row">Title</th>
			<th scope="row">Category</th>
			<th scope="row">Update</th>
			<th scope="row">Delete</th>
		</thead>
		<tbody>
			<c:forEach items="${articleList }" var="article">
				<tr>
					<td>${article.id }</td>
					<td>${article.title }</td>
					<td>${article.category }</td>
					<td><spring:url value="/article/updateArticle/${article.id }"
							var="updateURL" /> <a class="btn btn-primary"
						href="${updateURL }" role="button">Update</a></td>
					<td><spring:url value="/article/deleteArticle/${article.id }"
							var="deleteURL" /> <a class="btn btn-primary"
						href="${deleteURL }" role="button">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>



	<script src="https://code.jquery.com/jquery-2.2.4.js"
		integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

</body>
</html>