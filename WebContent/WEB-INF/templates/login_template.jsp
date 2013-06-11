<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Login Box HTML Code - www.PSDGraphics.com</title>
<link rel="stylesheet" href="/ManagementMVC/css/login-box.css">
</head>

<body>


	<div style="padding: 100px 0 0 250px;">


		<div id="login-box">

			<H2>Login</H2>
			 <br /> <br />
			<form:form action="login.html" method="post" commandName="userForm"
				id="user_form">
				<div id="login-box-name" style="margin-top: 20px;">Email:</div>
				<div id="login-box-field" style="margin-top: 20px;">
					<form:input name="q" class="form-login" title="Username" value=""
						path="name" size="30" maxlength="2048" />
				</div>
				<div id="login-box-name">Password:</div>
				<div id="login-box-field">
					<form:password name="q" path="password" class="form-login"
						title="Password" value="" size="30" maxlength="2048" />
				</div>

				<br />

				<span class="login-box-options"><input type="checkbox"
					name="1" value="1"> Remember Me <a href="#"
						style="margin-left: 30px;">Forgot password?</a></span>
				<br />
				<form:button id = "btnSubmit" style="float:right;margin-right: 30px;border:medium none;background:url(/ManagementMVC/images/login-btn.png);width:103px;height:42px;margin-top:25px;" ></span></form:button>
			</form:form>

		</div>

		<br />
	</div>
	</div>
</body>
</html>