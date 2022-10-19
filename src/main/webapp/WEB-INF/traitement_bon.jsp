<%@page import="com.octest.beans.*"%>
<%@page import="com.octest.forms.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Traitement bon</title>
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
	<!-- Modifier bon-->

	<%
	if (request.getParameter("poste") != null && request.getParameter("action").equals("modifyBon")) {
		ServPilotage service = (ServPilotage) request.getAttribute("service");
		List<Escales> esc = (List<Escales>) request.getAttribute("escale");
		List<TypeMouvement> mvt = (List<TypeMouvement>) request.getAttribute("mouv");
		BonPilotage nouveau = service.getBon(request.getParameter("poste"));
		SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");

	%>
	<div class="discussion" id="modify" tabindex="-1"
		aria-labelledby="Modify" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modifier un
						bon </h5>
					<a type="button" class="btn-close" aria-label="Close"
						href='<%=request.getContextPath() + "/bon"%>'></a>
				</div>
				<div class="modal-body form-register-body">
					<form method="post" action="traitement_bon?action=modifyBon">
						<input name="poste"
							class="form-control rounded form-register-input" id="poste"
							value='<%out.println(nouveau.getPoste());%>' aria-label="Search"
							aria-describedby="search-addon" readonly="readonly" /> <select
							name="id" class="form-control rounded form-register-input"
							id="id" aria-label="Search" aria-describedby="search-addon">
							<option class="option" selected="selected" hidden="" value=<%out.println(nouveau.getId());%>><%out.println(nouveau.getId());%>
							</option>
							<%
							for (TypeMouvement l : mvt) {
							%>
							<option value="<%out.println(l.getCode());%>">
								<%
								out.println(l.getCode());
								%>
							</option>
							<%
							}
							%>
						</select>  <input type="date"
							name="date" class="form-control rounded form-register-input"
							id="date" value=<%out.println(ft.format(nouveau.getDate()));%>
							aria-label="Search" aria-describedby="search-addon" /> <select
							name="numero" class="form-control rounded form-register-input"
							id="numero" aria-label="Search" aria-describedby="search-addon">
							<option class="option" selected="selected" hidden="" value=<%out.println(nouveau.getEscale());%>><%out.println(nouveau.getEscale());%>
							</option>
							<%
							for (Escales l : esc) {
							%>
							<option value="<%out.println(l.getNum());%>">
								<%
								out.println(l.getNum());
								%>
							</option>
							<%
							}
							%>
						</select> 
						 <a type="button"
							class="btn btn-secondary lien"
							href='<%=request.getContextPath() + "/bon"%>'>Annuler</a> <input
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
	if (request.getParameter("poste") != null && request.getParameter("action").equals("suppBon")) {
	%>
	<!-- Supprimer bon-->
	<div class="modification" id="Supp" tabindex="-1"
		aria-labelledby="Supp" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Supprimer un
						bon</h5>
					<a type="button" class="btn-close" aria-label="Close"
						href='<%=request.getContextPath() + "/bon"%>'></a>
				</div>
				<div class="modal-body form-register-body">
					<form method="post" action="traitement_bon?action=suppBon">
						<i style="text-align: center;">&ecirc;tes-vous s&ucirc;r(e) de
							vouloir supprimer ce bon ? </i> <input name="poste"
							class="form-control rounded form-register-input" id="poste"
							value='<%out.println(request.getParameter("poste"));%>'
							aria-label="Search" aria-describedby="search-addon"
							readonly="readonly" /> <a type="button"
							class="btn btn-secondary lien"
							href='<%=request.getContextPath() + "/bon"%>'>Annuler</a> <input
							type="submit" class="btn btn-primary" value="Valider" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>
</body>
</html>