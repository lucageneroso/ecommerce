<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Ordine" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="model.Utente" %>

<%
    HttpSession sessione = request.getSession();
    List<Ordine> ordini = (List<Ordine>) sessione.getAttribute("ordini");
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profilo Utente</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
        }
        .header-profilo {
            background-color: orange;
            color: #fff;
            padding: 10px;
            text-align: center;
            margin-bottom: 20px;
            border-radius: 10px;
        }
        .info-box {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .info-box h2 {
            margin-top: 0;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }
        .button-home {
            margin: 10px;
            background-color: white;
            border-color: orange;
            border-radius: 5px;
            display: inline-block;
            padding: 5px;
            border: 1px solid #ddd;
        }
        .button-home a {
            text-decoration: none;
            color: orange;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .order-item {
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header-profilo">
            <h1>Benvenuto, <%= sessione.getAttribute("nome") != null ? sessione.getAttribute("nome") : "" %> <%= sessione.getAttribute("cognome") != null ? sessione.getAttribute("cognome") : "" %></h1>
        </div>
        <div class="info-box">
            <h2>Informazioni Utente</h2>
            <p><strong>Nome:</strong> <%= sessione.getAttribute("nome") != null ? sessione.getAttribute("nome") : "N/A" %></p>
            <p><strong>Cognome:</strong> <%= sessione.getAttribute("cognome") != null ? sessione.getAttribute("cognome") : "N/A" %></p>
            <p><strong>Email:</strong> <%= sessione.getAttribute("Email") != null ? sessione.getAttribute("Email") : "N/A" %></p>
            <p><strong>Data di Nascita:</strong> <%= sessione.getAttribute("data_di_nascita") != null ? sdf.format(sessione.getAttribute("data_di_nascita")) : "N/A" %></p>
            <p><strong>IBAN:</strong> <%= sessione.getAttribute("Iban") != null ? sessione.getAttribute("Iban") : "N/A" %></p>
            <p><strong>Tipo Account:</strong> <%= sessione.getAttribute("Tipo_account") != null && sessione.getAttribute("Tipo_account").equals(0) ? "Standard" : "Amministratore" %></p>
        </div>
        <div class="button-home">
            <a href="Home.jsp">Torna alla Home</a>
        </div>
        <div class="info-box">
            <h2>I tuoi ordini:</h2>
            <table>
                <tr>
                    <th>ID Ordine</th>
                    <th>Data</th>
                    <th>Totale</th>
                    <th>Stato</th>
                    <th>Numero Prodotti</th>
                </tr>
                <% if (ordini != null && !ordini.isEmpty()) { 
                    for (Ordine ordine : ordini) { %>
                        <tr>
                            <td><%= ordine.getNumeroOrdine() %></td>
                            <td><%= sdf.format(ordine.getData()) %></td>
                            <td><%= ordine.getTotale() %></td>
                            <td><%= ordine.getStato() %></td>
                            <td><%= ordine.getNumeroProdotti() %></td>
                        </tr>
                <% } 
                } else { %>
                    <tr>
                        <td colspan="5">Non hai effettuato alcun ordine.</td>
                    </tr>
                <% } %>
            </table>
        </div>
    </div>
</body>
</html>
