package control;

import java.io.*;
import java.sql.*;

public class AggiuntaProdottoDatabase {
	
	public static void main(String[] args) {
        String jdbcURL = "jdbc:mysql://localhost:3306/ingrosso";
        String dbUser = "root";
        String dbPassword = "root";
        
        try {
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            String sql = "INSERT INTO Prodotto (idProdotto, Quantita, Fornitore_IVA, Prezzo, Nome, Descrizione, Categoria, Situato_in, Sconto, Foto) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, 3);
            statement.setInt(2, 100);
            statement.setInt(3, 13579);
            statement.setDouble(4, 9.99);
            statement.setString(5, "Rotolone");
            statement.setString(6, "Rotolone molto buono");
            statement.setString(7, "Cucina");
            statement.setString(8, "Via Spennata");
            statement.setDouble(9, 0);
            
            //String q="insert into images(pic) values(?)";

            //PreparedStatement pstmt=connection.prepareStatement(q);
            // pstmt.setString(1,"value");
            File imageFile = new File("C:\\Users\\rical\\git\\ecommerce\\src\\control\\rotolone.jpg");
            FileInputStream fis = new FileInputStream(imageFile);
            statement.setBinaryStream(10, fis, (int) imageFile.length());
            statement.executeUpdate();
            
            /*
            File imageFile = new File(filePath);
            try (FileInputStream fis = new FileInputStream(imageFile)) {
                statement.setBlob(10, fis);

                // Esegui l'inserimento nel database
                int row = statement.executeUpdate();
                if (row > 0) {
                    System.out.println("Prodotto inserito correttamente nel database con l'immagine.");
                } else {
                    System.out.println("Nessuna riga inserita nel database.");
                }
            } catch (IOException e) {
                e.printStackTrace();
                System.err.println("Errore durante la lettura del file immagine: " + e.getMessage());
            }

            int row = statement.executeUpdate();
            if (row > 0) {
                System.out.println("L'immagine è stata caricata e salvata nel database.");
            }
            */

            connection.close();
            System.out.println("Prodotto aggiunto");
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
	

}
