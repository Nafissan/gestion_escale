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

import com.octest.beans.BonPilotage;
import com.octest.forms.ServEscales;
import com.octest.forms.ServMouvement;
import com.octest.forms.ServPilotage;

public class Traitement_bon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServPilotage pilotage=new ServPilotage();
	ServMouvement mvt=new ServMouvement();
	ServEscales escale=new ServEscales();
   
    public Traitement_bon() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/traitement_bon.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("action")!=null ) {
			String action=request.getParameter("action");
			if (action.equals("modifyBon")) {
				modifyBon(request, response);
				request.setAttribute("liste", pilotage.readBons());
				request.setAttribute("escale", escale.readEscales());
				request.setAttribute("mouv", mvt.readMouvement());
				this.getServletContext().getRequestDispatcher("/WEB-INF/bon.jsp").forward(request, response);
			}else if(action.equals("suppBon")) {
				suppBon(request, response);
				request.setAttribute("liste", pilotage.readBons());
				request.setAttribute("escale", escale.readEscales());
				request.setAttribute("mouv", mvt.readMouvement());
				this.getServletContext().getRequestDispatcher("/WEB-INF/bon.jsp").forward(request, response);
			}
			
		}
		//doGet(request, response);
	}
	public void suppBon(HttpServletRequest request, HttpServletResponse response) {
		pilotage.deleteBons(request.getParameter("poste"));
	}

	public void modifyBon(HttpServletRequest request, HttpServletResponse response) {
		BonPilotage esc = new BonPilotage();
		List<BonPilotage> liste = pilotage.readBons();
		SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
		Date dateDeb = null;
		for (BonPilotage nav : liste) {
			esc = nav;
			if (nav.getPoste().equals(request.getParameter("poste"))) {
				try {
					dateDeb = ft.parse(request.getParameter("date"));

				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				esc.setId(request.getParameter("id"));
				esc.setEscale(request.getParameter("numero"));
				esc.setDate(dateDeb);
				break;
			}
		}
		pilotage.updateBons(esc);
		
	}

}
