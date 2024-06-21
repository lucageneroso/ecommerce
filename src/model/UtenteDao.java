package model;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UtenteDao {
	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/ingrosso");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}


	private static final String TABLE_NAME = "Cliente";
			
	public synchronized void doSave(Utente u) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + UtenteDao.TABLE_NAME
				+ " (email,pass,nome,cognome,indirizzo,citta,provincia,cap, tipo_account) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, u.getEmail());
			preparedStatement.setString(2, u.getPass());
			preparedStatement.setString(3, u.getNome());
			preparedStatement.setString(4, u.getCognome());
			preparedStatement.setDate(5, u.getData());
			preparedStatement.setString(6, u.getIBAN());
			preparedStatement.setString(8, u.getUsername());
			preparedStatement.setInt(9, u.getIVA());

			preparedStatement.executeUpdate();

			//connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}
	
	public synchronized void doSaveRistretto(Utente u) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + UtenteDao.TABLE_NAME
				+ " (email,pass,nome,cognome) VALUES (?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, u.getEmail());
			preparedStatement.setString(2, u.getPass());
			preparedStatement.setString(3, u.getNome());
			preparedStatement.setString(4, u.getCognome());	
			preparedStatement.executeUpdate();

			//connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}
	
	public Utente doRetrieveByEmail(String email) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    Utente utente = null;
	    String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE email = ?";

	    try {
	        connection = ds.getConnection();
	        preparedStatement = connection.prepareStatement(selectSQL);
	        preparedStatement.setString(1, email);

	        ResultSet rs = preparedStatement.executeQuery();

	        if (rs.next()) {
	            utente = new Utente();
	            utente.setEmail(rs.getString("Email"));
	            utente.setNome(rs.getString("nome"));
	            utente.setCognome(rs.getString("cognome"));
	            utente.setUsername(rs.getString("username"));
	            utente.setData(rs.getDate("data_di_nascita"));
	            utente.setIBAN(rs.getString("Iban"));
	            utente.setPass(rs.getString("PasswordCliente"));
	            utente.setIVA(rs.getInt("IVA"));
	        }

	    } finally {
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	        } finally {
	            if (connection != null)
	                connection.close();
	        }
	    }

	    return utente;
	}
	
	public void doUpdate(Utente u) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    String query = "UPDATE utente SET nome=?, cognome=?, indirizzo=?, citta=?, provincia=?, cap=?, pass=? WHERE email=?";
	    
	    try {
	    	connection = ds.getConnection();
	        
	        preparedStatement = connection.prepareStatement(query);

			preparedStatement.setString(1, u.getEmail());
			preparedStatement.setString(2, u.getPass());
			preparedStatement.setString(3, u.getNome());
			preparedStatement.setString(4, u.getCognome());
			preparedStatement.setDate(5, u.getData());
			preparedStatement.setString(6, u.getIBAN());
			preparedStatement.setString(8, u.getUsername());
			preparedStatement.setInt(9, u.getIVA());

	        preparedStatement.executeUpdate();
	    } finally {
	        if (preparedStatement != null) {
	            preparedStatement.close();
	        }
	        if (connection != null) {
	            connection.close();
	        }
	    }
	}
	
	public List<Utente> doRetrieveAll() throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        List<Utente> utenti = new ArrayList<>();
        String selectSQL = "SELECT * FROM " + TABLE_NAME;

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Utente utente = new Utente();
                utente.setEmail(rs.getString("Email"));
	            utente.setNome(rs.getString("nome"));
	            utente.setCognome(rs.getString("cognome"));
	            utente.setUsername(rs.getString("username"));
	            utente.setData(rs.getDate("data_di_nascita"));
	            utente.setIBAN(rs.getString("Iban"));
	            utente.setPass(rs.getString("PasswordCliente"));
	            utente.setIVA(rs.getInt("IVA"));

                utenti.add(utente);
            }

        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }

        return utenti;
    }
	
	public List<Utente> searchByEmail(String email) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    List<Utente> utenti = new ArrayList<>();
	    String selectSQL = "SELECT * FROM utente WHERE email LIKE ?";

	    try {
	        connection = ds.getConnection();
	        preparedStatement = connection.prepareStatement(selectSQL);
	        
	        preparedStatement.setString(1, "%" + email + "%");

	        ResultSet rs = preparedStatement.executeQuery();

	        while (rs.next()) {
	            Utente utente = new Utente();
	            utente.setEmail(rs.getString("Email"));
	            utente.setNome(rs.getString("nome"));
	            utente.setCognome(rs.getString("cognome"));
	            utente.setUsername(rs.getString("username"));
	            utente.setData(rs.getDate("data_di_nascita"));
	            utente.setIBAN(rs.getString("Iban"));
	            utente.setPass(rs.getString("PasswordCliente"));
	            utente.setIVA(rs.getInt("IVA"));

	            utenti.add(utente);
	        }

	    } finally {
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	        } finally {
	            if (connection != null)
	                connection.close();
	        }
	    }

	    return utenti;
	}


}