package com.octest.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.octest.beans.TypeMouvement;
import com.octest.forms.ServMouvement;

public class Traitement_mouvement extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ServMouvement service=new ServMouvement();
    public Traitement_mouvement() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/traitement_mouvement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		  if (action.equals("modifyMouvement")) {
				modifyMouvement(request, response);
				request.setAttribute("liste", service.readMouvement());
				this.getServletContext().getRequestDispatcher("/WEB-INF/mouvement.jsp").forward(request, response);
			}else if(action.equals("suppMouvement")) {
				suppMouvement(request, response);
				request.setAttribute("liste", service.readMouvement());
				this.getServletContext().getRequestDispatcher("/WEB-INF/mouvement.jsp").forward(request, response);
			}
		//doGet(request, response);
	}
	
	public void suppMouvement(HttpServletRequest request, HttpServletResponse response) {
		String code=request.getParameter("code");
		service.deleteMouvement(code);
	}

	public void modifyMouvement(HttpServletRequest request, HttpServletResponse response) {
		TypeMouvement mouvement = new TypeMouvement();
		List<TypeMouvement> liste = service.readMouvement();
		for (TypeMouvement nav : liste) {
			mouvement = nav;
			if (nav.getCode().equals(request.getParameter("code"))) {
				mouvement.setLibelle(request.getParameter("libelle"));
				mouvement.setPrix(Long.parseLong(request.getParameter("prix")));
				break;
			}
		}
		service.updateMouvement(mouvement);
		
	}

}
