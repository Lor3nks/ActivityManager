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
		<input class="btn btn-outline-primary" id="submit" type="submit" value="Salva"/>
	</p>
</form:form>
</body>
</html>