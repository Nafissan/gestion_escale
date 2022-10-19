package com.octest.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.octest.beans.BonPilotage;
import com.octest.forms.ServEscales;
import com.octest.forms.ServMouvement;
import com.octest.forms.ServPilotage;


public class GetBon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServPilotage pilotage=new ServPilotage();
	ServMouvement mvt=new ServMouvement();
	ServEscales escale=new ServEscales();
   
    public GetBon() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String numero = request.getParameter("poste");
		String action = request.getParameter("action");

		if (numero != null && action.equals("suppBon")) {
			request.setAttribute("poste", numero);
			this.getServletContext().getRequestDispatcher("/WEB-INF/traitement_bon.jsp").forward(request, response);

		} else if (numero != null && action.equals("modifyBon")) {
			request.setAttribute("poste", numero);
			request.setAttribute("escale", escale.readEscales());
			request.setAttribute("mouv", mvt.readMouvement());
			request.setAttribute("service", pilotage);
			this.getServletContext().getRequestDispatcher("/WEB-INF/traitement_bon.jsp").forward(request, response);

		} else {
			request.setAttribute("escale", escale.readEscales());
			request.setAttribute("mouv", mvt.readMouvement());
			request.setAttribute("liste", pilotage.readBons());
			this.getServletContext().getRequestDispatcher("/WEB-INF/bon.jsp").forward(request, response);
		}	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equals("ajoutBon")) {
			ajoutBon(request, response);
			request.setAttribute("liste", pilotage.readBons());
			response.sendRedirect("/test/bon");
		}
		//doGet(request, response);
	}
	
	public void ajoutBon(HttpServletRequest request, HttpServletResponse response) {
		BonPilotage esc = new BonPilotage();
		SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
		Date dateDeb = null;
		try {
			dateDeb = ft.parse(request.getParameter("date"));

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		esc.setId(request.getParameter("id"));
		esc.setEscale(request.getParameter("numero"));
		esc.setDate(dateDeb);
		esc.setPoste(request.getParameter("poste"));
		pilotage.createBons(esc);
	}


}
