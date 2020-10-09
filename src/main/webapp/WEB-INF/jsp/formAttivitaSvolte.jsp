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
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
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
<p>${errore}</p>
<form:form modelAttribute="attivitaSvolte" action="salvaAttivitaSvolte"  method="post">
	<p>
	    <label for="data_Attivita">Data attività: </label>
	    <form:input type="text" id="data_Attivita" path="data_Attivita" autocomplete="off"/>
	    <p id="error" class="error"><form:errors path="data_Attivita" /></p>	
	</p>
	<p>
	    <label for="ora_Inizio">Ora inizio: </label>
	    <form:input type="text" id="ora_Inizio" path="ora_Inizio" autocomplete="off"/>
	    <p class="error"><form:errors path="ora_Inizio" /></p>
	</p>
	<p>
	    <label for="ora_Fine">Ora fine: </label>
	    <form:input type="text" id="ora_Fine" path="ora_Fine" autocomplete="off"/>
	    <p class="error"><form:errors path="ora_Fine" /></p>
	</p>
	
	<p>
		<label for="att_Disp">Attività disponibili: </label>
		<form:select  id="att_Disp" path="att_Disp.id_Disp" items="${att_Disp}" itemValue="id_Disp" itemLabel="descrizione" >
		</form:select>
		<!-- <p class="error"><form:errors path="att_Disp.id_Disp" /></p>  -->
	</p>

	<p>
	<label for="ora_Fine">Note:</label>
	<form:textarea id="note" path="note" rows="4" cols="50"></form:textarea>
	</p>
			 
	 <span id="buttons ">
		<!-- <a href="salvaAttivitaS"><input type="button" value="Salva" style="color:black" /></a>  -->
        <input class="btn btn-outline-primary" id="submit" type="submit" value="Salva"/> 
	 </span>
	  
</form:form>
<a href="tornaIndietro"><button class="btn btn-outline-primary">Torna Al Menu</button></a> 
</body>
</html>