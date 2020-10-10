<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="ISO-8859-1">
<title>Elenco delle attività svolte</title>

<style type="text/css"><%@include file="/css/bootstrap.min.css"%></style>
<style type="text/css"><%@include file="/css/style.css"%></style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/jszip.min.js"></script>

<script type="text/javascript">
    jQuery(function ($) {
        $("#exportButton").click(function () {
            // parse the HTML table element having an id=exportTable
            var dataSource = shield.DataSource.create({
                data: "#exportTable",
                schema: {
                    type: "table",
                    fields: {
	                    'Impiegato': { type: String },
                        'Data': { type: String },
                        'Ora inizio': { type: String },
                        'Ora fine': { type: String },
                        'Attività': { type: String },
                        'Note': { type: String }
                    }
                }
            });
          // when parsing is done, export the data to PDF
            dataSource.read().then(function (data) {
                var pdf = new shield.exp.PDFDocument({
                    author: "PrepBootstrap",
                    created: new Date()
                });
                pdf.addPage("a4", "portrait");
                pdf.table(
                    50,
                    50,
                    data,
                    [
                     	{ field: "Impiegato", title: "Impiegato", width: 70 },
                        { field: "Data", title: "Data", width: 90 },
                        { field: "Ora inizio", title: "Ora inizio", width: 70 },
                        { field: "Ora fine", title: "Ora fine", width: 70 },
                        { field: "Attività", title: "Attività", width: 90 },
                        { field: "Note", title: "Note", width: 100 }
                    ],
                    {
                        margins: {
                            top: 20,
                            left: 20
                        }
                    }
                );
                pdf.saveAs({
                    fileName: "Attivita Svolte PDF"
                });
            });
        });
    });
</script>
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
        <a class="nav-link" href="tornaIndietro">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="visualizzaListaImpiegati">Visualizza lista impiegati</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="visualizzaAttivitaDisponibili">Visualizza attività disponibili</a>
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
		<h3>Elenco delle attività svolte</h3>
	</div>
	<div class="row">
		<p class="text-danger">${error}</p>
	</div>
	<div class="row">
<!-- 	<div class="col-sm-10 col-10"> -->
		<form action="aggiornaListaIntervallo" method="get">
			<label for="dataInizio">Da: </label>
			<input class="dataInput" type="date" name="dataInizio"/>
			<label for="dataFine">a: </label>
			<input class="dataInput" type="date" name="dataFine"/>
			<button type="submit" class="btn btn-sm btn-success">Aggiorna</button>
			<button id="exportButton" class="btn btn-sm btn-danger clearfix"><span class="fa fa-file-pdf-o"></span> Stampa PDF</button>
		</form>
		</div>
	<div class="row">
	<table id="exportTable" class="table table-hover table-striped">
	<thead>
		<tr>
			<th>Impiegato</th><th>Data</th><th>Ora inizio</th><th>Ora fine</th><th>Attività</th><th>Note</th><th>Elimina </th><th>Modifica </th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${attSvolte}" var="attSv">
		<tr>
		<td>${attSv.imp.username}</td>
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
	<div class="row">
			<a href="tornaIndietro"><button class="btn btn-outline-primary">Torna Al Menu</button></a> 
		</div>
	</div>
</body>
</html>