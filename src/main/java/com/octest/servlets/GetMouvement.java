package com.octest.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.octest.beans.TypeMouvement;
import com.octest.forms.ServMouvement;

/**
 * Servlet implementation class Mouvement
 */
public class GetMouvement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       ServMouvement service=new ServMouvement();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetMouvement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
    	String code = request.getParameter("code");
		String action = request.getParameter("action");
		if (code != null && action.equals("suppMouvement")) {
			request.setAttribute("numero", code);
			this.getServletContext().getRequestDispatcher("/WEB-INF/traitement_mouvement.jsp").forward(request, response);

			
		} else if (code != null && action.equals("modifyMouvement")) {
			request.setAttribute("numero", code);
			request.setAttribute("service", service);
			this.getServletContext().getRequestDispatcher("/WEB-INF/traitement_mouvement.jsp").forward(request, response);

		}else {		
		request.setAttribute("liste", service.readMouvement());
		this.getServletContext().getRequestDispatcher("/WEB-INF/mouvement.jsp").forward(request, response);
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println("action => " + action);
		if (action.equals("ajoutMouvement")) {
			ajoutMouvement(request, response);
			request.setAttribute("liste", service.readMouvement());
			response.sendRedirect("/test/mouvement");
		}
//		doGet(request, response);
	}

	@Override
	public void init() throws ServletException {
		super.init();
	}

	public void ajoutMouvement(HttpServletRequest request, HttpServletResponse response) {
		TypeMouvement mouvement = new TypeMouvement();
		mouvement.setCode(request.getParameter("code"));
		mouvement.setLibelle(request.getParameter("libelle"));
		mouvement.setPrix(Long.parseLong(request.getParameter("prix")));
		service.createMouvement(mouvement);
	}

}
