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
<style type="text/css"><%@include file="/css/bootstrap.min.css"%></style>
<style type="text/css"><%@include file="/css/style.css"%></style>
</head> 
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href=""><img id="logo" src="./images/ATlogo_min1.png"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  
</nav>

<div class="container">
<div class="rowLogin row">
<div class="col-lg-4 col-sm-3 col-xs-3 col-2"></div>
<div class="col-lg-4 col-sm-6 col-xs-6 col-8">	
 
<h3>Reset password</h3>

		<c:if test="${not empty error}">
		<div class="text-danger">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="text-danger">${msg}</div>
		</c:if>

<form action="sendEmail" method="post">

		<label for="resetTo">Username</label>
		<p><input name="resetTo" type="text"/></p>
		
		<label for="email">Email</label>
		<p><input name="email" type="text"/></p>
		
		<p><button class="btn btn-outline-success" type="submit">Reset Password</button></p>
		
	</form>
	<p><a href="login"><button  class="btn btn-outline-primary">Torna al menù</button></a></p>
	</div>
	<div class="col-lg-4 col-sm-3 col-xs-3 col-2"></div>
	</div>
</div>	
</body>
</html>