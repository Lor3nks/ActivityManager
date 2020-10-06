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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/Content/font-awesome/css/font-awesome.min.css" />

<link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light/all.min.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
<div class="container">
	<div class="row">
	<h3>Elenco delle attività svolte</h3>
	
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
<button id="exportButton" class="btn btn-sm btn-danger clearfix"><span class="fa fa-file-pdf-o"></span> Stampa PDF</button>
</div>
</body>
</html>