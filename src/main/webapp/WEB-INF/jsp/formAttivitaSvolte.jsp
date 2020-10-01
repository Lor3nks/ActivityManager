<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attività svolte</title>
</head>
<body>

<form:form modelAttribute="attivitaSvolte" action="salvaAttivitaS"  method="post">
<fieldset>

	<p>
	    <label for="data_Attivita">Data attività: </label>
	    <form:input type="text" id="data_Attivita" path="data_Attivita" autocomplete="off"/>
	    <p id="error" class="error"><form:errors path="data_Attivita" /></p>	
	</p>
	<p>
	    <label for="ora_Inizio">Ora inizio: </label>
	    <form:input type="text" id="ora_Inizio" path="ora_Inizio" autocomplete="off"/>
	    <p class="error"><form:errors path="ora_Inizio" /></p>
	</p>
	<p>
	    <label for="ora_Fine">Ora fine: </label>
	    <form:input type="text" id="ora_Fine" path="ora_Fine" autocomplete="off"/>
	    <p class="error"><form:errors path="ora_Fine" /></p>	
	</p>
	 <p id="buttons">
		<!-- <a href="salvaAttivitaS"><input type="button" value="Salva" style="color:black" /></a>  -->
		<input id="submit" type="submit" value="Salva"/>
	</p>
</fieldset>
</form:form>

</body>
</html>