package com.octest.beans;

public class TypeMouvement{

    private String codeTypeMvt;
    private String libelleTypeMvt;
    private long prixTypeMvt;

    public TypeMouvement(){}

    public void setCode(String code){
        this.codeTypeMvt=code;
    }

    public void setLibelle(String libelle){
        this.libelleTypeMvt=libelle;
    }

    public void setPrix(long prix){
        this.prixTypeMvt=prix;
    }

    public String getCode(){
        return this.codeTypeMvt;
    }

    public String getLibelle(){
        return this.libelleTypeMvt;
    }

    public long getPrix(){
        return this.prixTypeMvt;
    }
    
}
