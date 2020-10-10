<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style type="text/css"><%@include file="/css/bootstrap.min.css"%></style>
<style type="text/css"><%@include file="/css/style.css"%></style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href=""><img id="logoL" src="./images/ATlogo_min1.png">Activity Tracker</a>
  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
  	</button>
</nav>


<div class="rowLogin row">
<div class="col-lg-4 col-sm-3 col-xs-3 col-2"></div>
<div class="col-lg-4 col-sm-6 col-xs-6 col-8">


	<form action="login" method="post">
			
		<img id="logo" src="./images/ATlogo.png">
			
		
		<c:if test="${not empty error}">
		<div class="error text-danger">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg text-success">${msg}</div>
		</c:if>
		<p class="text-success">${successo}</p>
			
			<p>
				<label for="username">Username</label>	
				<input name="username" type="text" autofocus/>
			</p>
			<p>
				<label for="password">Password</label>	
				<input type="password" name="password"/>
			</p>
			<p>
				<button class="btn btn-outline-primary" type="submit">Login</button>
			</p>
			
	</form>
	
	<p><a href="formResetPassword" type="submit">Password dimenticata</a></p>
	<p>Se non hai un account, <a href="formRegistrazione">registrati</a></p>
	
	</div>
	<div class="col-lg-4 col-sm-3 col-xs-3 col-2"></div>
	</div>
	
</body>
</html>