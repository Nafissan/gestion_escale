package com.octest.forms;
import com.octest.bdd.BdConnection;
import com.octest.beans.*;

import java.sql.*;
import java.sql.SQLException;
import java.util.*;

public class ServNavire {

    private static Statement connexion=BdConnection.getConnection();
    private List<Navire> nav;

    public ServNavire(){}

    public void createNavire(Navire navire){
    	try {
			connexion.executeUpdate("insert into navire(numero,nom,longueur,largeur,volume,tirant) "
					+ "values('"+navire.getNumero()+"','"+navire.getNom()+"',"+navire.getLongueur()+","+navire.getLargeur()+","+navire.getVolume()+","+navire.getTirant()+")");
			
			
		}catch(SQLException e) {
			
		}
    }
    
    public List<Navire> readNavire(){
    	ResultSet result=null;
    	this.nav=new ArrayList<>();
    	try {
			result=connexion.executeQuery("select * from navire");
			while(result.next()) {
				Navire nav=new Navire();
				nav.setNumero(result.getString("numero"));
				nav.setNom(result.getString("nom"));
				nav.setLongueur(result.getLong("longueur"));
				nav.setLargeur(result.getLong("largeur"));
				nav.setVolume(result.getLong("volume"));
				nav.setTirant(result.getLong("tirant"));
				this.nav.add(nav);
			}
			
		}catch(SQLException e) {
			
		}
    	return this.nav;
    }

    public void updateNavire(Navire navire){
    	try {
			connexion.executeUpdate("update navire set nom='"+navire.getNom()+"', longueur="+navire.getLongueur()+", largeur="+navire.getLargeur()+", volume="
					+navire.getVolume()+", tirant="+navire.getTirant()+" where numero='"+navire.getNumero()+"'");
			
			
		}catch(SQLException e) {
			
		}
    }

    public void deleteNavire(String numero){
    	try {
			connexion.executeUpdate("delete from navire where numero='"+numero+"'");
			
			
		}catch(SQLException e) {
			
		}
		
    }
    
    public static Navire getNavire(String numero) {
    	Navire navire=new Navire();
    	ResultSet result=null;
    	try {
			result=connexion.executeQuery("select * from navire where numero='"+numero+"'");
			while(result.next()) {
				navire.setNumero(numero);
				navire.setNom(result.getString("nom"));
				navire.setLongueur(result.getLong("longueur"));
				navire.setLargeur(result.getLong("largeur"));
				navire.setVolume(result.getLong("volume"));
				navire.setTirant(result.getLong("tirant"));
			}
		}catch(SQLException e) {
			
		}
    		return navire;
    }

    public long getVolumeNavire(long l,long large, long tirant) {
    	return l* large*tirant;
    	
    }
}
