package com.octest.beans;

import java.util.Date;

public class BonPilotage{

    private String typeMouvement;
    private String monEscale;
    private Date datedeBon;
    private String posteaquai;

    public BonPilotage(){}

    public void setId(String id){
        this.typeMouvement=id;
    }

    public void setEscale(String escales){
        this.monEscale=escales;
    }

    public void setDate(Date date){
        this.datedeBon=date;
    }

    public void setPoste(String poste){
        this.posteaquai=poste;
    }

    public String getId(){
        return this.typeMouvement;
    }

    public String getEscale(){
        return this.monEscale;
    }

    public Date getDate(){
        return this.datedeBon;
    }

    public String getPoste(){
        return this.posteaquai;
    }
}
