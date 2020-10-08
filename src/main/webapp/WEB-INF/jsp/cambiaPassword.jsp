<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cambia Password</title>
</head>
<body>
	<h1>Cambia Password</h1>
	<form:form modelAttribute="impiegato" action="cambiaPassword"
		method="post">

		<label>
			<p>${impiegato.nome}</p>
		</label>

		<label>
			<p>${impiegato.cognome}</p>
		</label>

		<label>
			<p>${impiegato.dataNascita}</p>

		</label>
		<label for="password"> Vecchia Password</label>
		<input name="password" type="text" />
		</p>
		<p>
			<label for="password"> Nuova Password</label> <input name="password"
				type="text" />
		</p>
		<p>
			<label for="password"> Conferma Password</label> <input
				name="password" type="text" />
		</p>
			<span><button type="submit">Submit</button></span>
			<span><a href=""><button>Menu</button></a> </span>
	</form:form>
</body>
</html>