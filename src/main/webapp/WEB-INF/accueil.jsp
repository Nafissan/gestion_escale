 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rubik+Moonrocks&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/79caf21a61.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
</head>
<body class="index">
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
						data-bs-toggle="dropdown" aria-expanded="false">Gestion</i>
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
        <div class="second">
            <h1>ATLANTIS</h1>
        </div>
    </div>
        
</body>
</html>
