<%@page import="com.octest.beans.*"%>
<%@page import="com.octest.forms.*"%>
<%@page import="java.util.*"%>


<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>navire</title>
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
<body>
	<div class="main">
		<div class="first">
			<div class="title">
				<i type="button" data-bs-target="#">Welcome to Atlantis</i>
			</div>
			<div class="composant">
				<div class="butoon">
					<nav>
						<i class="fam" type="button" id="dropdownMenuButton1"
							data-bs-toggle="dropdown" aria-expanded="false">Param&eacute;trages</i>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li class="dropdown-item"><a class="lien"
								href="<%=request.getContextPath() + "/navire"%>">Navire</a></li>
							<li class="dropdown-item"><a class="lien"
								href="<%=request.getContextPath() + "/mouvement"%>">Mouvement</a></li>
						</ul>
					</nav>
				</div>
				<div class="butoon">
				<nav>
					<i class="fam " type="button" id="dropdownMenuButton1" 
						data-bs-toggle="dropdown" aria-expanded="false">Gestion navire</i>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li class="dropdown-item"><a class="lien"
							href="<%=request.getContextPath() + "/bon"%>">Bon pilotage</a></li>
						<li class="dropdown-item"><a class="lien"
							href="<%=request.getContextPath() + "/escale"%>">Escale</a></li>
					</ul>
				</nav>
				</div>
				<div class="butoon">
					<nav>
				<i class="fa-regular fa-user fam" type="button" id="dropdownMenuButton2"
						data-bs-toggle="dropdown" aria-expanded="false"></i>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
						<li class="dropdown-item"><a class="lien" href="<%=request.getContextPath() + "/bonjour"%>">D&eacute;connexion</a>
						
						</ul>
				</nav>			
				
			</div>

			</div>
		</div>
		<%
		List<TypeMouvement> liste = (List<TypeMouvement>) request.getAttribute("liste");
		%>
		<div class="table">
			<div class="">
				<h3 class="navire">
					La liste de nos types de mouvement <i class="fa-regular fa-plus"
						type="button" data-bs-toggle="modal" data-bs-target="#Ajout"></i>
				</h3>
				<table class='highlight'>
					<thead>
						<tr>
							<th>Code</th>
							<th>Libelle</th>
							<th>Prix</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%
						for (TypeMouvement mouv : liste) {
						%>
						<tr>
							<td>
								<%
								out.println(mouv.getCode());
								%>
							</td>
							<td>
								<%
								out.println(mouv.getLibelle());
								%>
							</td>
							<td>
								<%
								out.println(mouv.getPrix());
								%>
							</td>
							<td>
							<td><a role="button" class="fa-solid fa-check lien"
								name="modif"
								href="<%=request.getContextPath() + "/mouvement?action=modifyMouvement&code=" + mouv.getCode()%>"></a>
								<a class="fa-solid fa-xmark lien" name="supp"
								href="<%=request.getContextPath() + "/mouvement?action=suppMouvement&code=" + mouv.getCode()%>"></a></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- Ajouter mouvement-->
	<div class="modal fade" id="Ajout" tabindex="-1"
		aria-labelledby="Ajout" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ajouter un
						mouvement</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body form-register-body">
					<form method="post" action="mouvement?action=ajoutMouvement">
						<input name="code"
							class="form-control rounded form-register-input" id="code"
							placeholder="Tapez le code ..." aria-label="Search"
							aria-describedby="search-addon" /> <input name="libelle"
							class="form-control rounded form-register-input" id="libelle"
							placeholder="Tapez le libelle ..." aria-label="Search"
							aria-describedby="search-addon" /> <input name="prix"
							class="form-control rounded form-register-input" id="prix"
							placeholder="Tapez le prix ..." aria-label="Search"
							aria-describedby="search-addon" />
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Annuler</button>
						<input type="submit" class="btn btn-primary" value="Valider" />
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>