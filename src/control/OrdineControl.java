package control;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.Ordine;
import model.OrdineDAO;
import model.Prodotto;


/**
 * Servlet implementation class OrdineControl
 */
@WebServlet("/OrdineControl")
public class OrdineControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    OrdineDAO ordine = new OrdineDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrdineControl() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action != null) {
			
			if (action.equalsIgnoreCase("ViewOrdini")) {
				String email = request.getParameter("Email");
				request.setAttribute("ordini",ordine.getOrdini(email));
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Profilo.jsp");
				dispatcher.forward(request, response);
			} 
			
			else if(action.equalsIgnoreCase("Dettagli")) {
				String email = request.getParameter("Email");
		        List<Ordine> ordini = ordine.getOrdini(email); // Recupera gli ordini dal database
		        int numeroOrdine = Integer.parseInt(request.getParameter("id_ordine"));
		        List<Prodotto> prodotti = ordine.getProdotti(numeroOrdine); // Recupera i prodotti associati a un ordine dal database

		        request.setAttribute("ordini", ordini); // Imposta l'attributo "ordini" sulla richiesta
		        request.setAttribute("prodotti", prodotti); // Imposta l'attributo "prodotti" sulla richiesta

		        request.getRequestDispatcher("Profilo.jsp").forward(request, response);
		    }
			
		}
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}