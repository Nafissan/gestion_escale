package com.octest.forms;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import com.octest.bdd.BdConnection;
import com.octest.beans.*; 

public class ServMouvement {

    private List<TypeMouvement> mouvements;
    private Statement connexion=BdConnection.getConnection();

    public ServMouvement(){}

    public void createMouvement(TypeMouvement mouvement){
    	try {
			connexion.executeUpdate("insert into type_mouvement(code_type_mouvement,libelle_type_mouvement,prix_type_mouvement) "
					+ "values('"+mouvement.getCode()+"','"+mouvement.getLibelle()+"',"+mouvement.getPrix()+")");
			
			
		}catch(SQLException e) {
			
		}
    }
    
    public List<TypeMouvement> readMouvement(){
    	ResultSet result=null;
    	this.mouvements=new ArrayList<>();
    	try {
			result=connexion.executeQuery("select * from type_mouvement");
			while(result.next()) {
				TypeMouvement nav=new TypeMouvement();
				nav.setCode(result.getString("code_type_mouvement"));
				nav.setLibelle(result.getString("libelle_type_mouvement"));
				nav.setPrix(result.getLong("prix_type_mouvement"));
				this.mouvements.add(nav);
			}
			
		}catch(SQLException e) {
			
		}
        return this.mouvements;
    }

    public void updateMouvement(TypeMouvement mouvement){
    	try {
			connexion.executeUpdate("update type_mouvement set libelle_type_mouvement='"+mouvement.getLibelle()+"', prix_type_mouvement="+mouvement.getPrix()+" where code_type_mouvement='"+mouvement.getCode()+"'");
			
			
		}catch(SQLException e) {
			
		}
    }

    public void deleteMouvement(String code){
    	try {
			connexion.executeUpdate("delete from type_mouvement where code_type_mouvement='"+code+"'");
			
			
		}catch(SQLException e) {
			
		}
    }
    
    public TypeMouvement getMouvement(String code) {
    	TypeMouvement mouvement=new TypeMouvement();
    	ResultSet result=null;
    	try {
			result=connexion.executeQuery("select * from type_mouvement where code_type_mouvement='"+code+"'");
			while(result.next()) {
				mouvement.setCode(code);
				mouvement.setLibelle(result.getString("libelle_type_mouvement"));
				mouvement.setPrix(result.getLong("prix_type_mouvement"));
			}
		}catch(SQLException e) {
			
		}
    		return mouvement;
    } 
    
   
}
