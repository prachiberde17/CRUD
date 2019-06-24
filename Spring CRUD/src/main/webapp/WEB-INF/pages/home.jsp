<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- <link href="./resources/css/style.css" rel="stylesheet"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#skill_Form').submit(function(event) {
			var data = {}
			data["firstName"] = $("#firstName").val();
			data["lastName"] = $('#lastName').val();
// 			console.log(data);
			$.ajax({
				url : "save",
				data : JSON.stringify(data),
				type : "POST",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("Accept", "application/json");
					xhr.setRequestHeader("Content-Type", "application/json");
				},
				success : function(response) {
// 					alert(response.msg);
					console.log(response.data);
					console.log(response.msg);
					 data = response.data;
// 			            $('.tr').remove();
// 			            for (i = 0; i < response.data.length; i++) {
// 			                console.log(data[i].firstName);
//			                $("#table1").append("<tr class='tr'> <td> " + response.data[i].skill_name + " </td>  <td> <a href='#' onclick= edit(" + i + ");> Edit </a>  </td> </td> <td> <a href='#' onclick='delete_(" + response.data[i].skill_Id + ");'> Delete </a>  </td> </tr>");
			                $("#table1").append("<tr class='tr'> <td> " + response.data.firstName + " </td><td> " + response.data.lastName + " </td></tr>");

// 			            }
					// 					load();
					// 					refresh();
				},

			});
			event.preventDefault();
		});
	});
</script>
</head>
<body>
	<div align="center">
<%-- 		<form action="save" id="skill_Form" modelAttribute="student">
			<table>
				<tr>
					<td>First Name:</td>
					<td><input type="text" name="firstName" id="firstName" /></td>
				</tr>
				<tr>
					<td>Last Name:</td>
					<td><input type="text" name="lastName" id="lastName"></td>
				</tr>
				<tr>
					<td><input type="submit" onsubmit="submit()" value="submit"></td>
				</tr>
			</table>
		</form> --%>
		<form:form id="skill_Form" method="post" modelAttribute="student">
			<table>

				<tr>
					<td style="color: Dark blue">First Name:</td>
					<td><form:input path="firstName" name="firstName"
							id="firstName" required="true" /></td>
					<td style="color: Dark blue">Last Name:</td>
					<td><form:input path="lastName" name="lastName"
							id="lastName" required="true" /></td>
					<br>
					<td colspan="2" align="center"><input type="submit" value="Add"></td>
				</tr>
			</table>
		</form:form>
		<table id="table1" border=1>
			<th>First Name</th>
			<th>Last Name</th>
<!-- 			<th>Delete</th> -->

		</table>
	</div>
</body>
</html>