<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="ISO-8859-1">
<title>Attività svolte</title>
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
        <a class="nav-link" href="tornaIndietro">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="visualizzaAttivitaSvolteImpiegato">Visualizza Attività</a>
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
<div class="row center">
		<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-2"></div>
		<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 col-8">
			<h3>Inserisci un'attività svolta</h3>
		</div>
		<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-2"></div>
	</div>
	<div class="row center">
		<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-2"></div>
		<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 col-8">
			<h5 class="text-danger">${errore}</h5>
		</div>
		<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-2"></div>
	</div>
	<div class="row"> 
		<div class="col-xl-4 col-lg-4 col-md-3 col-sm-2 col-xs-2 col-1"></div>
		<div class="col-xl-4 col-lg-4 col-md-6 col-sm-8 col-xs-8 col-10">
			<form:form modelAttribute="attivitaSvolte" action="salvaAttivitaSvolte"  method="post">
				<div class="row">
					<div class="col-xl-5 col-lg-6 col-md-5 col-sm-5 col-xs-5 col-5">
						<label for="data_Attivita">Data attività: </label>
						<p id="error" class="error"><form:errors path="data_Attivita" /></p>	
						 
						<label for="ora_Inizio">Ora inizio: </label>
						<p class="error"><form:errors path="ora_Inizio" /></p>
						 
						<label for="ora_Fine">Ora fine: </label>
						<p class="error"><form:errors path="ora_Fine" /></p>
						
						<p><label for="att_Disp">Attività disponibili:</label></p>
						
						<p><label for="ora_Fine">Note:</label></p>
					</div>
					
					<div class="col-xl-7 col-lg-6 col-md-7 col-sm-7 col-xs-7 col-7">
						<p>
							<form:input type="date" id="data_Attivita" path="data_Attivita" autocomplete="off"/>
						</p>
						<p>
				   			<form:input type="time" id="ora_Inizio" path="ora_Inizio" autocomplete="off"/>
						</p>
						<p>
				   			 <form:input type="time" id="ora_Fine" path="ora_Fine" autocomplete="off"/>
						</p>
						<p>
							<form:select  id="att_Disp" path="att_Disp.id_Disp" items="${att_Disp}" itemValue="id_Disp" itemLabel="descrizione" >
					</form:select>
						</p>
						<p>
							<form:textarea id="note" path="note" rows="4" cols="25"></form:textarea>
						</p>
					</div>
	 			</div>
	 			<div class="row">
	 				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 center">
					<span id="buttons ">
				        <input class="btn btn-outline-success" id="submit" type="submit" value="Salva"/> 
					</span>
					</div>
				</div>
			</form:form>
		</div>
		<div class="col-xl-4 col-lg-4 col-md-3 col-sm-2 col-xs-2 col-1"></div>
	</div>
	<div class="row spazioSu">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 center">
			<a href="tornaIndietro"><button class="btn btn-outline-primary">Torna al menù</button></a>
		</div>
	</div> 
</div>
</body>
</html>