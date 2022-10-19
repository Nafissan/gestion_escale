package com.octest.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import com.octest.beans.Escales;
import com.octest.forms.ServEscales;
import com.octest.forms.ServNavire;
import com.octest.forms.ServPilotage;

public class GetEscale extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServNavire service = new ServNavire();
	ServEscales escale = new ServEscales();
	ServPilotage serv=new ServPilotage();
	
	public GetEscale() {
		super();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String numero = request.getParameter("numero");
		String action = request.getParameter("action");

		if (numero != null && action.equals("suppEscale")) {
			request.setAttribute("numero", numero);
			this.getServletContext().getRequestDispatcher("/WEB-INF/traitement_escale.jsp").forward(request, response);

		} else if (numero != null && action.equals("modifyEscale")) {
			request.setAttribute("numero", numero);
			request.setAttribute("service", escale);
			request.setAttribute("liste", service.readNavire());
			this.getServletContext().getRequestDispatcher("/WEB-INF/traitement_escale.jsp").forward(request, response);

		}else if(numero!=null && action.equals("seeBon")){
			request.setAttribute("liste", serv.listeBon(numero));
			this.getServletContext().getRequestDispatcher("/WEB-INF/traitement_escale.jsp").forward(request, response);
		}
		else {
			request.setAttribute("navire", service.readNavire());
			request.setAttribute("liste", escale.readEscales());
			this.getServletContext().getRequestDispatcher("/WEB-INF/escale.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equals("ajoutEscale")) {
			ajoutEscale(request, response);
			request.setAttribute("liste", escale.readEscales());
			response.sendRedirect("/test/escale");
		}
		// doGet(request, response);
	}

	public void ajoutEscale(HttpServletRequest request, HttpServletResponse response) {
    	SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
		Escales esc = new Escales();
		esc.setNum(request.getParameter("numero"));
		
		Date dateDeb = null;
		Date dateF=null;
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
		escale.createEscales(esc);
	}

}
