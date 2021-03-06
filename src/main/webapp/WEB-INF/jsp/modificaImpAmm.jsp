<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="ISO-8859-1">
<title>Modifica Impiegato</title>
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
      <li class="nav-item">
        <a class="nav-link active" href="visualizzaListaImpiegati">Lista impiegati <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="visualizzaAttivitaDisponibili">Attivit? disponibili</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="visualizzaAttivitaSvolte">Visualizza attivit?</a>
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
<div class="rowLogin row">
<div class="col-lg-4 col-sm-3 col-xs-3 col-2"></div>
<div class="col-lg-4 col-sm-6 col-xs-6 col-8">

<h3>Modifica i dati dell'Impiegato</h3>
<div class="error text-danger">${errore}</div>
				<form:form modelAttribute="impiegato" action="modificaDatiImpStep2" method="post">
					<form:input path="username" type="hidden"/>
					<form:input path="password" type="hidden"/>
					<form:input path="abilitazione" type="hidden"/>
														
					<form:label path="nome">Nome</form:label>
					<p><form:input path="nome" type="text"/></p>
					<p id="error" class="text-danger"><form:errors path="nome" /></p>
					
					<form:label path="cognome">Cognome</form:label>
					<p><form:input path="cognome" type="text"/></p>
					<p id="error" class="text-danger"><form:errors path="cognome" /></p>
					
					<form:label path="dataNascita">Data di nascita</form:label>
					<p><form:input path="dataNascita" type="date" placeholder="GG/MM/AAAA"/></p>
					 <p class="text-danger"><form:errors path="dataNascita" /></p>
					
					<form:label path="email">Email</form:label>
					<p><form:input path="email" type="text"/></p>
					<p id="error" class="text-danger"><form:errors path="email" /></p>					

					
						<label for="ruolo">Ruolo: </label>
						<p><form:select name="ruolo" path="ruolo">
						<c:forEach items="${ruoloList}" var="ruolo">
						<c:choose>
						<c:when test="${impiegato.ruolo.equals(ruolo)}">
							<option selected="selected" value="${ruolo}">${ruolo}</option>
						</c:when>
						<c:otherwise>
							<option value="${ruolo}">${ruolo}</option>
						</c:otherwise>
						</c:choose>
						</c:forEach>
						</form:select>

					</p>

					<p><button class="btn btn-outline-success" type="submit">Salva modifiche</button></p>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>