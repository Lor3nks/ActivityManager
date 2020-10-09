<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cambia Password</title>
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
        <a class="nav-link" href="visualizzaAttivitaSvolteImpiegato">Visualizza Attività</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="formAttivitaSvolte">Gestione Attività Svolte</a>
      </li>
     
      
        
         </ul> 
    <ul class="nav navbar-nav navbar-right">
      <li class="nav-item">
        <a class="nav-link" href="logout">Logout</a>
        </li>
    </ul>
      
        </div>
   
 
</nav>
	<h3>${errore}</h3>
	<h1>Cambia Password</h1>
	
		
		
			<p> ${impiegato.username}</p>
		

		
			<p>Nome: ${impiegato.nome}</p>
		

		
			<p>Cognome: ${impiegato.cognome}</p>
		

		
			<p>Data di Nascita: ${impiegato.dataNascita}</p>

		
		<form action="cambiaPassword"
		method="post">
		<p>
		<label for="password"> Vecchia Password</label>
		<input  name="password" type="text" />
		</p>
		<p>
			<label for="password"> Nuova Password</label> 
			<input  name="nuovaPassword"	type="text" />
		</p>
		<p>
			<label for="password"> Conferma Password</label>
			 <input  name="confermaPassword" type="text" />
		</p>
		<p>
		
		 <span id="buttons ">
		<!-- <a href="salvaAttivitaS"><input type="button" value="Salva" style="color:black" /></a>  -->
        <input class="btn btn-outline-primary" id="submit" type="submit" value="Salva"/> 
	 </span>
			
	</form>
	<a href="tornaIndietro"><button class="btn btn-outline-primary">Torna Al Menu</button></a> 
	</body>
</html>