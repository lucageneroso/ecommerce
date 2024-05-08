package ecommerce;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;

//ggggggggggggggggggggg

public class Servlet_TSW extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
	    response.getWriter().println("Hello, world!");
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String paramName = request.getParameter("name");
	    
	    // Esegui qualche elaborazione
	    String responseMessage = "Hello, " + paramName;
	    
	    // Imposta il tipo di contenuto della risposta
	    response.setContentType("text/plain");
	    
	    // Scrivi la risposta
	    response.getWriter().println(responseMessage);
	}
}
