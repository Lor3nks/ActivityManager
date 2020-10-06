<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attività svolte</title>
</head>
<body>

	<table>
		<tr>
			<th>Data </th><th>Ora inizio </th><th>Ora fine </th><th>Attività </th><th>Note </th><th>DEL </th><th>MOD </th>
		</tr>
		<c:forEach items="${attSvolte}" var="attSv">
		<tr>
		<td>${attSv.data_Attivita}</td>
		<td>${attSv.ora_Inizio}</td>
		<td>${attSv.ora_Fine}</td>
		<td>${attSv.getAtt_Disp().getDescrizione()}</td>
		<td>${attSv.note}</td>
		<td><a type="submit"  href="cancellaAttivitaSvolte?id=${attSv.id_Trigg}">elimina</a></td>
		<td><a type="submit"  href="aggiornaAttivitaSvolte?id=${attSv.id_Trigg}">modifica</a></td>
		</tr>
		</c:forEach> 
	</table>

</body>
</html>