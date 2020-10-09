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
<form:form modelAttribute="attDisp" action="visualizzaAttivitaDisponibili" method="post" >
 <table border="1" cellspacing="0" cellpadding="10">
	
        <tr>
          <th>Id</th>
          <th>Descrizione</th>
          <th>Abilitazione</th>
          <th>Modifica Abilitazione</th>
           <th>Modifica Attività</th>   
        </tr>
	<c:forEach items="${attDisp}" var="attDisp">
        <tr>
          <th>${attDisp.id_Disp}</th>
          <th>${attDisp.descrizione}</th>
          <th>${attDisp.abilitazione}</th>
          <th><a href="aggiornaAbilitazioneAttivitaDisponibili?id=${attDisp.id_Disp}">Abilita/Disabilita</a></th>
          <th><a href="modificaAttivitaDisponibili1?id=${attDisp.id_Disp}">Modifica</a></th>    
        </tr>
     </c:forEach>       
    </table>
    <a href="aggiungiAttivitaDisponibili1">Aggiungi</a>
</form:form>
<a href= "menuAmministratore" >Torna indietro</a>
</body>
</html> 