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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
<div class="container">
	<div class="row">
	<h3>Le mie attività svolte</h3>
	
	<table id="exportTable" class="table table-hover table-striped">
	<thead>
		<tr>
			<th>Impiegato</th><th>Data</th><th>Ora inizio</th><th>Ora fine</th><th>Attività</th><th>Note</th><th>DEL </th><th>MOD </th>
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
	</div>
</div>
</body>
</html>