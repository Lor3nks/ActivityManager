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
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
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
		<div class="row">
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
							<th>Modifica</th>
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
							<td><a href="modificaDatiImpStep1?userName=${impiegato.username}">Modifica</a></td>
							<td><a href="modificaAbilitazioneImp?userName=${impiegato.username}">Abilita Si/No</a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
	
		</div>
		<div class="row">
			<a href="tornaIndietro"><button class="btn btn-outline-primary">Torna Al Menu</button></a> 
		</div>
		<div class="row">
			<div style="margin-top: 50px">

				<form id="sendEmailForm" method="post" action="sendEmail">
					<label for="resetTo">Reset password dell'utente: </label> <input id="resetTo"
						type="text" name="resetTo" size="25"
						placeholder="Username" /> <input id="sendEmailBtn"
						type="submit" value="Invia" />

				</form>

			</div>
		</div>
	</div>
</body>
</html>