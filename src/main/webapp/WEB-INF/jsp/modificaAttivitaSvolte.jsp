<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attività svolte</title>
<style type="text/css">
<%@ include file="/css/bootstrap.min.css"%>
</style>
<style type="text/css">
<%@include file="/css/style.css"%>
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href=""><img id="logo" src="./images/ATlogo_min1.png"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="tornaIndietro">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="visualizzaAttivitaSvolteImpiegato">Visualizza Attività</a></li>
				<li class="nav-item"><a class="nav-link"
					href="formAttivitaSvolte">Gestione Attività Svolte</a></li>

			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="nav-item"><a class="nav-link"
					href="formCambiaPassword">Modifica Password</a></li>
				<li class="nav-item"><a class="nav-link" href="logout">Logout</a>
				</li>
			</ul>

		</div>


	</nav>

<div class="container">
<div class="rowLogin row">
<div class="col-lg-4 col-sm-3 col-xs-3 col-2"></div>
<div class="col-lg-4 col-sm-6 col-xs-6 col-8">

<h3>Modifica le attività svolte</h3>
<div class="error">${errore}</div>

	<form:form modelAttribute="attivitaSvolte"
		action="aggiornaSuDBAttivitaSvolte" method="post">
		<label for="data_Attivita">Data attività: </label>
			<p><form:input type="hidden" id="id_Trigg" path="id_Trigg"
				autocomplete="off" />
			<form:input type="text" id="data_Attivita" path="data_Attivita"
				autocomplete="off" /></p>
		<p id="error" class="error">
			<form:errors path="data_Attivita" />
		</p>
	
		<label for="ora_Inizio">Ora inizio: </label>
		<p>
			<form:input type="time" id="ora_Inizio" path="ora_Inizio"
				autocomplete="off" /></p>
		<p class="error"><form:errors path="ora_Inizio" />
		</p>
	
	
			<label for="ora_Fine">Ora fine: </label>
			<p><form:input type="time" id="ora_Fine" path="ora_Fine"
				autocomplete="off" /></p>
		<p class="error">
			<form:errors path="ora_Fine" />
		</p>

			<label for="att_Disp">Attività disponibili: </label>
		<p>
			<form:select id="att_Disp" path="att_Disp.id_Disp"
				items="${att_Disp}" itemValue="id_Disp" itemLabel="descrizione">
			</form:select></p>
		<p class="error">
			<form:errors path="att_Disp.id_Disp" />
		</p>

		<label for="ora_Fine">Note:</label>
		<p>
			<form:textarea id="note" path="note" rows="4" cols="50"></form:textarea>
		</p>

		<p id="buttons">
			<!-- <a href="salvaAttivitaS"><input type="button" value="Salva" style="color:black" /></a>  -->
			<input class="btn btn-outline-primary" id="submit" type="submit"
				value="Salva" />
		</p>
	</form:form>
	<p><a href="tornaIndietro"><button style="margin-top:15px;" class="btn btn-outline-primary">Torna Al Menu</button></a></p>
	</div>
	<div class="col-lg-4 col-sm-3 col-xs-3 col-2"></div>
	</div>
</div>
</body>
</html>