<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="ISO-8859-1">
<title>Le mie attività svolte</title>
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
        <a class="nav-link" href="formAttivitaSvolte">Gestione Attività Svolte</a>
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
	<h3>Le mie attività svolte</h3>
	
	<table id="exportTable" class="table table-hover table-striped">
	<thead>
		<tr>
			<th>Impiegato</th><th>Data</th><th>Ora inizio</th><th>Ora fine</th><th>Attività</th><th>Note</th><th>Elimina</th><th>Modifica</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${attSvolte}" var="attSv">
		<tr>
		<td>${impiegato.username}</td>
		<td>${attSv.data_Attivita}</td>
		<td>${attSv.ora_Inizio}</td>
		<td>${attSv.ora_Fine}</td>
		<td>${attSv.getAtt_Disp().getDescrizione()}</td>
		<td>${attSv.note}</td>
		<td><a type="submit"  href="cancellaAttivitaSvolte?id=${attSv.id_Trigg}">elimina</a></td>
		<td><a type="submit"  href="aggiornaAttivitaSvolte?id=${attSv.id_Trigg}">modifica</a></td>
		</tr>
		</c:forEach>
		</tbody> 
	</table>
	<a href="tornaIndietro"><button class="btn btn-outline-primary">Torna Al Menu</button></a> 
	</div>
</div>
</body>
</html>