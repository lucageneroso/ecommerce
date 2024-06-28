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

    public List<Ordine> getOrdini(String indirizzo) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        List<Ordine> ordini = new ArrayList<>();
        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE EmailCliente = ?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, indirizzo);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int numeroOrdine = rs.getInt("id_ordine");
                Date data = rs.getDate("data");
                double totale = rs.getDouble("totale");
                String stato = rs.getString("stato");
                int numeroProdotti = rs.getInt("numero_prodotti");
                int IVA_cliente = rs.getInt("IVA_cliente");
                String EmailCliente=rs.getString("EmailCliente");
                Ordine ordine = new Ordine();
                ordine.setNumeroOrdine(numeroOrdine);
                ordine.setData(data);
                ordine.setTotale(totale);
                ordine.setStato(stato);
                ordine.setNumeroProdotti(numeroProdotti);
                ordine.setIVA_cliente(IVA_cliente);
                ordine.setEmailCliente(EmailCliente);
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
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE id_ordine = ?";
        Ordine ordine = new Ordine();

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setInt(1, numeroOrdine);

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                ordine = new Ordine();
                ordine.setNumeroOrdine(rs.getInt("id_ordine"));
                ordine.setData(rs.getDate("data"));
                ordine.setTotale(rs.getDouble("totale"));
                ordine.setStato(rs.getString("stato"));
                ordine.setNumeroProdotti(rs.getInt("numero_prodotti"));
                ordine.setIVA_cliente(rs.getInt("IVA_cliente"));
                ordine.setEmailCliente(rs.getString("EmailCliente"));
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

        return ordine;
    }

    public void aggiornaStatoOrdine(int numeroOrdine, String nuovoStato) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String updateSQL = "UPDATE " + TABLE_NAME + " SET stato = ? WHERE id_ordine = ?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(updateSQL);
            preparedStatement.setString(1, nuovoStato);
            preparedStatement.setInt(2, numeroOrdine);

            preparedStatement.executeUpdate();

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
    }

   public List<Prodotto> getProdotti(int idO) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        List<Prodotto> prodotti = new ArrayList<>();
        String selectSQL = "SELECT p.idProdotto, p.Quantita, p.Prezzo, p.Nome, p.Descrizione, p.Categoria, p.Sconto, p.Foto " +
             "FROM Prodotto p " +
             "JOIN DettagliOrdine d ON p.idProdotto = d.idProdotto " +
             "WHERE d.idOrdine = ?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setInt(1, idO);

            ResultSet rs = preparedStatement.executeQuery();

             while (rs.next()) {
            Prodotto prodotto = new Prodotto();
<<<<<<< HEAD
            prodotto.setIdProdotto(rs.getInt("idProdotto"));
=======
            prodotto.setID(rs.getInt("idProdotto"));
>>>>>>> branch 'masterL' of https://github.com/lucageneroso/ecommerce.git
            prodotto.setQuantita(rs.getInt("Quantita"));
            prodotto.setPrezzo(rs.getDouble("Prezzo"));
            prodotto.setNome(rs.getString("Nome"));
            prodotto.setDescrizione(rs.getString("Descrizione"));
            prodotto.setCategoria(rs.getString("Categoria"));
            prodotto.setSconto(rs.getDouble("Sconto"));
            prodotto.setImg(rs.getBytes("Foto"));

            prodotti.add(prodotto);
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
   
<<<<<<< HEAD
   public void doSave(Ordine ordine) throws SQLException {
       Connection connection = null;
       PreparedStatement preparedStatement = null;

       String insertSQL = "INSERT INTO Ordine (id_ordine, indirizzo, data, totale, stato, numero_prodotti, IVA_cliente, EmailCliente, citta, CAP, provincia) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

       try {
           connection = ds.getConnection();
           preparedStatement = connection.prepareStatement(insertSQL);

           preparedStatement.setInt(1, ordine.getNumeroOrdine());
           preparedStatement.setString(2, ordine.getIndirizzo());
           preparedStatement.setDate(3, new java.sql.Date(ordine.getData().getTime()));
           preparedStatement.setDouble(4, ordine.getTotale());
           preparedStatement.setString(5, ordine.getStato());
           preparedStatement.setInt(6, ordine.getNumeroProdotti());
           preparedStatement.setInt(7, ordine.getIVA_cliente());
           preparedStatement.setString(8, ordine.getEmailCliente());
           preparedStatement.setString(9, ordine.getCitta());
           preparedStatement.setInt(10, ordine.getCAP());
           preparedStatement.setString(11, ordine.getProvincia());

           preparedStatement.executeUpdate();
       } finally {
           try {
               if (preparedStatement != null)
                   preparedStatement.close();
           } finally {
               if (connection != null)
                   connection.close();
           }
       }
=======
   public int doSave(String indirizzo, double totale, String stato, int numProdotti, int Iva, String Email, String citta, int CAP, String provincia ) throws SQLException {
	   int idOrdineGenerato = -1;
       Connection connection = null;
       PreparedStatement preparedStatement = null;

       String insertSQL = "INSERT INTO Ordine (indirizzo, data, totale, stato, numero_prodotti, IVA_cliente, Email_cliente, citta, CAP, provincia) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

       try {
           connection = ds.getConnection();
           preparedStatement = connection.prepareStatement(insertSQL);

           preparedStatement.setString(1, indirizzo);
           
           Date utilDate = new Date(); // ottieni la data corrente in java.util.Date
           java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime()); // converti in java.sql.Date
           preparedStatement.setDate(2, sqlDate);
           
           preparedStatement.setDouble(3, totale);
           preparedStatement.setString(4, stato);
           preparedStatement.setInt(5, numProdotti);
           preparedStatement.setInt(6, Iva);
           preparedStatement.setString(7,Email);
           preparedStatement.setString(8,citta);
           preparedStatement.setInt(9,CAP);
           preparedStatement.setString(10,provincia);

           int rowsInserted = preparedStatement.executeUpdate();
           System.out.println("righe "+rowsInserted);
           
           
           ResultSet rs = preparedStatement.executeQuery("SELECT LAST_INSERT_ID()");
           if (rs.next()) {
               idOrdineGenerato = rs.getInt(1);
               System.out.println("Ultimo ID inserito: " + idOrdineGenerato);
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
       
       return idOrdineGenerato;
>>>>>>> branch 'masterL' of https://github.com/lucageneroso/ecommerce.git
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
                int numeroOrdine = rs.getInt("id_ordine");
                Date data = rs.getDate("data");
                double totale = rs.getDouble("totale");
                String stato = rs.getString("stato");
                int numeroProdotti = rs.getInt("numero_prodotti");
                int IVA_cliente = rs.getInt("IVA_cliente");

                Ordine ordine = new Ordine();
                ordine.setNumeroOrdine(numeroOrdine);
                ordine.setData(data);
                ordine.setTotale(totale);
                ordine.setStato(stato);
                ordine.setNumeroProdotti(numeroProdotti);
                ordine.setIVA_cliente(IVA_cliente);
                ordini.add(ordine);
            }

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
}