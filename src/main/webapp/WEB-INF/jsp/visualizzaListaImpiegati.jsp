<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>  
<meta charset="ISO-8859-1">
<title>Lista Impiegati</title>
</head>
<body>
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
							<td><a href="">Modifica</a></td>
							<td><a href="modificaAbilitazioneImp?userName=${impiegato.username}">Abilita Si/No</a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
	
		</div>
		<div class="row">
			<a href="menuAmministratore">Torna indietro</a>
		</div>
		<div class="row">
			<div style="margin-top: 50px">

				<form id="sendEmailForm" method="post" action="sendEmail">
					<label for="mailTo">Invia pwd a: </label> <input id="mailTo"
						type="text" name="mailTo" size="25"
						placeholder="impiegato@mail.com" /> <input id="sendEmailBtn"
						type="submit" value="Invia" />

				</form>

			</div>
		</div>
	</div>
</body>
</html>