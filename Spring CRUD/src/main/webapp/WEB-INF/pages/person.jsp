<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<style>
.blue-button {
	background: #25A6E1;
	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr='#25A6E1',
		endColorstr='#188BC0', GradientType=0);
	padding: 3px 5px;
	color: #fff;
	font-family: 'Helvetica Neue', sans-serif;
	font-size: 12px;
	border-radius: 2px;
	-moz-border-radius: 2px;
	-webkit-border-radius: 4px;
	border: 1px solid #1A87B9
}

table {
	font-family: "Helvetica Neue", Helvetica, sans-serif;
	width: 50%;
}

th {
	background: SteelBlue;
	color: white;
}

td, th {
	border: 1px solid gray;
	width: 25%;
	text-align: left;
	padding: 5px 10px;
}
</style>
</head>
<body>
	<form:form method="post" modelAttribute="book"
		action="/myAjax/saveBook">
		<table>
			<tr>
				<th colspan="2">Add Country</th>
			</tr>
			<tr>
				<form:hidden path="id" />
				<td><form:label path="title">Book Title:</form:label></td>
				<td><form:input path="title" size="30" maxlength="30"></form:input></td>
			</tr>
			<tr>
				<td><form:label path="author">Author:</form:label></td>
				<td><form:input path="author" size="30" maxlength="30"></form:input></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="blue-button" /></td>
			</tr>
		</table>
	</form:form>
	</br>
	<h3>Book List</h3>
	<c:if test="${!empty listsbook}">
		<table class="tg">
			<tr>
				<!-- 				<th width="80">Id</th> -->
				<th width="120">Author</th>
				<th width="120">Titlte</th>
				<!-- 				<th width="60">Edit</th> -->
				<!-- 				<th width="60">Delete</th> -->
			</tr>
			<c:forEach items="${listsbook}" var="book">
				<tr>
					<%-- 					<td>${country.id}</td> --%>
					<td>${book.title}</td>
					<td>${book.author}</td>
					<td><a href="<c:url value='/updateBook?id=${book.id}' />">Edit</a></td>
					<td><a href="<c:url value='/deleteBook?id=${book.id}' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>
