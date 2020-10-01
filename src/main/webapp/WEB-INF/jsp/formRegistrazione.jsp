<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrazione</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
			<h3>${errore}</h3>
				<form:form modelAttribute="impiegato" action="registrazione" method="post">
					<form:label path="username">Username</form:label>
					<form:input path="username" type="text"/>
					
					<form:label path="password">Password</form:label>
					<form:input path="password" type="password"/>
					
					<label>Conferma password</label>
					<input type="password" name="confermaPassword">
					
					<form:label path="email">Email</form:label>
					<form:input path="email" type="text"/>
					
					<form:label path="nome">Nome</form:label>
					<form:input path="nome" type="text"/>
					
					<form:label path="cognome">Cognome</form:label>
					<form:input path="cognome" type="text"/>
					
					<form:label path="dataNascita">Data di nascita</form:label>
					<form:input path="dataNascita" type="date"/>
					 <p class="error"><form:errors path="dataNascita" /></p>
					
					<form:hidden path="abilitazione" value="true"/>
					
					<button type="submit">Registrati</button>
				</form:form>
			</div>
		</div>	
	</div>
</body>
</html>