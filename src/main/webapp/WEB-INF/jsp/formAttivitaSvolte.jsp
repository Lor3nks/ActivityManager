<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p>Hello world</p>
<form:form modelAttribute="attivitaSvolte" action="visualizza" method="post">
	
	<%-- DATA	<form:input type="date" path="data_Attivita" placeholder="dd/MM/yyyy" /> --%>
	orario <form:input type="text" path="ora_Inizio" placeholder="hh:mm"/>
	<input type="submit" value="invia">
</form:form>

</body>
</html>