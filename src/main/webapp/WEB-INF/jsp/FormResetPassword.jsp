<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form:form modelAttribute="amministratore" action="resetPassword" method="post">
		<form:label path="username">Username</form:label>
		<form:input path="username" type="text"/>
		
		<br>
		
		<form:label path="email">Email</form:label>
		<form:input path="email" type="text"/>
		
		<br>
		
		<button type="submit">Resetta Password</button>
		
		
		
	</form:form>
</body>
</html>