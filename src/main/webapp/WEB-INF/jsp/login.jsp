<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<form:form  action="registrati"  method="post">
		<fieldset>
			<legend>Login</legend>
			<p>
				<label for="username">Username:</label>	
				<form:input type="text"  path="username" autocomplete="off"/>
			</p>
			<p>
				<label for="password">Password:</label>	
				<form:input type="text" path="password" autocomplete="off"/>
			</p>
			<p>
				<button type="submit" value="Login">Login</button>
		</fieldset>
	</form:form>
</body>
</html>