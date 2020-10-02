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
	<form  action="login"  method="post">
			
			<p>
				<label for="username">Username:</label>	
				<input name="username" type="text"/>
			</p>
			<p>
				<label for="password">Password:</label>	
				<input type="password" name="password"/>
			</p>
			<p>
				<button type="submit">Login</button>
	</form>
	
	<p><a href=" " type="submit">Password dimenticata</a></p>
	<p>Se non hai un account, <a href="formRegistrazione">registrati</a></p>
</body>
</html>