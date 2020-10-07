<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Portale Dell'Impiegato</title>
</head>
<body>
<h1>Menu Attivita</h1>
<h2>Title : ${title}</h2>
	<h2>Message : ${message}</h2>

	<c:url value="/logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
 <form >
 <ol>
 <li><a href="visualizzaAttivitaSvolteImpiegato">Visualizza Attività</a></li>
 <li><a href="formAttivitaSvolte">Gestione Attività Svolte</a></li>
 <li><a href="cambiaPassword">Modifica Password</a></li>
 <li><a href="logout">Logout</a></li>
 </ol>
</form>


</body>
</html> 