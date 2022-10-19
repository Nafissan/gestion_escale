package com.octest.forms;
import com.octest.bdd.BdConnection;
import com.octest.beans.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class ServPilotage {
	private static Statement statement=BdConnection.getConnection();
    private List<BonPilotage> bons;
    private List<BonPilotage> listBon;

    public ServPilotage(){}

    public void createBons(BonPilotage bon){
    	SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
    	try {
			statement.executeUpdate("insert into bon(poste,numero_escale,code_mouvement,date) "
					+ "values('"+bon.getPoste()+"','"+bon.getEscale()+"','"+bon.getId()+"','"+ft.format(bon.getDate())+"')");
			
			
		}catch(SQLException e) {
			
		}
    }
    
    public List<BonPilotage> readBons(){
    	ResultSet result=null;
    	SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
    	Date dateDeb = null;
    	this.bons=new ArrayList<>();
    	try {
			result=statement.executeQuery("select * from bon");
			while(result.next()) {
				BonPilotage nav=new BonPilotage();
				try {
					dateDeb = ft.parse(result.getString("date"));

				} catch (ParseException e) {
					e.printStackTrace();
				}
				nav.setPoste(result.getString("poste"));
				nav.setEscale(result.getString("numero_escale"));
				nav.setId(result.getString("code_mouvement"));
				nav.setDate(dateDeb);
				this.bons.add(nav);
			}
			
		}catch(SQLException e) {
			
		}
        return this.bons;
    }

    public void updateBons(BonPilotage pilot){
    	SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
    	try {
			statement.executeUpdate("update bon set numero_escale='"+pilot.getEscale()+"', code_mouvement='"+pilot.getId()+"', date='"+ft.format(pilot.getDate())+"' where poste='"+pilot.getPoste()+"'");
			
			
		}catch(SQLException e) {
			
		}  
    }

    public void deleteBons(String poste){
    	try {
			statement.executeUpdate("delete from bon where poste='"+poste+"'");
			
			
		}catch(SQLException e) {
			
		}
    }
    
    public BonPilotage getBon(String poste) {
    	BonPilotage bon=new BonPilotage();
    	SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
    	Date dateDeb = null;
    	ResultSet result=null;
    	try {
			result=statement.executeQuery("select * from bon where poste='"+poste+"'");
			while(result.next()) {
				bon.setPoste(poste);
				try {
					dateDeb = ft.parse(result.getString("date"));

				} catch (ParseException e) {
					e.printStackTrace();
				}
				bon.setEscale(result.getString("numero_escale"));
				bon.setId(result.getString("code_mouvement"));
				bon.setDate(dateDeb);
			}
		}catch(SQLException e) {
			
		}
    		return bon;
    }
    
    public List<BonPilotage> listeBon(String numero){
    	ResultSet result=null;
    	SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
    	Date dateDeb = null;
    	this.listBon=new ArrayList<>();
    	try {
			result=statement.executeQuery("SELECT * FROM bon WHERE numero_escale="+numero);
			while(result.next()) {
					BonPilotage nav=new BonPilotage();
					try {
						dateDeb = ft.parse(result.getString("date"));

					} catch (ParseException e) {
						e.printStackTrace();
					}
					nav.setPoste(result.getString("poste"));
					nav.setEscale(result.getString("numero_escale"));
					nav.setId(result.getString("code_mouvement"));
					nav.setDate(dateDeb);
					this.listBon.add(nav);
			}
			
		}catch(SQLException e) {
			
		}
    	
   
    	return this.listBon;
    }
    
}
