<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attivita Disponibili</title>
</head>
<body>
<form:form modelAttribute="attivitaDisponibili" action="" method="post" >
 <table border="1" cellspacing="0" cellpadding="10">
	
        <tr>
          <th>Id</th>
          <th>Descrizione</th>
          <th>Abilitazione</th>
          <th>Modifica</th>
          <th>Cancella</th>
        </tr>

        <tr>
          <th>${attivitaDisponibili.id}</th>
          <th>${attivitaDisponibili.descrizione}</th>
          <th>${attivitaDisponibili.abilitazione}</th>
          <th><a href="">Modifica</a></th>
          <th><a href="">Cancella</a></th>
        </tr>
     	
         <input id="submit" type="submit" value=""/>
       
    </table>
    <br>

    <button type="submit">Aggiungi</button>
</form:form>

</body>
</html>