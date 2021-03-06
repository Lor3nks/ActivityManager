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
      <li class="nav-item">
        <a class="nav-link" href="tornaIndietro">Home</a>
      </li>
      <c:choose>
      	<c:when test="${amministratore ne null}">
	      <li class="nav-item">
	         <a class="nav-link" href="visualizzaListaImpiegati">Lista impiegati</a>
	      </li>
	      <li class="nav-item">
        <a class="nav-link" href="visualizzaAttivitaDisponibili">Attivit? disponibili</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="visualizzaAttivitaSvolte">Visualizza attivit?</a>
      </li>
      	</c:when>
      	<c:otherwise>
      		<li class="nav-item">
	        <a class="nav-link" href="visualizzaAttivitaSvolteImpiegato">Visualizza attivit?</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="formAttivitaSvolte">Gestione attivit?</a>
	      </li>
      	</c:otherwise>
      </c:choose>
    </ul> 
    <ul class="nav navbar-nav navbar-right">
    	<li class="nav-item">
    		<a class="nav-link active" href="formCambiaPassword">Modifica password <span class="sr-only">(current)</span></a>
		</li>
      	<li class="nav-item">
        	<a class="nav-link" href="logout"><svg width="1.5em"viewBox="0 0 16 16" class="bi bi-door-open" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		  <path fill-rule="evenodd" d="M1 15.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13a.5.5 0 0 1-.5-.5zM11.5 2H11V1h.5A1.5 1.5 0 0 1 13 2.5V15h-1V2.5a.5.5 0 0 0-.5-.5z"/>
		  <path fill-rule="evenodd" d="M10.828.122A.5.5 0 0 1 11 .5V15h-1V1.077l-6 .857V15H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117z"/>
		  <path d="M8 9c0 .552.224 1 .5 1s.5-.448.5-1-.224-1-.5-1-.5.448-.5 1z"/>
		</svg>Logout</a>
        </li>
    </ul>   
   </div>
</nav>
<div class="container">
	<div class="row center rowLogin">
		<div class="col-lg-4 col-sm-3 col-xs-3 col-2"></div>
		<div class="col-lg-4 col-sm-6 col-xs-6 col-8">
			<h3>Cambia Password</h3>
		</div>
		<div class="col-lg-4 col-sm-3 col-xs-3 col-2"></div>
	</div>
	<div class="row center">
		<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-2"></div>
		<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 col-8">
			<h5 class="text-danger">${errore}</h5>
			<h5 class="text-success">${successo}</h5>
		</div>
		<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-2"></div>
	</div>
	<div class="row">
		<div class="col-xl-4 col-lg-4 col-sm-3 col-xs-3 col-3"></div>
		<div class="col-xl-4 col-lg-4 col-sm-6 col-xs-6 col-7">
			<div class="row">
				<div class="col-xl-4 col-lg-6 col-md-4 col-sm-6 col-xs-6 col-4">
					<p class="badge badge-warning">Username</p>
					<p class="badge badge-warning">Nome</p>
					<p class="badge badge-warning">Cognome</p>
					<p class="badge badge-warning">Data di nascita</p>
				</div>
				
				<div class="col-xl-8 col-lg-6 col-md-8 col-sm-6 col-xs-6 col-8 center">
					<p>${impiegato.username} ${amministratore.username}</p>
		
					<p>${impiegato.nome} ${amministratore.nome}</p>
					
					<p>${impiegato.cognome} ${amministratore.cognome}</p>
					
					<p>${dataNascita}</p>
				</div>
			</div>
			<form action="cambiaPassword" method="post">
				<div class="row">
					<div class="col-xl-11 col-lg-11 col-md-11 col-sm-11 col-xs-11 col-11 center">
					
						<label class="badge badge-primary" for="password"> Vecchia Password</label>
						<p>
							<input name="password" type="password" />
						</p>
						
						<label class="badge badge-primary" for="nuovaPassword"> Nuova Password</label> 
						<p>
							<input  name="nuovaPassword" type="password" />
						</p>

						<label class="badge badge-primary" for="confermaPassword"> Conferma Password</label>
						<p>
							 <input  name="confermaPassword" type="password" />
						</p>
						
						 <span id="buttons">
				        <input class="btn btn-success btn-sm" id="submit" type="submit" value="Salva"/> 
					 	</span>
					</div>
				</div>
			</form>
		
			<div class="row spazioSu">
				<div class="col-xl-11 col-lg-11 col-md-11 col-sm-11 col-xs-11 col-11 center">
					<a href="tornaIndietro"><button class="btn btn-outline-primary">Torna al men?</button></a>
				</div>
			</div>
		</div>
		<div class="col-xl-4 col-lg-4 col-sm-3 col-xs-3 col-2"></div>
	</div>
</div> 
</body>
</html>