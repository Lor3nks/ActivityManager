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
	<h3>${errore}</h3>
	<h1>Cambia Password</h1>
	
		
		
			<p> ${impiegato.username}</p>
		

		
			<p>Nome: ${impiegato.nome}</p>
		

		
			<p>Cognome: ${impiegato.cognome}</p>
		

		
			<p>Data di Nascita: ${impiegato.dataNascita}</p>

		
		<form action="cambiaPassword"
		method="post">
		<p>
		<label for="password"> Vecchia Password</label>
		<input  name="password" type="text" />
		</p>
		<p>
			<label for="password"> Nuova Password</label> 
			<input  name="nuovaPassword"	type="text" />
		</p>
		<p>
			<label for="password"> Conferma Password</label>
			 <input  name="confermaPassword" type="text" />
		</p>
		<p>
		
		<!-- <p id="error" class="error"><form:errors path="data_Attivita" /></p>  -->
			<button type="submit">Submit</button>
			<button><a href="tornaIndietro">Menu</a> </button>
	</form>
	</body>
</html>