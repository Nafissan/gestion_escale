<%@page import="com.octest.beans.*"%>
<%@page import="com.octest.forms.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="javax.swing.*"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>escale</title>
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
					<i class="fam" type="button" id="dropdownMenuButton1" 
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
		List<Escales> liste = (List<Escales>) request.getAttribute("liste");
		List<Navire> esc = (List<Navire>) request.getAttribute("navire");
    	SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
		%>
		<div class="table">
			<div class="source">
				<h3 class="navire">
					La liste de nos escales <i class="fa-regular fa-plus" type="button"
						data-bs-toggle="modal" data-bs-target="#Ajout"></i>
				</h3>
				<table class='highlight'>
					<thead>
						<tr>
							<th>Numero</th>
							<th>Date de d&eacute;but</th>
							<th>Date de fin</th>
							<th>Id navire</th>
							<th>prix s&eacute;jour</th>
							<th></th> 
						</tr>
					</thead>
					<tbody>
						<%
						for (Escales nav : liste) {
						%>
						<tr>
							<td>
								<%
								out.println(nav.getNum());
								%>
							</td>
							<td>
								<%
								out.println(ft.format(nav.getDebut()));
								%>
							</td>
							<td>
								<%
								out.println(ft.format(nav.getFin()));
								%>
							</td>
							<td>
								<%
								out.println(nav.getNavire());
								%>
							</td>
							<td>
								<%
								out.println(nav.getPrix());
								%>
							</td>
							<td><a role="button" class="fa-solid fa-check lien"
								name="modif"
								href="<%=request.getContextPath() + "/escale?action=modifyEscale&numero=" + nav.getNum()%>"></a>
								<a class="fa-solid fa-xmark lien" name="supp"
								href="<%=request.getContextPath() + "/escale?action=suppEscale&numero=" + nav.getNum()%>"></a>
								<a class="fa-regular fa-eye lien" name="see"
								href="<%=request.getContextPath() + "/escale?action=seeBon&numero=" + nav.getNum()%>"></a>
								</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- Ajouter escale-->
	<div class="modal fade" id="Ajout" tabindex="-1"
		aria-labelledby="Ajout" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ajouter un
						escale</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body form-register-body">
					<form method="post" action="escale?action=ajoutEscale">
						<input name="numero"
							class="form-control rounded form-register-input" id="numero"
							placeholder="Tapez le numero ..." aria-label="Search"
							aria-describedby="search-addon" required/> <input name="date_deb"
							class="form-control rounded form-register-input" id="date_deb"
							placeholder="Tapez la date de début ..." aria-label="Search"
							aria-describedby="search-addon" type="date" required/> <input
							name="date_f" class="form-control rounded form-register-input"
							id="date_f" placeholder="Tapez la date de fin ..."
							aria-label="Search" aria-describedby="search-addon" type="date" required/>
						<select name="navire" 
							class="form-control rounded form-register-input" id="navire"
							aria-label="Search" aria-describedby="search-addon" required>
							<option value="" disabled="disabled" selected="selected" hidden="" class="option" >Choisis id navire</option>
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
						</select>
						

						<input name="prix"
							class="form-control rounded form-register-input" id="prix"
							placeholder="Tapez le prix du séjour ..." aria-label="Search"
							aria-describedby="search-addon"  required/>

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