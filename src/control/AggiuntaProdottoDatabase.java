package control;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AggiuntaProdottoDatabase {

	
	public static void main(String[] args) {
        String jdbcURL = "jdbc:mysql://localhost:3306/ingrosso";
        String dbUser = "root";
        String dbPassword = "root";

        String filePath = "C:\\Users\\rical\\OneDrive\\Desktop\\rotolone.jpg";
        
        try {
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            String sql = "INSERT INTO Prodotto (idProdotto, Quantita, Fornitore_IVA, Prezzo, Nome, Descrizione, Categoria, Situato_in, Sconto, Foto) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, 2);
            statement.setInt(2, 100);
            statement.setInt(3, 13579);
            statement.setDouble(4, 9.99);
            statement.setString(5, "Rotolone");
            statement.setString(6, "Rotolone molto buono");
            statement.setString(7, "Cucina");
            statement.setString(8, "Via Spennata");
            statement.setDouble(9, 0);
            statement.setBlob(10, new FileInputStream(new File(filePath)));

            int row = statement.executeUpdate();
            if (row > 0) {
                System.out.println("L'immagine è stata caricata e salvata nel database.");
            }

            connection.close();
        } catch (SQLException | IOException ex) {
            ex.printStackTrace();
        }
    }
	

}
