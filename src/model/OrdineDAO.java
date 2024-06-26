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
        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE indirizzo = ?";

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

                Ordine ordine = new Ordine();
                ordine.setNumeroOrdine(numeroOrdine);
                ordine.setData(data);
                ordine.setTotale(totale);
                ordine.setStato(stato);
                ordine.setNumeroProdotti(numeroProdotti);
                ordine.setIVA_cliente(IVA_cliente);
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

   /* public List<Ordine> searchByEmail(String email) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        List<Ordine> ordini = new ArrayList<>();
        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE email LIKE ?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);

            preparedStatement.setString(1, "%" + email + "%");

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int numeroOrdine = rs.getInt("id_ordine");
                Date data = rs.getDate("data");
                double totale = rs.getDouble("totale");
                String stato = rs.getString("stato");
                int numeroProdotti = rs.getInt("numero_rodotti");
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
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }

        return ordini;
    }*/

    public Ordine getOrdineByNumero(int numeroOrdine) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE id_ordine = ?";
        Ordine ordine = null;

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

   /* public List<Prodotto> getProdotti(int idO) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        List<Prodotto> prodotti = new ArrayList<>();
        String selectSQL = "SELECT p.id, p.nome, p.foto FROM Prodotto p JOIN DettagliOrdine d ON p.id = d.codP WHERE d.idO = ?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setInt(1, idO);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("p.id");
                String nome = rs.getString("p.nome");
                byte[] foto = rs.getBytes("p.foto");

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
    }*/

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
