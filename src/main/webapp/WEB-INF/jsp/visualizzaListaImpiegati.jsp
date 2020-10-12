<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>  
<style type="text/css"><%@include file="/css/bootstrap.min.css"%></style>
<style type="text/css"><%@include file="/css/style.css"%></style>
<meta charset="ISO-8859-1">
<title>Lista Impiegati</title>
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
      <li class="nav-item">
        <a class="nav-link active" href="#">Lista impiegati<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="visualizzaAttivitaDisponibili">Attività disponibili</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="visualizzaAttivitaSvolte">Visualizza attività</a>
      </li>
     
      
        
         </ul> 
    <ul class="nav navbar-nav navbar-right">
       <li class="nav-item">
        <a class="nav-link" href="formCambiaPassword">Modifica password</a>
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
		<div class="row rowLogin">
		<h3>Elenco degli impiegati</h3>
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>Username</th>
							<th>E-mail</th>
							<th>Nome</th>
							<th>Cognome</th>
							<th>Data di Nascita</th>
							<th>Abilitazione</th>
							<th>Ruolo</th>
							<th class="center">Modifica Dati</th>
							<th>Modifica Abilitazione</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${listaImpiegati}" var="impiegato">
						<tr>
							<td>${impiegato.username}</td>
							<td>${impiegato.email}</td>
							<td>${impiegato.nome}</td>
							<td>${impiegato.cognome}</td>
							<td>${impiegato.dataNascita}</td>
							<c:choose>
							<c:when test="${impiegato.abilitazione==true}">
							<td>Abilitato</td>
							</c:when>
							<c:otherwise>
							<td>Disabilitato</td>
							</c:otherwise>
							</c:choose>
							<td>${impiegato.ruolo}</td>
							<td class="center"><a href="modificaDatiImpStep1?userName=${impiegato.username}"><svg width="1.3em"  viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
</svg></a></td>
							<td><a href="modificaAbilitazioneImp?userName=${impiegato.username}">Abilitato/Disabilitato</a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
	
		</div>
		<div class="row">
			<a href="tornaIndietro"><button class="btn btn-outline-primary">Torna al menù</button></a> 
		</div>
		
		<div class="card bg-light mt-5">
		  <div class="card-body">
		    <h4 class="card-title">
		    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-envelope" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			  <path fill-rule="evenodd" d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383l-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z"/>
			</svg>
		    Invia Mail di Reset Password</h4>
		    
				<form id="sendEmailForm" method="post" action="sendEmail">
					<p class="card-text">
						<label for="resetTo">Reset password dell'Impiegato: </label>
						<input id="resetTo"	type="text" name="resetTo" size="25" placeholder="Username" />
						<input class="btn btn-sm btn-primary id="sendEmailBtn" type="submit" value="Invia" />
					</p>
				</form>
			
		  </div>
		</div>

	</div>
</body>
</html>