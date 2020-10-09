<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrazione</title>
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
<p>${errore}</p>
	<div class="container">
		<div class="row">
			<div class="col">
				<form:form modelAttribute="impiegato" action="registrazione" method="post">
					<p><form:label path="username">Username</form:label>
					<form:input path="username" type="text"/></p>
					<p id="error" class="error"><form:errors path="username" /></p>
					
					<p><form:label path="password">Password</form:label>
					<form:input path="password" type="password"/></p>
					<p id="error" class="error"><form:errors path="password" /></p>
					
					<p><label>Conferma password</label>
					<input type="password" name="confermaPassword"></p>
					
					<p><form:label path="email">Email</form:label>
					<form:input path="email" type="text"/></p>
					<p id="error" class="error"><form:errors path="email" /></p>
					
					<p><form:label path="nome">Nome</form:label>
					<form:input path="nome" type="text"/></p>
					<p id="error" class="error"><form:errors path="nome" /></p>
					
					<p><form:label path="cognome">Cognome</form:label>
					<form:input path="cognome" type="text"/></p>
					<p id="error" class="error"><form:errors path="cognome" /></p>
					
					<p><form:label path="dataNascita">Data di nascita</form:label>
					<form:input path="dataNascita" type="text" placeholder="GG/MM/AAAA"/></p>
					 <p class="error"><form:errors path="dataNascita" /></p>
					
					<form:hidden path="abilitazione" value="true"/>
					<form:hidden path="ruolo" value="impiegato"/>
					
					<button class="btn btn-outline-primary" type="submit">Registrati</button>
				</form:form>
			</div>
		</div>
		<div class="row">
			<p>Se sei già registrato, effettua il <a href="login"><button class="btn btn-outline-primary">login</button></a></p>
		</div>	
	</div>
</body>
</html>