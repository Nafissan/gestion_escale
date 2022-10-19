package com.octest.forms;
import com.octest.bdd.BdConnection;
import com.octest.beans.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class ServEscales {
	private static Statement statement=BdConnection.getConnection();
    private List<Escales> escales;

    public ServEscales(){
    	
    }

    public void createEscales(Escales escale){
    	SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
    	try {
			statement.executeUpdate("insert into escales(numero,date_debut_escale,date_fin_escale,id_navire,prix_sejour) "
					+ "values('"+escale.getNum()+"','"+ft.format(escale.getDebut())+"','"+ft.format(escale.getFin())+"','"+escale.getNavire()+"',"+escale.getPrix()+")");
			
			
		}catch(SQLException e) {
			
		}
    }
    
    public List<Escales> readEscales(){
    	SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
    	Date dateDeb = null;
		Date dateF=null;	
    	ResultSet result=null;
    	this.escales=new ArrayList<>();
    	try {
			result=statement.executeQuery("select * from escales");
			while(result.next()) {
				Escales nav=new Escales();
				nav.setNum(result.getString("numero"));
				try {
					dateDeb = ft.parse(result.getString("date_debut_escale"));
					dateF = ft.parse(result.getString("date_fin_escale"));

				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				nav.setDebut(dateDeb);
				nav.setFin(dateF);
				nav.setNavire(result.getString("id_navire"));
				nav.setPrix(result.getLong("prix_sejour"));
				this.escales.add(nav);
			}
			
		}catch(SQLException e) {
			
		}
        return this.escales;
    }

    public void updateEscales(Escales escale){
    	SimpleDateFormat ft=new SimpleDateFormat("yyyy:MM:dd");
    	try {
			statement.executeUpdate("update escales set date_debut_escale='"+ft.format(escale.getDebut())+"', date_fin_escale='"+ft.format(escale.getFin())+"', id_navire='"+escale.getNavire()+"', prix_sejour="
					+escale.getPrix()+" where numero='"+escale.getNum()+"'");
			
			
		}catch(SQLException e) {
			
		}  
    }

    public void deleteEscales(String numero){
    	try {
			statement.executeUpdate("delete from escales where numero='"+numero+"'");
			
			
		}catch(SQLException e) {
			
		}
    }
    
    public Escales getEscale(String numero) {
    	SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
    	Escales escale=new Escales();
    	ResultSet result=null;
    	Date dateDeb = null;
		Date dateF=null;	
    	try {
			result=statement.executeQuery("select * from escales where numero='"+numero+"'");
			while(result.next()) {
				escale.setNum(numero);
				try {
					dateDeb = ft.parse(result.getString("date_debut_escale"));
					dateF = ft.parse(result.getString("date_fin_escale"));

				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				escale.setDebut(dateDeb);
				escale.setFin(dateF);
				escale.setNavire(result.getString("id_navire"));
				escale.setPrix(result.getLong("prix_sejour"));
			}
		}catch(SQLException e) {
			
		}
    		return escale;
    }
    
    
}

