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

public class DettagliOrdineDAO {
    private DataSource dataSource;

    public DettagliOrdineDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public void doSave(DettagliOrdine dettaglioOrdine) throws SQLException {
        Connection conn = null;
        PreparedStatement preparedStatement = null;

        try {
            conn = dataSource.getConnection();
            String insertSQL = "INSERT INTO DettagliOrdine (idOrdine, idProdotto, quantita) VALUES (?, ?, ?)";

            preparedStatement = conn.prepareStatement(insertSQL);
            preparedStatement.setInt(1, dettaglioOrdine.getIdOrdine());
            preparedStatement.setInt(2, dettaglioOrdine.getIdProdotto());
            preparedStatement.setInt(3, dettaglioOrdine.getQuantita());

            preparedStatement.executeUpdate();
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
}
