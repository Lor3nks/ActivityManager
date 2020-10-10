<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrazione</title>
<style type="text/css"><%@includefile="/css/bootstrap.min.css"%></style>
<style type="text/css"><%@includefile="/css/style.css"%></style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href=""><img id="logo"
			src="./images/ATlogo_min1.png"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>


	</nav>
	<div class="container">
		<div class="row center">
			<div class="col-lg-4 col-sm-3 col-xs-3 col-2"></div>
			<div class="col-lg-4 col-sm-6 col-xs-6 col-8">
				<h3>Registrazione</h3>
			</div>
			<div class="col-lg-4 col-sm-3 col-xs-3 col-2"></div>
		</div>
		<div class="row">
			<div class="col-xl-3 col-lg-3 col-sm-2 col-xs-2 col-2"></div>
			<div class="col-xl-6 col-lg-6 col-sm-8 col-xs-8 col-7">
				<form:form modelAttribute="impiegato" action="registrazione"
					method="post">
					
					
					<div class="row">
					   <div class="col-xl-4 col-lg-6 col-md-4 col-sm-6 col-xs-6 col-4 center">
						<form:label path="username">Username</form:label>
					   </div>
					   <div class="col-xl-8 col-lg-6 col-md-8 col-sm-6 col-xs-6 col-8 center">
						<form:input path="username" type="text" />
					   </div>
					   <div class="col-xl-11 col-lg-11 col-md-11 col-sm-11 col-xs-11 col-11 center">
					    <h7 class="text-danger"> <p id="error" class="error">
						    <form:errors path="username" />
					     </p></h7>
					   </div>
                   </div>
                   
                   
                   <div class="row">
					   <div class="col-xl-4 col-lg-6 col-md-4 col-sm-6 col-xs-6 col-4 center">
						    <form:label path="password">Password</form:label>
					   </div>
					   <div class="col-xl-8 col-lg-6 col-md-8 col-sm-6 col-xs-6 col-8 center">
						    <form:input path="password" type="password" />
					   </div>
					   <div class="col-xl-11 col-lg-11 col-md-11 col-sm-11 col-xs-11 col-11 center">
					     <h7 class="text-danger"> <p id="error" class="error">
						    <form:errors path="password" />
					      </p> </h7>
					   </div>
                   </div>
                   
                   
                   <div class="row">
					   <div class="col-xl-4 col-lg-6 col-md-4 col-sm-6 col-xs-6 col-4 center">
						    <label>Conferma password</label>
					   </div>
					   <div class="col-xl-8 col-lg-6 col-md-8 col-sm-6 col-xs-6 col-8 center">
						    <input type="password" name="confermaPassword">
					   </div>
					   <div class="col-xl-11 col-lg-11 col-md-11 col-sm-11 col-xs-11 col-11 center">
					   <h7 class="text-danger"> <p id="error" class="error">
						    <form:errors path="password" />
					      </p> </h7>
					   </div>
                   </div>
                   
                   
                   <div class="row">
					   <div class="col-xl-4 col-lg-6 col-md-4 col-sm-6 col-xs-6 col-4 center">
						    <form:label path="email">Email</form:label>
					   </div>
					   <div class="col-xl-8 col-lg-6 col-md-8 col-sm-6 col-xs-6 col-8 center">
						    <form:input path="email" type="text" />
					   </div>
					   <div class="col-xl-11 col-lg-11 col-md-11 col-sm-11 col-xs-11 col-11 center">
					    <h7 class="text-danger"> <p id="error" class="error">
						 <form:errors path="email" />
					    </p></h7>
					   </div>
                   </div>
                   
                   
                   <div class="row">
					   <div class="col-xl-4 col-lg-6 col-md-4 col-sm-6 col-xs-6 col-4 center">
						    <form:label path="nome">Nome</form:label>
					   </div>
					   <div class="col-xl-8 col-lg-6 col-md-8 col-sm-6 col-xs-6 col-8 center">
						    <form:input path="nome" type="text" />
					   </div>
					   <div class="col-xl-11 col-lg-11 col-md-11 col-sm-11 col-xs-11 col-11 center">
					  <h7 class="text-danger">   <p id="error" class="error">
						<form:errors path="nome" />
					     </p></h7>
					   </div>
                   </div>
                   
                   
                    <div class="row">
					   <div class="col-xl-4 col-lg-6 col-md-4 col-sm-6 col-xs-6 col-4 center">
						    <form:label path="cognome">Cognome</form:label>
					   </div>
					   <div class="col-xl-8 col-lg-6 col-md-8 col-sm-6 col-xs-6 col-8 center">
						    <form:input path="cognome" type="text" />
					   </div>
					   <div class="col-xl-11 col-lg-11 col-md-11 col-sm-11 col-xs-11 col-11 center">
					   <h7 class="text-danger">  <p id="error" class="error">
						<form:errors path="cognome" />
				     	</p></h7>
					   </div>
                   </div>
                   
                   
                    <div class="row">
					   <div class="col-xl-4 col-lg-6 col-md-4 col-sm-6 col-xs-6 col-4 center">
						    <form:label path="dataNascita">Data di nascita</form:label>
					   </div>
					   <div class="col-xl-8 col-lg-6 col-md-8 col-sm-6 col-xs-6 col-8 center">
						    <form:input path="dataNascita" type="text"
							placeholder="GG/MM/AAAA" />
					   </div>
					   <div class="col-xl-11 col-lg-11 col-md-11 col-sm-11 col-xs-11 col-11 center">
					     
					<h7 class="text-danger"><p class="error">
						<form:errors path="dataNascita" />
					</p></h7>
					   </div>
                   </div>

					<form:hidden path="abilitazione" value="true" />
					<form:hidden path="ruolo" value="impiegato" />


                   <div class="row">
					  <div class="col-xl-11 col-lg-11 col-md-11 col-sm-11 col-xs-11 col-11 center">
						<p>
							<button class="btn btn-outline-success" type="submit">Registrati</button>
						</p>
					 </div>
				   </div>
					
				</form:form>

				<div class="row">
					<div class="col-xl-11 col-lg-11 col-md-11 col-sm-11 col-xs-11 col-11 center">
						<p>
							Se sei già registrato, effettua il <a href="login"><button
									class="btn btn-outline-primary">login</button></a>
						</p>
					</div>
				</div>


			</div>
			<div class="col-xl-3 col-lg-4 col-sm-3 col-xs-3 col-3"></div>
		</div>

	</div>
</body>
</html>