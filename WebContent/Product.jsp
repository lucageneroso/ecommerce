<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.ProductDao" %>
<%@ page import="model.Prodotto" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*, control.*, model.*" %>


<%

String categoria = request.getParameter("categoria");
if (categoria == null || categoria.isEmpty()) {
    response.sendRedirect("Home.jsp"); // Reindirizza alla homepage se manca la categoria
    return;
}

ProductDao productDAO = new ProductDao();
List<Prodotto> prodotti = productDAO.doRetrieveByCategoria(categoria);

// Verifica se la lista prodotti è vuota o nulla
if (prodotti.isEmpty()) {
    out.println("<p>Nessun prodotto disponibile per la categoria: " + categoria + "</p>");
}
%>


<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Prodotti</title>
    
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/Product.css">
</head>
<body>
    <%@ include file="fragments/header.jsp" %>
    
    <div class="content">
        <h1>Prodotti della Categoria: <%= categoria %></h1>
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
    
    <%@ include file="fragments/footer.jsp" %>

    
</body>
</html>