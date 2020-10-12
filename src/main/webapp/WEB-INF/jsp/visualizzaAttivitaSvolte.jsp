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
      <li class="nav-item">
        <a class="nav-link" href="tornaIndietro">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="visualizzaListaImpiegati">Lista impiegati</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="visualizzaAttivitaDisponibili">Attività disponibili</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="#">Visualizza attività <span class="sr-only">(current)</span></a>
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
			<th>Impiegato</th><th>Data</th><th>Ora inizio</th><th>Ora fine</th><th>Attività</th><th>Note</th><th class="center">Elimina </th><th class="center">Modifica </th>
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
		<td class="center"><a type="submit"  href="cancellaAttivitaSvolte?id=${attSv.id_Trigg}"><svg width="1.7em" viewBox="0 0 16 16" class="bi bi-x" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
</svg></a></td>
		<td class="center"><a type="submit"  href="aggiornaAttivitaSvolte?id=${attSv.id_Trigg}"><svg width="1.3em"  viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
</svg></a></td>
		</tr>
		</c:forEach>
		</tbody> 
	</table>
	</div>
	<div class="row">
			<a href="tornaIndietro"><button class="btn btn-outline-primary">Torna al menù</button></a> 
		</div>
	</div>
</body>
</html>