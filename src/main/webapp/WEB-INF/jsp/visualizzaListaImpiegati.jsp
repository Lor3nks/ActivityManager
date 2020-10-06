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
			<form:form modelAttribute="listaImpiegato" action="" method="post">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>Username</th>
							<th>Password</th>
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
						<tr>
							<th>${impiegato.username}</th>
							<th>${impiegato.password}</th>
							<th>${impiegato.email}</th>
							<th>${impiegato.nome}</th>
							<th>${impiegato.cognome}</th>
							<th>${impiegato.dataNascita}</th>
							<th>${impiegato.abilitazione}</th>
							<th>${impiegato.ruolo}</th>
							<th><a href="">Modifica</a></th>
						</tr>
					</tbody>
				</table>
			</form:form>
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