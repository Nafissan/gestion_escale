package com.octest.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.octest.beans.Navire;
import com.octest.forms.ServNavire;

public class GetNavire extends HttpServlet {
	ServNavire service = new ServNavire();
	private static final long serialVersionUID = 1L;

	public GetNavire() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String numero = request.getParameter("numero");
		String action = request.getParameter("action");

		if (numero != null && action.equals("suppNavire")) {
			request.setAttribute("numero", numero);
			this.getServletContext().getRequestDispatcher("/WEB-INF/traitement_navire.jsp").forward(request, response);

		} else if (numero != null && action.equals("modifyNavire")) {
			request.setAttribute("numero", numero);
			request.setAttribute("service", service);
			this.getServletContext().getRequestDispatcher("/WEB-INF/traitement_navire.jsp").forward(request, response);

		} else {
			request.setAttribute("liste", service.readNavire());
			this.getServletContext().getRequestDispatcher("/WEB-INF/navire.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equals("ajoutNavire")) {
			ajoutNavire(request, response);
			request.setAttribute("liste", service.readNavire());
			response.sendRedirect("/test/navire");
		}

		//doGet(request, response);

	}

	@Override
	public void init() throws ServletException {
		super.init();
	}

	public void ajoutNavire(HttpServletRequest request, HttpServletResponse response) {
		Navire navire = new Navire();
		navire.setNom(request.getParameter("nom"));
		navire.setNumero(request.getParameter("numero"));
		navire.setLongueur(Long.parseLong(request.getParameter("longueur")));
		navire.setLargeur(Long.parseLong(request.getParameter("largeur")));
		navire.setTirant(Long.parseLong(request.getParameter("tirant")));
		navire.setVolume(service.getVolumeNavire(Long.parseLong(request.getParameter("longueur")), Long.parseLong(request.getParameter("largeur")), Long.parseLong(request.getParameter("tirant"))));
		service.createNavire(navire);
	}

}
