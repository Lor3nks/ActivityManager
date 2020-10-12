<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"> 
<title>Men� amministratore</title>
<style type="text/css"><%@include file="/css/bootstrap.min.css"%></style>
<style type="text/css"><%@include file="/css/style.css"%></style>
</head>
<body class="ATbackground">
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href=""><img id="logo" src="./images/ATlogo_min1.png"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse topText" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="visualizzaListaImpiegati">Lista impiegati</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="visualizzaAttivitaDisponibili">Attivit� disponibili</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="visualizzaAttivitaSvolte">Visualizza attivit�</a>
      </li>
    </ul> 
    <ul class="nav navbar-nav navbar-right">
       <li class="nav-item">
        <a class="nav-link" href="formCambiaPassword">Modifica password</a>
        </li>
      <li class="nav-item">
        <a class="nav-link" href="logout"><svg width="1.5em"  viewBox="0 0 16 16" class="bi bi-door-open" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M1 15.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13a.5.5 0 0 1-.5-.5zM11.5 2H11V1h.5A1.5 1.5 0 0 1 13 2.5V15h-1V2.5a.5.5 0 0 0-.5-.5z"/>
  <path fill-rule="evenodd" d="M10.828.122A.5.5 0 0 1 11 .5V15h-1V1.077l-6 .857V15H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117z"/>
  <path d="M8 9c0 .552.224 1 .5 1s.5-.448.5-1-.224-1-.5-1-.5.448-.5 1z"/>
</svg>Logout</a>
        </li>
    </ul>   
   </div>
</nav>

<div class="container">
	<div class="col-lg-3 col-sm-3 col-xs-3 col-2"></div>
	<div class="col-lg-6 col-sm-6 col-xs-6 col-8">
		<h1 class="spazioSu">Benvenuto/a, ${nomeUtente}</h1>
		
		
	</div>
	<div class="col-lg-3 col-sm-3 col-xs-3 col-2"></div>
</div>

</body>
</html>