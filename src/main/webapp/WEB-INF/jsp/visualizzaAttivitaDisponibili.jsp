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
      <li class="nav-item">
        <a class="nav-link" href="tornaIndietro">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="visualizzaListaImpiegati">Lista impiegati</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="#">Attività disponibili  <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="visualizzaAttivitaSvolte">Visualizza attività</a>
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
	<div class="row rowLogin">
	<h3>Attività disponibili</h3>
	</div>
		<div class="row">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
			          <th>Id</th>
			          <th>Descrizione</th>
			          <th>Abilitazione</th>
			          <th class="center">Modifica Abilitazione</th>
			           <th class="center">Modifica Attività</th>   
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
          
          <td class="center"><a href="aggiornaAbilitazioneAttivitaDisponibili?id=${attDisp.id_Disp}">Abilita/Disabilita</a></td>
          <td class="center"><a href="modificaAttivitaDisponibili1?id=${attDisp.id_Disp}"><svg width="1.3em"  viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
</svg></a></td>    
        </tr>
     </c:forEach>    
     </tbody>   
    </table>


<a href="aggiungiAttivitaDisponibili1"><button class="btn btn-outline-primary">Aggiungi</button></a>
<a href="tornaIndietro"><button style="margin-left:15px;" class="btn btn-outline-primary">Torna al menù</button></a>
</div>
</div> 
</body>
</html> 