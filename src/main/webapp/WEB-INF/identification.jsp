<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Test</title>
       <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
       <link rel="stylesheet" type="text/css" href="css/style.css"/>
    </head>
    <body>
    <div class="main-container">
    	<div class="formulaire">
    	<form method="post" action="bonjour">
    		<p>
    		<label for="login">Login</label>
    		<input type="text" name="login" class="form-control form-controle-lg mr-5" id="login"> </p>
        	<p>
           	<label for="login">Password</label>
        	<input type="password" name="pass" class="form-control form-controle-lg" id="pass"></p>
    		<c:if test="${form.resultat==false }"><p id="message"><c:out value="identifiant/password incorrect"></c:out></p></c:if>
        	<p><input type="submit" value="Se connecter" class="btn btn-outline-info ml-2"> </p>
    	</form>
    </div> 
    </div>
    </body>
</html>
