<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Portale Dell'Impiegato</title>
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
        <a class="nav-link" href="#"><span class="topText">Home </span><span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="visualizzaAttivitaSvolteImpiegato"><span class="topText">Visualizza attività</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="formAttivitaSvolte"><span class="topText">Gestione attività</span></a>
      </li>
    </ul>      
         
         
    <ul class="nav navbar-nav navbar-right">
       <li class="nav-item">
        <a class="nav-link" href="formCambiaPassword"><span class="topText">Modifica password</span></a>
        </li>
      <li class="nav-item">
        <a class="nav-link" href="logout"><span class="topText">Logout</span></a>
        </li>
    </ul>
  </div>
</nav>

<div class="container">
	<div class="col-lg-3 col-sm-3 col-xs-3 col-2"></div>
	<div class="col-lg-6 col-sm-6 col-xs-6 col-8">
		<h1 class="spazioSu">Benvenuto, ${nomeUtente}</h1>
		
		
	</div>
	<div class="col-lg-3 col-sm-3 col-xs-3 col-2"></div>
</div>




</body>
</html> 