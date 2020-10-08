<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="ISO-8859-1">
<title>Modifica Impiegato</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
			<h3>${errore}</h3>
				<form:form modelAttribute="impiegato" action="modificaDatiImpStep2" method="post">
					<form:input path="username" type="hidden"/>
					<form:input path="password" type="hidden"/>
					<form:input path="abilitazione" type="hidden"/>
														
					<p><form:label path="nome">Nome</form:label>
					<form:input path="nome" type="text"/></p>
					
					<p><form:label path="cognome">Cognome</form:label>
					<form:input path="cognome" type="text"/></p>
					
					<p><form:label path="dataNascita">Data di nascita</form:label>
					<form:input path="dataNascita" type="text" placeholder="GG/MM/AAAA"/></p>
					 <p class="error"><form:errors path="dataNascita" /></p>
					
					<p><form:label path="email">Email</form:label>
					<form:input path="email" type="text"/></p>					

					<p>
						<label for="ruolo">Ruolo: </label>
						<form:select name="ruolo" path="ruolo">
						<c:forEach items="${ruoloList}" var="ruolo">
						<c:choose>
						<c:when test="${impiegato.ruolo.equals(ruolo)}">
							<option selected="selected" value="${ruolo}">${ruolo}</option>
						</c:when>
						<c:otherwise>
							<option value="${ruolo}">${ruolo}</option>
						</c:otherwise>
						</c:choose>
						</c:forEach>
						</form:select>

						<!-- <p class="error"><form:errors path="ruolo" /></p>  -->
					</p>

					<button type="submit">Salva modifiche</button>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>