package com.octest.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.octest.beans.Navire;
import com.octest.forms.ServNavire;

public class Traitement_navire extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ServNavire service=new ServNavire();   
  
    public Traitement_navire() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/traitement_navire.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("action")!=null ) {
			String action=request.getParameter("action");
			if (action.equals("modifyNavire")) {
				modifyNavire(request, response);
				request.setAttribute("liste", service.readNavire());
				this.getServletContext().getRequestDispatcher("/WEB-INF/navire.jsp").forward(request, response);
			}else if(action.equals("suppNavire")) {
				suppNavire(request, response);
				request.setAttribute("liste", service.readNavire());
				this.getServletContext().getRequestDispatcher("/WEB-INF/navire.jsp").forward(request, response);
			}
			
		}
		//doGet(request, response);
	}
	
	public void suppNavire(HttpServletRequest request, HttpServletResponse response) {
		service.deleteNavire(request.getParameter("numero"));
	}

	public void modifyNavire(HttpServletRequest request, HttpServletResponse response) {
		Navire navire = new Navire();
		List<Navire> liste = service.readNavire();
		for (Navire nav : liste) {
			navire = nav;
			if (nav.getNumero().equals(request.getParameter("numero"))) {
				navire.setNom(request.getParameter("nom"));
				navire.setLongueur(Long.parseLong(request.getParameter("longueur")));
				navire.setLargeur(Long.parseLong(request.getParameter("largeur")));
				navire.setTirant(Long.parseLong(request.getParameter("tirant")));
				navire.setVolume(service.getVolumeNavire(Long.parseLong(request.getParameter("longueur")), Long.parseLong(request.getParameter("largeur")), Long.parseLong(request.getParameter("tirant"))));
				break;
			}
		}
		service.updateNavire(navire);
		
	}

}
