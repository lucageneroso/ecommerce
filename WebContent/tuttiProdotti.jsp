<%@ page contentType="text/html; charset=UTF-8" import="java.util.*, control.*, model.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

ProductDao productDAO = new ProductDao();
List<Prodotto> prodotti = productDAO.doRetrieveAll();

// Verifica se la lista prodotti è vuota o nulla
if (prodotti.isEmpty()) {
    out.println("N");
}
%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="utf-8">
    <title>Tutti i Prodotti</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/Product.css">
</head>
<body>
    <jsp:include page="fragments/header.jsp" />
    <br><br>

    <div class="content">
        <h1>Prodotti</h1>
        <ul id="product-list">
            <%
                if (prodotti != null && !prodotti.isEmpty()) {
                    for (Prodotto product : prodotti) {
                    	
                    	byte[] imageBytes = product.getImg();
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                        
                        out.println("<li><a href='ProductDetails.jsp?id=" + product.getID() + "'>" +
                                product.getNome() + "<br>" +
                                "<img src='data:image/jpg;base64," + base64Image + "' alt='Immagine Prodotto' style='max-width:100px;'>"+
                                "</a></li>");
                    }
                } else {
                    out.println("<li>Nessun prodotto disponibile</li>");
                }
            %>
        </ul>
        </div>

    <jsp:include page="fragments/footer.jsp" />
</body>
