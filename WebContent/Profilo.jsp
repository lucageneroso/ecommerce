<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Ordine" %>
<%@ page import="model.Utente" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
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
        .header {
            background-color: orange;
            color: #fff;
            padding: 10px;
            text-align: center;
            margin-bottom: 20px;
        }
        .info-box {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .info-box h2 {
            margin-top: 0;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }
        .order-list {
            margin-top: 20px;
        }
        .order-item {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
        }
        .order-item h3 {
            margin-top: 0;
            border-bottom: 1px solid #ddd;
            padding-bottom: 5px;
        }
        .order-item p {
            margin: 5px 0;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>Profilo Utente</h1>
    </div>
    
    <div class="info-box">
        <h2>Informazioni Utente</h2>
        <p><strong>Nome:</strong> <%= session.getAttribute("nome") %></p>
        <p><strong>Cognome:</strong> <%= session.getAttribute("cognome") %></p>
        <p><strong>Email:</strong> <%= session.getAttribute("Email") %></p>
        <p><strong>Data di Nascita:</strong> <%= new SimpleDateFormat("dd/MM/yyyy").format(session.getAttribute("data_di_nascita")) %></p>
        <p><strong>IBAN:</strong> <%= session.getAttribute("Iban") %></p>
<!--  <p><strong>Tipo Account:</strong> <//%= session.getAttribute("Tipo_account").equals(0) ? "Standard" : "Amministratore" %></p> -->
    </div>
     <div class="button-container">
        				<a href="Home.jsp">Torna alla Home</a>
    					</div>
    <div class="info-box">
        <h2>Ordini Effettuati</h2>
        <div class="order-list">
            <% List<Ordine> ordini = (List<Ordine>) request.getAttribute("ordini"); %>
            <% if (ordini != null && !ordini.isEmpty()) { %>
                <% for (Ordine ordine : ordini) { %>
                    <div class="order-item">
                        <h3>Ordine <%= ordine.getNumeroOrdine() %> - Data: <%= new SimpleDateFormat("dd/MM/yyyy").format(ordine.getData()) %></h3>
                        <p><strong>Totale:</strong> <%= ordine.getTotale() %></p>
                        <p><strong>Stato:</strong> <%= ordine.getStato() %></p>
                        <p><strong>Numero Prodotti:</strong> <%= ordine.getNumeroProdotti() %></p>
                        <p><strong>IVA Cliente:</strong> <%= ordine.getIVA_cliente() %></p>
                       
                        
                    </div>
                <% } %>
            <% } else { %>
                <p>Nessun ordine trovato.</p>
            <% } %>
        </div>
    </div>
</div>

</body>
</html>
