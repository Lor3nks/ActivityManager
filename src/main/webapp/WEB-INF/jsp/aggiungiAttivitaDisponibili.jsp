<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">  
<title>Aggiungi Attivita Disponibili</title>
</head>
<body> 
<form:form modelAttribute="attDisp" action="aggiungiAttivitaDisponibili2" method="post" >
 
 	<p>
	    <label  for="data_Attivita">Id Attività: </label>
	    <form:input placeholder ="ID" type="text" id="id_Disp" path="id_Disp" autocomplete="off"/>
	    <p id="error" class="error"><form:errors path="id_Disp" /></p>
	</p>
	
	<p>
	    <label  for="data_Attivita">Descrizione: </label>
	    <form:input placeholder ="descrizione" type="text" id="descrizione" path="descrizione" autocomplete="off"/>
	    <p id="error" class="error"><form:errors path="descrizione" /></p>
	</p>
	 
	<p> 
	 	<label  for="data_Attivita">Abilitazione: </label>
		<form:input  type="text" id="abilitazione" path="abilitazione" autocomplete="off" value="1"/>
	</p>
	
	<button type="submit">Salva Attività</button>
        
</form:form>
<a href= "menuAmministratore" >Torna indietro</a>
</body>
</html> 