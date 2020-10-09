<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset Password</title>
</head>
<body>
	
	<c:if test="${not empty error}">
		<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>
	
	<form action="sendEmail" method="post">
		<label for="resetTo">Username</label>
		<input name="resetTo" type="text"/>
		
		<br>
		
		<label for="email">Email</label>
		<input name="email" type="text"/>
		
		<br>
		
		<button type="submit">Resetta Password</button>
		
		
		
	</form>
</body>
</html>