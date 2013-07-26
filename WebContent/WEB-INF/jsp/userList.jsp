<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body>
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