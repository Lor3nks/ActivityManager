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
<style type="text/css"><%@include file="/css/bootstrap.min.css"%></style>
<style type="text/css"><%@include file="/css/style.css"%></style>
</head>
<body> 
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href=""><img id="logo" src="./images/ATlogo_min1.png"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="visualizzaListaImpiegati">Visualizza lista impiegati</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="visualizzaAttivitaSvolte">Visualizza attività svolte</a>
      </li>
     
      
        
         </ul> 
    <ul class="nav navbar-nav navbar-right">
       <li class="nav-item">
        <a class="nav-link" href="formCambiaPassword">Modifica Password</a>
        </li>
      <li class="nav-item">
        <a class="nav-link" href="logout">Logout</a>
        </li>
    </ul>
      
        </div>
   
</nav>
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
    <a href="aggiungiAttivitaDisponibili1"><button class="btn btn-outline-primary">Aggiungi</button></a>
</form:form>
<a href="tornaIndietro"><button class="btn btn-outline-primary">Torna Al Menu</button></a> 
</body>
</html> 