package com.octest.bdd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.http.HttpServletRequest;

public class BdConnection {
	private Boolean resultat=false;
	private static Connection connexion;
	private static Statement statement;
	
	public static Statement getConnection() {		
		try {
			if(connexion==null && statement==null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/java_ee","root","");
			statement=connexion.createStatement();
			}
		}catch(ClassNotFoundException | SQLException e) {
			
		}
		return statement;
	}
	
	public Boolean connectionBd(HttpServletRequest request) {
		ResultSet result=null;
		String login=request.getParameter("login");
		String pass= request .getParameter("pass");
		
		try {
			statement=getConnection();
			result=statement.executeQuery("Select login, password from utilisateur;");
			
			while(result.next()) {
				if(result.getString("login").equals(login) && result.getString("password").equals(pass)) {
					this.resultat=true;
				}
			}
		}catch(SQLException e) {
			
		}finally {
			try {
				if(result!=null) result.close();
				if(statement!=null) statement.close();
				if(connexion!=null) connexion.close();
			}catch(SQLException ignore) {
				
			}
		}
		return this.resultat;
	}

	public Boolean getResultat() {
		return resultat;
	}

	public void setResultat(Boolean resultat) {
		this.resultat = resultat;
	}
		

}
