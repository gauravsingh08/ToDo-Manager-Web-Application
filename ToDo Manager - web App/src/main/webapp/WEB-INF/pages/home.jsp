<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<title><c:out value="${page}"></c:out></title>
</head>
<body>

	<div class="container mt-3">
		<h1 class="text-center">Welcome to ToDo Manger</h1>

		<c:if test="${not empty msg }">
			<div class="alert alert-success">
				<b><c:out value="${msg }"></c:out></b>

			</div>
		</c:if>

		<div class="row mt-5">

			<div class="col-md-2">

				<div class="list-group">
					<button type="button"
						class="list-group-item list-group-item-action active">Menu</button>
					<a href='add' class="list-group-item list-group-item-action">Add
						ToDo</a> <a href='home' class="list-group-item list-group-item-action">View
						ToDo</a>

				</div>
			</div>

			<div class="col-md-10">
				<c:if test="${page=='home' }">

					<h1 class="text-center">All TODOS</h1>

					<c:forEach items="${todos }" var="t">
						<div class="card" onclick="true">
							<div class="card-body">
								<h3>
								<c:out value="${t.todoTitle}"></c:out>
								</h3>
								<p>
								<c:out value="${t.todoContent}"></c:out>
								</p>

							</div>
						</div>
					</c:forEach>


				</c:if>

				<c:if test="${page=='add'}">
					<h1 class="text-center">Add TODOS</h1>
					<br>
					<form:form action="saveToDo" method="post" modelAttribute="todo">

						<div class="form-group">
							<form:input path="todoTitle" cssClass="form-control"
								placeholder="Enter your todo title" />

						</div>

						<br>

						<div class="form-group">
							<form:textarea path="todoContent" cssClass="form-control"
								placeholder="Enter your todo content" cssStyle="height:250px;" />
						</div>

						<br>

						<div class="container text-center">
							<button class="btn btn-outline-sucess">Add Todo</button>

						</div>

					</form:form>



				</c:if>
			</div>

		</div>

	</div>





	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    -->
</body>
</html>