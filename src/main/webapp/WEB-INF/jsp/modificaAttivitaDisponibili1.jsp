<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">  
<title>Aggiorna Attivita Disponibili</title>
</head>
<body> 
<form:form modelAttribute="attDisp" action="modificaAttivitaDisponibili2" method="post">
	        <p>
				<label for="descrizione">Descrizione:</label>	
				<form:input name="descrizione" type="text" path="descrizione" />
				<form:input name="id_Disp" type="hidden" path="id_Disp" />
				<form:input name="abilitazione" type="hidden" path="abilitazione" />
			</p>
        	<p><button type="submit">Salva</a></p> 
</form:form>
</body>
</html>