<%@page import="com.octest.beans.*"%>
<%@page import="com.octest.forms.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Traitement mouvement</title>
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
	<!-- Modifier mouvement-->

	<%
	if (request.getParameter("code") != null && request.getParameter("action").equals("modifyMouvement")) {
		ServMouvement service=(ServMouvement)request.getAttribute("service");
		TypeMouvement nouveau =service.getMouvement(request.getParameter("code")) ;
	%>
	<div class="discussion" id="modify" tabindex="-1"
		aria-labelledby="Modify" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modifier un
						mouvement</h5>
					<a type="button" class="btn-close" 
						aria-label="Close" href='<%=request.getContextPath() + "/mouvement"%>' ></a>
				</div>
				<div class="modal-body form-register-body">
					<form method="post" action="traitement?action=modifyMouvement">
						<input name="code"
							class="form-control rounded form-register-input" 
							id="code" value='<%out.println(nouveau.getCode());%>'
							aria-label="Search" aria-describedby="search-addon" readonly="readonly"/> <input
							name="libelle" class="form-control rounded form-register-input"
							id="libelle" value=<%out.println(nouveau.getLibelle());%>
							aria-label="Search" aria-describedby="search-addon" /> <input
							name="prix" class="form-control rounded form-register-input"
							id="prix" value=<%out.println(nouveau.getPrix());%>
							aria-label="Search" aria-describedby="search-addon" />
						<a type="button" class="btn btn-secondary lien"
							href='<%=request.getContextPath() + "/mouvement"%>' >Annuler</a>
						<input type="submit" class="btn btn-primary" value="Valider" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>
	<%
	if (request.getParameter("code") != null && request.getParameter("action").equals("suppMouvement")) {
		
	%>
	<!-- Supprimer mouvement-->
	<div class="modification" id="Supp" tabindex="-1" aria-labelledby="Supp"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Supprimer un
						type de mouvement</h5>
					<a type="button" class="btn-close" 
						aria-label="Close" href='<%=request.getContextPath() + "/mouvement"%>' ></a>
				</div>
				<div class="modal-body form-register-body">
					<form method="post" action="traitement?action=suppMouvement">
						<i style="text-align: center;">&ecirc;tes-vous s&ucirc;r(e) de
							vouloir supprimer ce mouvement ? </i> <input name="code"
							 class="form-control rounded form-register-input"
							id="code" value='<%out.println(request.getParameter("code"));%>'
							aria-label="Search" aria-describedby="search-addon"  readonly="readonly"/>
						<a type="button" class="btn btn-secondary lien"
							href='<%=request.getContextPath() + "/mouvement"%>' >Annuler</a>
						<input type="submit" class="btn btn-primary" value="Valider" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<%} %>
</body>
</html>