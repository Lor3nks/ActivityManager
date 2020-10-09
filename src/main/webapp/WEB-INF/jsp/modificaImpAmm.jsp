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
	<div class="container">
		<div class="row">
			<div class="col">
			<h3>${errore}</h3>
				<form:form modelAttribute="impiegato" action="modificaDatiImpStep2" method="post">
					<form:input path="username" type="hidden"/>
					<form:input path="password" type="hidden"/>
					<form:input path="abilitazione" type="hidden"/>
														
					<p><form:label path="nome">Nome</form:label>
					<form:input path="nome" type="text"/></p>
					<p id="error" class="error"><form:errors path="nome" /></p>
					
					<p><form:label path="cognome">Cognome</form:label>
					<form:input path="cognome" type="text"/></p>
					<p id="error" class="error"><form:errors path="cognome" /></p>
					
					<p><form:label path="dataNascita">Data di nascita</form:label>
					<form:input path="dataNascita" type="text" placeholder="GG/MM/AAAA"/></p>
					 <p class="error"><form:errors path="dataNascita" /></p>
					
					<p><form:label path="email">Email</form:label>
					<form:input path="email" type="text"/></p>
					<p id="error" class="error"><form:errors path="email" /></p>					

					<p>
						<label for="ruolo">Ruolo: </label>
						<form:select name="ruolo" path="ruolo">
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

					<button class="btn btn-outline-primary" type="submit">Salva modifiche</button>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>