package control;
import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import model.Utente;
import model.UtenteDao;
import model.Ordine;
import model.OrdineDAO;
import java.util.Date;

/**

Servlet implementation class RegistrationControl
*/
public class RegistrationControl extends HttpServlet {
private static final long serialVersionUID = 1L;
UtenteDao model = new UtenteDao();
/**

@see HttpServlet#HttpServlet()
*/
public RegistrationControl() {
super();
}
/**

@see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
*/
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action = request.getParameter("action");
    
    if (action != null && action.equalsIgnoreCase("logout")) {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("Home.jsp");
    }
}
/**

@see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
*/
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String action = request.getParameter("action");
	try {
		
	if (action != null) {
		
		if (action.equalsIgnoreCase("insert")) {
			String email = request.getParameter("Email");
			String pass = request.getParameter("PasswordCliente");
			String nome = request.getParameter("nome");
			String cognome = request.getParameter("cognome");
			String IBAN = request.getParameter("Iban");
			String username = request.getParameter("username");
			
			
            Utente bean = new Utente();
			bean.setEmail(email);
			bean.setPass(pass);
			bean.setIBAN(IBAN);
			bean.setUsername(username);
			bean.setCognome(cognome);
			bean.setNome(nome);
			model.doSave(bean);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Home.jsp");
			dispatcher.forward(request, response);
		}
		if (action.equalsIgnoreCase("insertbreve")) {
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			String nome = request.getParameter("nome");
			String cognome = request.getParameter("cognome");
			
			Utente bean = new Utente();
			bean.setEmail(email);
			bean.setPass(pass);
			bean.setCognome(cognome);
			bean.setNome(nome);
			HttpSession session = request.getSession();
            session.setAttribute("email", bean.getEmail());
            session.setAttribute("cognome", bean.getCognome());
            session.setAttribute("nome", bean.getNome());
            session.setAttribute("password", bean.getPass());
		
			model.doSaveRistretto(bean);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Home.jsp");
			System.out.println("Stai a piedi 1");
			dispatcher.forward(request, response);
		}
		if (action.equalsIgnoreCase("login")){
            String email = request.getParameter("username");
            String pwd = request.getParameter("pass");
            
            try {
                UtenteDao dao = new UtenteDao();
                Utente utente = dao.doRetrieveByEmail(email);
                
                if (utente != null && utente.getPass().equals(pwd)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("email", utente.getEmail());
                    session.setAttribute("username", utente.getUsername());
                    session.setAttribute("cognome", utente.getCognome());
                    session.setAttribute("pass", utente.getPass());
                    session.setAttribute("Iva", utente.getIVA());
                    session.setAttribute("IBAN", utente.getIBAN());
                    session.setAttribute("nome", utente.getNome()); 
                    session.setAttribute("tipo_account", utente.getTipo_account());
                    if(utente.getTipo_account()==0) {
                    	System.out.println("Stai a piedi 2");
                    	response.sendRedirect(request.getContextPath() + "/Home.jsp");
                    } 
                    else if (utente.getTipo_account() == 1) {
                        response.sendRedirect(request.getContextPath() + "/Amministratore.jsp");
                    }
                    
            } else {
                	request.setAttribute("errore", "Email o password non validi");
                    request.getRequestDispatcher("/Accedi.jsp").forward(request, response);
                    
                }
                }catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errore", "Errore del database: " + e.getMessage());
                request.getRequestDispatcher("/Accedi.jsp").forward(request, response);
            }
        }
		if (action.equalsIgnoreCase("searchByEmail")) {

		    try {
		    	String email = request.getParameter("email");
	            // Esegui la logica per ottenere gli utenti corrispondenti all'email dal tuo database
		        UtenteDao dao = new UtenteDao();
		        List<Utente> utenti = dao.searchByEmail(email);

	            // Converte gli utenti in formato JSON e invia la risposta
	            Gson gson = new Gson();
	            String json = gson.toJson(utenti);
	            response.setContentType("application/json");
	            response.setCharacterEncoding("UTF-8");
	            response.getWriter().write(json);

		    } catch (SQLException e) {
		        e.printStackTrace();
		        request.setAttribute("errore", "Errore del database: " + e.getMessage());
		    }
		}
        if (action != null && action.equalsIgnoreCase("modifica")) {
            String email = request.getParameter("email");
            String nome = request.getParameter("nome");
            String cognome = request.getParameter("cognome");
            String username = request.getParameter("username");
            String IBAN = request.getParameter("IBAN");
            String pass = request.getParameter("pass");
            
            Utente utente = new Utente();
            utente.setEmail(email);
            utente.setNome(nome);
            utente.setCognome(cognome);
            utente.setIVA(0);
            utente.setPass(pass);
            
            OrdineDAO ordine = new OrdineDAO();
            UtenteDao utenteDao = new UtenteDao();
            utenteDao.doUpdate(utente);
            ArrayList<Ordine> ordini= (ArrayList<Ordine>) ordine.searchByEmail(email);
            HttpSession session = request.getSession();
            session.setAttribute("email", utente.getEmail());
            session.setAttribute("username", utente.getUsername());
            session.setAttribute("cognome", utente.getCognome());
            session.setAttribute("pass", utente.getPass());
            session.setAttribute("Iva", utente.getIVA());
            session.setAttribute("IBAN", utente.getIBAN());
            session.setAttribute("nome", utente.getNome()); 
            request.setAttribute("ordini", ordini);
            
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Profilo.jsp");
            dispatcher.forward(request, response);
        }
	}}
	catch (SQLException e) {
	System.out.println("Error:" + e.getMessage());
	request.setAttribute("errore2", "Mail gia usata" );
	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Accedi.jsp");
	dispatcher.forward(request, response);
}
	
}}
