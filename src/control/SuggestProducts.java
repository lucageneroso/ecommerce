package control;
import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.google.gson.Gson;
import model.Prodotto;

@WebServlet("/suggestProducts")
public class SuggestProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String query = request.getParameter("query");

        // Simulazione del recupero dei risultati dal database
        List<String> products = getProducts(query);

        // Converti la lista di prodotti in JSON
        JSONArray jsonArray = new JSONArray(products);
        String json = jsonArray.toString();

        // Imposta le intestazioni della risposta
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Scrivi la risposta
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
    }
    
    private List<String> getProducts(String query) {
        List<String> productList = new ArrayList<>();

        String jdbcURL = "jdbc:mysql://localhost:3306/ingrosso";
        String jdbcUsername = "root";
        String jdbcPassword = "root";

        String sql = "SELECT Nome FROM Prodotto WHERE Nome LIKE ?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + query + "%");

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String productName = resultSet.getString("Nome");
                productList.add(productName);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return productList;
    }
}
	
	
