<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="ISO-8859-1">
<title>Attivit? svolte</title>
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
        <a class="nav-link" href="visualizzaAttivitaSvolteImpiegato">Visualizza attivit?</a>
      </li>
      <li class="nav-item">
		<a class="nav-link active" href="#">Gestione attivit? <span class="sr-only">(current)</span></a>
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

<h3>Inserisci un'attivit? svolta</h3>
<div class="error text-danger">${errore}</div>

	<form:form modelAttribute="attivitaSvolte"
		action="salvaAttivitaSvolte" method="post">
		<label for="data_Attivita">Data attivit?: </label>
			<p><form:input type="hidden" id="id_Trigg" path="id_Trigg"
				autocomplete="off" />
			<form:input type="date" id="data_Attivita" path="data_Attivita"
				autocomplete="off" /></p>
		<p id="error" class="text-danger">
			<form:errors path="data_Attivita" />
		</p>
	 
		<label for="ora_Inizio">Ora inizio: </label>
		<p>
			<form:input type="time" id="ora_Inizio" path="ora_Inizio"
				autocomplete="off" /></p>
		<p class="text-danger"><form:errors path="ora_Inizio" />
		</p>
	
	
			<label for="ora_Fine">Ora fine: </label>
			<p><form:input type="time" id="ora_Fine" path="ora_Fine"
				autocomplete="off" /></p>
		<p class="text-danger">
			<form:errors path="ora_Fine" />
		</p>

			<label for="att_Disp">Attivit? disponibili: </label>
		<p>
			<form:select id="att_Disp" path="att_Disp.id_Disp"
				items="${att_Disp}" itemValue="id_Disp" itemLabel="descrizione">
			</form:select></p>
		<p class="text-danger">
			<form:errors path="att_Disp.id_Disp" />
		</p>

		<label for="note">Note:</label>
		<p>
			<form:textarea id="note" path="note" rows="3" cols="20" maxlength="50"></form:textarea>
		</p>

		<p id="buttons">
			<!-- <a href="salvaAttivitaS"><input type="button" value="Salva" style="color:black" /></a>  -->
			<input class="btn btn-outline-success" id="submit" type="submit"
				value="Salva" />
		</p>
	</form:form>
	<p><a href="tornaIndietro"><button style="margin-top:15px;" class="btn btn-outline-primary">Torna al men?</button></a></p>
	</div>
	<div class="col-lg-4 col-sm-3 col-xs-3 col-2"></div>
	</div>
 
</div>
</body>
</html>