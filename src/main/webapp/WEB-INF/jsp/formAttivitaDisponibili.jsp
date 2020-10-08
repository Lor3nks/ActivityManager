<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attività Disponibili</title>
</head>
<body>
<form:form modelAttribute="attivitaDisponibili" action="inserisciAttivitaDisponibili" method="post">
	<p>
	    <label for="id_Attivita">ID Attività: </label>
	    <form:input type="text" id="id_Attivita" path="id_Attivita" autocomplete="off"/>
	</p>
	
	<p>
	    <label for="desc_Attivita">Descrizione Attività: </label>
	    <form:input type="text" id="desc_Attivita" path="desc_Attivita" autocomplete="off"/>
	</p>
	<div>
	<p>Abilitazione: </p>
		<input type="radio" id="sì" name="abilitazione" value="1">
		<label for="sì">Sì</label><br>
		<input type="radio" id="no" name="gender" value="0">
		<label for="no">No</label><br>
	</div>
	
	
	<p id="buttons">
		<input id="submit" type="submit" value="Salva"/>
	</p>
</form:form>
</body>
</html>