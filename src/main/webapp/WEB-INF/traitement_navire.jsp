<%@page import="com.octest.beans.*"%>
<%@page import="com.octest.forms.*"%>
<%@page import="java.util.*"%>


<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Traitement navire</title>
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
	<!-- Modifier navire-->

	<%
	if (request.getParameter("numero") != null && request.getParameter("action").equals("modifyNavire")) {
		ServNavire service=(ServNavire)request.getAttribute("service");
		Navire nouveau=service.getNavire(request.getParameter("numero"));
	%>
	<div class="modification" id="modify" tabindex="-1"
		aria-labelledby="Modify" aria-hidden="false">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modifier un
						navire</h5>
						<a type="button" class="btn-close" 
						aria-label="Close" href='<%=request.getContextPath() + "/navire"%>' ></a>
				</div>
				<div class="modal-body form-register-body">
					<form method="post" action="discussion?action=modifyNavire">
						<input name="nom" class="form-control rounded form-register-input"
							id="nom" value=<%out.println(nouveau.getNom());%>
							aria-label="Search" aria-describedby="search-addon" /> <input
							name="numero" class="form-control rounded form-register-input"
							id="numero"
							value=<%out.println(nouveau.getNumero());%>
							aria-label="Search" aria-describedby="search-addon"
							readonly="readonly" /> <input name="longueur"
							class="form-control rounded form-register-input" id="longueur"
							value=<%out.println(nouveau.getLongueur());%>
							aria-label="Search" aria-describedby="search-addon" /> <input
							name="largeur" class="form-control rounded form-register-input"
							id="largeur" value=<%out.println(nouveau.getLargeur());%>
							aria-label="Search" aria-describedby="search-addon" /> <input
							name="vol" class="form-control rounded form-register-input"
							id="vol" value=<%out.println(nouveau.getVolume());%>
							aria-label="Search" aria-describey="search-addon" readonly="readonly" /> <input
							name="tirant" class="form-control rounded form-register-input"
							id="tirant" value=<%out.println(nouveau.getTirant());%>
							aria-label="Search" aria-describedby="search-addon" />

						<a type="button" class="btn btn-secondary lien"
							href='<%=request.getContextPath() + "/navire"%>' >Annuler</a>
						<input type="submit" class="btn btn-primary" value="Valider" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<%
	} 
	%>
	<!-- Supprimer mouvement-->
	<%
	if (request.getParameter("numero") != null && request.getParameter("action").equals("suppNavire")) {
		
	%>
	<div class="discussion" id="Supp" tabindex="-1" aria-labelledby="Supp"
		aria-hidden="false">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Supprimer un
						navire</h5>
						<a type="button" class="btn-close" 
						aria-label="Close" href='<%=request.getContextPath() + "/navire"%>' ></a>
				</div>
				<div class="modal-body form-register-body">
					<form method="post" action="discussion?action=suppNavire">
						<i style="text-align: center;">&ecirc;tes-vous s&ucirc;r(e) de
							vouloir supprimer ce navire ? </i><br> <input name="numero"
							class="form-control rounded form-register-input" id="numero"
							value='<%out.println(request.getParameter("numero"));%>'
							aria-label="Search" aria-describedby="search-addon"
							readonly="readonly" />
						<a type="button" class="btn btn-secondary lien"
							href='<%=request.getContextPath() + "/navire"%>' >Annuler</a>
						<input type="submit" class="btn btn-primary" value="Valider" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<%} %>
</body>
</html>