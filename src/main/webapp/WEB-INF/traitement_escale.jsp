<%@page import="com.octest.beans.*"%>
<%@page import="com.octest.forms.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Traitement escale</title>
<link rel="stylesheet" href="css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Rubik+Moonrocks&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@1,100&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/79caf21a61.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
</head>
<body style="background-color: #F9F1EF;">
	<!-- Modifier escale-->

	<%
	if (request.getParameter("numero") != null && request.getParameter("action").equals("modifyEscale")) {
		ServEscales service = (ServEscales) request.getAttribute("service");
		List<Navire> esc = (List<Navire>) request.getAttribute("liste");
		Escales nouveau = service.getEscale(request.getParameter("numero"));
    	SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");

	%>
	<div class="discussion" id="modify" tabindex="-1"
		aria-labelledby="Modify" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modifier un
						escale</h5>
					<a type="button" class="btn-close" aria-label="Close"
						href='<%=request.getContextPath() + "/escale"%>'></a>
				</div>
				<div class="modal-body form-register-body">
					<form method="post" action="traitement_escale?action=modifyEscale">
						<input name="numero"
							class="form-control rounded form-register-input" id="numero"
							value='<%out.println(nouveau.getNum());%>' aria-label="Search"
							aria-describedby="search-addon" readonly="readonly" /> <input
							name="date_deb" class="form-control rounded form-register-input"
							id="date_deb" value=<%out.println(ft.format(nouveau.getDebut()));%>
							aria-label="Search" aria-describedby="search-addon" type="date" /> <input
							name="date_f" class="form-control rounded form-register-input"
							id="date_f" value=<%out.println(ft.format(nouveau.getFin()));%>
							aria-label="Search" aria-describedby="search-addon" type="date" /> <select
							name="navire"  class="form-control rounded form-register-input"
							id="navire" aria-label="Search" aria-describedby="search-addon">
							<option value=<%out.println(nouveau.getNavire());%>  class="option" selected="selected" hidden=""><%out.println(nouveau.getNavire());%></option>
							<%
							for (Navire l : esc) {
							%>
							<option value="<%out.println(l.getNumero());%>">
								<%
								out.println(l.getNumero());
								%>
							</option>
							<%
							}
							%>
						</select> <input name="prix"
							class="form-control rounded form-register-input" id="prix"
							value=<%out.println(nouveau.getPrix());%> aria-label="Search"
							aria-describedby="search-addon" /> <a type="button"
							class="btn btn-secondary lien"
							href='<%=request.getContextPath() + "/escale"%>'>Annuler</a> <input
							type="submit" class="btn btn-primary" value="Valider" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>
	<%
	if (request.getParameter("numero") != null && request.getParameter("action").equals("suppEscale")) {
	%>
	<!-- Supprimer escale-->
	<div class="modification" id="Supp" tabindex="-1"
		aria-labelledby="Supp" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Supprimer un
						escale</h5>
					<a type="button" class="btn-close" aria-label="Close"
						href='<%=request.getContextPath() + "/escale"%>'></a>
				</div>
				<div class="modal-body form-register-body">
					<form method="post" action="traitement_escale?action=suppEscale">
						<i style="text-align: center;">&ecirc;tes-vous s&ucirc;r(e) de
							vouloir supprimer cet escale ? </i> <input name="numero"
							class="form-control rounded form-register-input" id="numero"
							value='<%out.println(request.getParameter("numero"));%>'
							aria-label="Search" aria-describedby="search-addon"
							readonly="readonly" /> <a type="button"
							class="btn btn-secondary lien"
							href='<%=request.getContextPath() + "/escale"%>'>Annuler</a> <input
							type="submit" class="btn btn-primary" value="Valider" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>
	<!-- voir bon -->
	<% if(request.getParameter("numero")!=null && request.getParameter("action").equals("seeBon")) {
		List<BonPilotage> liste=(List<BonPilotage>)request.getAttribute("liste");
    	SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
	%>
			<div class="table">
		<div class="source">
				<h3 class="nav">
					La liste des bons de l'escale numero :<%out.println(request.getParameter("numero")); %> <a  class="plus fa-solid fa-xmark lien"
								name="retour"
								href="<%=request.getContextPath() + "/escale"%>"></a>
								
				</h3>
				<table class='highlight'>
					<thead>
						<tr>
							<th>Poste</th>
							<th>Num&eacute;ro escale</th>
							<th>Code mouvement</th>
							<th>Date</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (BonPilotage nav : liste) {
						%>
						<tr>
							<td>
								<%
								out.println(nav.getPoste());
								%>
							</td>
							<td>
								<%
								out.println(nav.getEscale());
								%>
							</td>
							<td>
								<%
								out.println(nav.getId());
								%>
							</td>
							<td>
								<%
								out.println(ft.format(nav.getDate()));
								%>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
			</div>
	<%} %>
</body>
</html>