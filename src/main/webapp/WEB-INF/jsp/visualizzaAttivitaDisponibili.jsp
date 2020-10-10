<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">  
<title>Attivita Disponibili</title>
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
	<h3>Attività disponibili</h3>
		<div class="row">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
			          <th>Id</th>
			          <th>Descrizione</th>
			          <th>Abilitazione</th>
			          <th>Modifica Abilitazione</th>
			           <th>Modifica Attività</th>   
        			</tr>
        		</thead>
			<tbody>
  
	<c:forEach items="${attDisp}" var="attDisp">
        <tr>
          <td>${attDisp.id_Disp}</td>
          <td>${attDisp.descrizione}</td>

		<c:choose>
		<c:when test="${attDisp.abilitazione==1}">
		<td>Abilitato</td>
		</c:when>
		<c:otherwise>
		<td>Disabilitato</td>
		</c:otherwise>
		</c:choose>
          
          <td><a href="aggiornaAbilitazioneAttivitaDisponibili?id=${attDisp.id_Disp}">Abilita/Disabilita</a></td>
          <td><a href="modificaAttivitaDisponibili1?id=${attDisp.id_Disp}">Modifica</a></td>    
        </tr>
     </c:forEach>    
     </tbody>   
    </table>


<a href="aggiungiAttivitaDisponibili1"><button class="btn btn-outline-primary">Aggiungi</button></a>
<a href="tornaIndietro"><button class="btn btn-outline-primary">Torna Al Menu</button></a> 
</body>
</html> 