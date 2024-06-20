package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrdineDAO {
	private static DataSource ds;
    private List<Ordine> ordini;
    private static final String TABLE_NAME = "Ordine";
    static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/ingrosso");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
    
    public OrdineDAO() {
        ordini = new ArrayList<>();
    }
    
    public void aggiungiOrdine(Ordine ordine) {
        ordini.add(ordine);
    }
    
    public List<Ordine> getOrdini(String indirizzo) {
    	Connection connection = null;
	    PreparedStatement preparedStatement = null;
    	List<Ordine> ordini = new ArrayList<>();
    	String selectSQL = "SELECT * FROM ordine WHERE indirizzo = ?";
    	
    	try {
	        connection = ds.getConnection();
	        preparedStatement = connection.prepareStatement(selectSQL);
	        preparedStatement.setString(1, indirizzo);

	        ResultSet rs = preparedStatement.executeQuery();

	        while (rs.next()) {
                int numeroOrdine = rs.getInt("numeroOrdine");
                Date data = rs.getDate("data");
                double totale = rs.getDouble("totale");
                String stato = rs.getString("stato");
                //String indirizzo = rs.getString("indirizzo");
                //String cap = rs.getString("cap");
                //String provincia = rs.getString("provincia");
                //String citta = rs.getString("citta");
                int numeroProdotti = rs.getInt("numero_prodotti");
                int IVA = rs.getInt("IVA_cliente");


                Ordine ordine = new Ordine();
                //ordine.setCap(cap);
                //ordine.setCitta(citta);
                ordine.setData(data);
                ordine.setIndirizzo(indirizzo);
                ordine.setIVA_cliente(IVA);
                ordine.setNumeroProdotti(numeroProdotti);
                //ordine.setProvincia(provincia);
                ordine.setTotale(totale);
                ordine.setNumeroOrdine(numeroOrdine);
                ordine.setStato(stato);
                ordini.add(ordine);
	        }

	    } catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	        } catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
	            if (connection != null)
					try {
						connection.close();
					} catch (SQLException e) {
						
						e.printStackTrace();
					}
	        }
	    }

	    return ordini;

    }
    

    
    public Ordine getOrdineByNumero(int numeroOrdine) {
        for (Ordine ordine : ordini) {
            if (ordine.getNumeroOrdine() == numeroOrdine) {
                return ordine;
            }
        }
        return null;
    }
    
    public void aggiornaStatoOrdine(int numeroOrdine, String nuovoStato) {
        Ordine ordine = getOrdineByNumero(numeroOrdine);
        if (ordine != null) {
            ordine.setStato(nuovoStato);
        }
    }

	public List<Prodotto> getProdotti(int idO) {
		Connection connection = null;
	    PreparedStatement preparedStatement = null;
    	List<Prodotto> prodotti = new ArrayList<Prodotto>();
    	String selectSQL = "SELECT prodotto.id, prodotto.nome,  FROM Prodotto" 
    		    + " WHERE Prodotto.id=id0";

    	
    	try {
	        connection = ds.getConnection();
	        preparedStatement = connection.prepareStatement(selectSQL);
	        preparedStatement.setInt(1, idO);

	        ResultSet rs = preparedStatement.executeQuery();

	        while (rs.next()) {
	        	int id = rs.getInt("Prodotto.id");
	        	String nome = rs.getString("Prodotto.nome");
	        	byte[] foto = rs.getBytes("Prodotto.foto");
	        	Prodotto bean = new Prodotto();
	        	bean.setID(id);
	        	bean.setNome(nome);
	        	bean.setImg(foto);
                prodotti.add(bean);
	        }

	    } catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	        } catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
	            if (connection != null)
					try {
						connection.close();
					} catch (SQLException e) {
						
						e.printStackTrace();
					}
	        }
	    }

	    return prodotti;
	}
    
	public List<Ordine> getAllOrdini() throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    List<Ordine> ordini = new ArrayList<>();
	    String selectSQL = "SELECT * FROM " + TABLE_NAME;

	    try {
	        connection = ds.getConnection();
	        preparedStatement = connection.prepareStatement(selectSQL);

	        ResultSet rs = preparedStatement.executeQuery();

	        while (rs.next()) {
	        	int numeroOrdine = rs.getInt("numeroOrdine");
                Date data = rs.getDate("data");
                double totale = rs.getDouble("totale");
                String stato = rs.getString("stato");
                //String indirizzo = rs.getString("indirizzo");
                //String cap = rs.getString("cap");
                //String provincia = rs.getString("provincia");
                //String citta = rs.getString("citta");
                int numeroProdotti = rs.getInt("numero_prodotti");
                int IVA = rs.getInt("IVA_cliente");

	            Ordine ordine = new Ordine();
	            //ordine.setCap(cap);
                //ordine.setCitta(citta);
                ordine.setData(data);
                ordine.setIndirizzo(indirizzo);
                ordine.setIVA_cliente(IVA);
                ordine.setNumeroProdotti(numeroProdotti);
                //ordine.setProvincia(provincia);
                ordine.setTotale(totale);
                ordine.setNumeroOrdine(numeroOrdine);
                ordine.setStato(stato);
                ordini.add(ordine);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
            if (connection != null)
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
        }
	    return ordini;
	}


	/*public void ValutaProd(String email, int codP, int val) {
		Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    String sql1 ="INSERT INTO recensioni (valutazione, email, codp)"+
		"VALUES (?,?,?)";
	    try {
	        connection = ds.getConnection();
	        preparedStatement = connection.prepareStatement(sql1);
	        preparedStatement.setInt(1, val);
	        preparedStatement.setString(2,email);
	        preparedStatement.setInt(3,codP);
	        preparedStatement.executeUpdate();
		
	}catch (SQLException e) {
		
		e.printStackTrace();
	} finally {
        try {
            if (preparedStatement != null)
                preparedStatement.close();
        } catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
            if (connection != null)
				try {
					connection.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
        }
    }

}*/
	
}
