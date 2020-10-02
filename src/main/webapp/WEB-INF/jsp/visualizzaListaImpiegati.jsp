<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista Impiegati</title>
</head>
<body>

<div>	
<form:form modelAttribute="listaImpiegato" action="" method="post" >
 <table border="1" cellspacing="0" cellpadding="10">
	
        <tr>
          <th>Username</th>
          <th>Password</th>
          <th>E-mail</th>
          <th>Nome</th>
          <th>Cognome</th>
          <th>Data di Nascita</th>
          <th>Abilitazione</th>
          <th>Ruolo</th>
          <th>Modifica</th>
        </tr>
        
         <tr>
          <th>${Impiegato.username} </th>
          <th>${Impiegato.password}</th>
          <th>${Impiegato.email}</th>
          <th>${Impiegato.nome}</th>
          <th>${Impiegato.cognome}</th>
          <th>${Impiegato.data_nascita}</th>
          <th>${Impiegato.abilitazione}</th>
          <th>${Impiegato.ruolo}</th>
          <th><a href="">Modifica</a></th>
        </tr>
        </table>
   </form:form>
<a href= "menuAmministratore" >Torna indietro</a>
</div>
<div style="border-top: 50px">
	
	<form id="sendEmailForm" method="post" action="sendEmail">
		<label for="mailTo">Invia pwd a: </label>
		<input id="mailTo" type="text" name="mailTo" size="60" placeholder="impiegato@mail.com"/>
		<input id="sendEmailBtn" type="submit" value="Invia" />
	
	</form>
	
</div>
</body>
</html>