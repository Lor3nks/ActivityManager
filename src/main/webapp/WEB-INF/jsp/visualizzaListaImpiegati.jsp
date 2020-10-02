<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
<form:form modelAttribute="listaImpiegato" action="" method="post" >
 <table border="1" cellspacing="0" cellpadding="10">
	
        <tr>
          <th>Username</th>
          <th>Password</th>
          <th>E-mail</th>
          <th>Nome</th>
          <th>Cognome</th>
          <th>Data di Nascita</th>
          <th>Abilitazione</th>
        </tr>
     	
     	<input id="submit" type="submit" value=""/>
    </table>
</form:form>
</body>
</html>