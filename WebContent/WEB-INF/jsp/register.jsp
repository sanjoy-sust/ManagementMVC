<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" language="javascript"
	src="http://www.technicalkeeda.com/js/javascripts/plugin/jquery.js"></script>
<script type="text/javascript"
	src="http://www.technicalkeeda.com/js/javascripts/plugin/json2.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spring Jquery Ajax Demo</title>
<style>
Table.GridOne {
	padding: 3px;
	margin: 0;
	background: lightyellow;
	border-collapse: collapse;
	width: 35%;
}

Table.GridOne Td {
	padding: 2px;
	border: 1px solid #ff9900;
	border-collapse: collapse;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#subbutton").click(function() {

			var name = document.getElementById("name").value;
			var email = document.getElementById("email").value;
			var fullName = document.getElementById("fullName").value;
			var password = document.getElementById("password").value;
			var address = document.getElementById("address").value;
			var occupation = document.getElementById("occupation").value;
			var nationality = document.getElementById("nationality").value;
			var gender =$('input[name=gender]:checked', '#userForm').val()
			//var gender = document.getElementsByName("gender").value;

			var user = {
				name : name,
				email : email,
				fullName : fullName,
				password : password,
				address : address,
				occupation : occupation,
				nationality : nationality,
				gender : gender,
			};

			$.ajax({
				// this is the php file that processes the data and send mail
				url : "registerSave.html",

				// GET method is used
				type : "POST",

				// pass the data
				data : user,
			
				// success
				success : function(response) {
					alert(response.userList);
					$("td input:text").each(function() {
						$(this).val('');
					});
					$("#password").val('');
				},
				error : function(request, status, error) {
				}
			});
		});
	});
</script>
</head>
<body>
	<form name="userForm" id ="userForm" method="POST">
		<table cellpadding="0" cellspacing="0" border="1" class="GridOne">
			<tr>
				<td>Full Name</td>
				<td><input type="text" name="fullName" id="fullName" value=""></td>
			</tr>
			<tr>
				<td>UserName</td>
				<td><input type="text" name="name" id="name" value=""></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password" id="password" value=""></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input type="text" name="address" id="address" value=""></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="email" id="email" value=""></td>
			</tr>
			<tr>
				<td>occupation</td>
				<td><input type="text" name="occupation" id="occupation"
					value=""></td>
			</tr>
			<tr>
				<td>Nationality</td>
				<td><input type="text" name="nationality" id="nationality"
					value=""></td>
			</tr>

			<tr>
				<td>Designation</td>
				<td><input type="text" name="designation" id="designation"
					value=""></td>
			</tr>
			<tr>
				<td>Gender</td>
				<td><input type="radio" class ="gender" name="gender" id="gender" value="Male">Male</input>
					<input type="radio" class ="gender" name="gender" id="gender" value="Female">Female</input>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button"
					value="Save" name ="subbutton" id ="subbutton"></td>
			</tr>
		</table>
	</form>
	<h1>User List</h1>
		<table name = "userlistTable" border="1" style = "border:1px solid green;">
		<th "background-color:green; color:white;height:50px;">Name</th>
		<th "background-color:green; color:white;height:50px;">Full Name</th>
		<th "background-color:green; color:white;height:50px;">Email</th>
		<th "background-color:green; color:white;height:50px;">Address</th>
		<th "background-color:green; color:white;height:50px;">Nationality</th>
		<th "background-color:green; color:white;height:50px;">Occupation</th>
		<th "background-color:green; color:white;height:50px;">National Id</th>
		<th "background-color:green; color:white;height:50px;">Edit</th>
        <th "background-color:green; color:white;height:50px;">Delete</th>
		<c:forEach var="user" items="${userList}">

			<tr bordercolor="red">

				<td  style = "padding:10px;">${user.name}</td>
				<td "padding:10px;">${user.fullName}</td>
				<td "padding:10px;">${user.email}</td>
				<td "padding:10px;">${user.address}</td>
				<td "padding:10px;">${user.nationality}</td>
				<td "padding:10px;">${user.occupation}</td>
				<td "padding:10px;">${user.nationalId}</td>
				<td "padding:10px;"><form:form method="POST" action="update.html"
						commandName="user">
						<form:hidden name="id" path="id" value="${user.id}" />
						<form:hidden name="name" path="name" value="${user.name}" />
						<form:hidden name="fullName" path="fullName"
							value="${user.fullName}" />
						<form:hidden name="email" path="email" value="${user.email}" />
						<form:hidden name="address" path="address" value="${user.address}" />
						<form:hidden name="nationality" path="nationality"
							value="${user.nationality}" />
						<form:hidden name="occupation" path="occupation"
							value="${user.occupation}" />
						<form:hidden name="nationalId" path="nationalId"
							value="${user.nationalId}" />
						<form:hidden name="password" path="password" value="${user.password}" />
						<form:hidden name="designation" path="designation"
							value="${user.designation}" />
						<form:hidden name="gender" path="gender" value="${user.gender}" />
						<button type="submit" name="submit" value="Edit">Edit</button>
					</form:form></td>
					<td "padding:10px;"><form:form method="POST" action="delete.html"
						commandName="user">
						<form:hidden name="id" path="id" value="${user.id}" />
						<form:hidden name="name" path="name" value="${user.name}" />
						<form:hidden name="fullName" path="fullName"
							value="${user.fullName}" />
						<form:hidden name="email" path="email" value="${user.email}" />
						<form:hidden name="address" path="address" value="${user.address}" />
						<form:hidden name="nationality" path="nationality"
							value="${user.nationality}" />
						<form:hidden name="occupation" path="occupation"
							value="${user.occupation}" />
						<form:hidden name="nationalId" path="nationalId"
							value="${user.nationalId}" />
						<form:hidden name="password" path="password" value="${user.password}" />
						<form:hidden name="designation" path="designation"
							value="${user.designation}" />
						<form:hidden name="gender" path="gender" value="${user.gender}" />
						<button type="submit" name="submit" value="Delete">Delete</button>
					</form:form></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>