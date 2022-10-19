package com.octest.beans;

import java.util.Date;

public class Escales{

    public String numEscale;
    public Date debutEscale;
    public Date finEscale;
    public String myNavire;
    public long prixSejour;
    
    public Escales(){}

    public void setNum(String num){
        this.numEscale=num;
    }

    public void setDebut(Date debut){
        this.debutEscale=debut;
    }

    public void setFin(Date fin){
        this.finEscale=fin;
    }

    public void setNavire(String nav){
        this.myNavire=nav;
    }

    public void setPrix(long prix){
        this.prixSejour=prix;
    }

    public String getNum(){
        return this.numEscale;
    }

    public Date getDebut(){
        return this.debutEscale;
    }

    public Date getFin(){
        return this.finEscale;
    }

    public String getNavire(){
        return this.myNavire;
    }

    public long getPrix(){
        return this.prixSejour;
    }
}
