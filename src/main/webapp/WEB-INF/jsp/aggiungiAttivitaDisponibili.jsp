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
        <a class="nav-link" href="tornaIndietro">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="visualizzaListaImpiegati">Visualizza lista impiegati</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="visualizzaAttivitaDisponibili">Visualizza attività disponibili</a>
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
<div class="container">
<div class="rowLogin row">
<div class="col-lg-4 col-sm-3 col-xs-3 col-2"></div>
<div class="col-lg-4 col-sm-6 col-xs-6 col-8">

<h3>Inserisci attività disponibili</h3>

<div class="error text-danger">${errore}</div>

	<form:form modelAttribute="attivitaDisponibili" action="aggiungiAttivitaDisponibili2" method="post" >
 
 		<label  for="id_Disp">Id Attività: </label>
 		<p><form:input placeholder ="ID" maxlength="4" type="text" id="id_Disp" path="id_Disp" autocomplete="off"/></p>
	    <p id="error" class="error text-danger"><form:errors path="id_Disp" /></p>
	
	    <label  for="descrizione">Descrizione: </label>
	    <p><form:input placeholder ="descrizione" maxlength="20" type="text" id="descrizione" path="descrizione" autocomplete="off"/></p>
	    <p id="error" class="error text-danger"><form:errors path="descrizione" /></p>
	  
		<form:hidden id="abilitazione" path="abilitazione" autocomplete="off" value="1"/>
	
		<input class="btn btn-outline-success" type="submit" value="Salva"/>
      
	</form:form>

	<p><a href="tornaIndietro"><button style="margin-top:15px;" class="btn btn-outline-primary">Torna al menù</button></a></p>

	</div>
	<div class="col-lg-4 col-sm-3 col-xs-3 col-2"></div>
	</div>
</div>
</body>
</html> 