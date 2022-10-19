package com.octest.servlets;

import java.io.IOException;

import com.octest.bdd.BdConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/Test")
public class Test extends HttpServlet {
    private static final long serialVersionUID = 1L;
       

    public Test() {
        super();
        // TODO Auto-generated constructor stub
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	  
    	this.getServletContext().getRequestDispatcher("/WEB-INF/identification.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BdConnection form=new BdConnection();
        form.connectionBd(request);
        if(form.getResultat().equals(true)) {
        	this.getServletContext().getRequestDispatcher("/WEB-INF/accueil.jsp").forward(request, response);
        }else {
        	request.setAttribute("form", form);
        	this.getServletContext().getRequestDispatcher("/WEB-INF/identification.jsp").forward(request, response);
        }
        
    }

}