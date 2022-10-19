package com.octest.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.octest.beans.Escales;
import com.octest.forms.ServEscales;
import com.octest.forms.ServNavire;


public class Traitement_escale extends HttpServlet {
	private static final long serialVersionUID = 1L;
       ServNavire service=new ServNavire();
       ServEscales escale=new ServEscales();
   
    public Traitement_escale() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/traitement_escale.jsp").forward(request, response);

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("action")!=null ) {
			String action=request.getParameter("action");
			if (action.equals("modifyEscale")) {
				modifyEscale(request, response);
				request.setAttribute("liste", escale.readEscales());
				request.setAttribute("navire", service.readNavire());
				this.getServletContext().getRequestDispatcher("/WEB-INF/escale.jsp").forward(request, response);
			}else if(action.equals("suppEscale")) {
				suppEscale(request, response);
				request.setAttribute("liste", escale.readEscales());
				request.setAttribute("navire", service.readNavire());
				this.getServletContext().getRequestDispatcher("/WEB-INF/escale.jsp").forward(request, response);
			}
			
		}
		//doGet(request, response);
	}

	public void suppEscale(HttpServletRequest request, HttpServletResponse response) {
		escale.deleteEscales(request.getParameter("numero"));
	}

	public void modifyEscale(HttpServletRequest request, HttpServletResponse response) {
    	SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
		Escales esc = new Escales();
		Date dateDeb = null;
		Date dateF=null;
		List<Escales> liste = escale.readEscales();
		for (Escales nav : liste) {
			esc = nav;
			if (nav.getNum().equals(request.getParameter("numero"))) {
				try {
					dateDeb = ft.parse(request.getParameter("date_deb"));
					dateF = ft.parse(request.getParameter("date_f"));

				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				esc.setDebut(dateDeb);
				esc.setFin(dateF);
				esc.setNavire(request.getParameter("navire"));
				esc.setPrix(Long.parseLong(request.getParameter("prix")));
				break;
			}
		}
		escale.updateEscales(esc);
		
	}

}
