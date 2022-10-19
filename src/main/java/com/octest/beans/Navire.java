package com.octest.beans;

public class Navire {
	private String nomNavire;
    private String numeroNavire;
    private long longueurNavire;
    private long largeurNavire;
    private long volumeNavire;
    private long tiranEauNavire;

    public Navire(){
    }

    public void setNom(String nom){
        this.nomNavire=nom;
    }

    public void setNumero(String numero){
        this.numeroNavire=numero;
    }

    public void setLongueur(long longueur){
        this.longueurNavire=longueur;
    }

    public void setLargeur(long largeur){
        this.largeurNavire=largeur;
    }

    public void setVolume(long vol){
        this.volumeNavire=vol;
    }

    public void setTirant(long tirant){
        this.tiranEauNavire=tirant;
    }

    public String getNom(){
        return this.nomNavire;
    }

    public String getNumero(){
        return this.numeroNavire;
    }

    public long getLongueur(){
        return this.longueurNavire;
    }

    public long getLargeur(){
        return this.largeurNavire;
    }

    public long getVolume(){
        return this.volumeNavire;
    }

    public long getTirant(){
        return this.tiranEauNavire;
    }
    
}