<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.*,model.Prodotto,model.Cart,model.immagine"%>

<%
    Prodotto product = (Prodotto) request.getAttribute("product");
    Cart cart = (Cart) session.getAttribute("cart");
    Float mediaAttribute = (Float) request.getAttribute("media");
    float media = (mediaAttribute != null) ? mediaAttribute : 0.0f;
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Dettagli prodotto</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,700;1,800&display=swap');

        * {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: #f5f5f7;
        }
        
        /* Altri stili */
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/zooming/build/zooming.min.js"></script>
</head>
<body>
<div class="banner"> 
    <a href="Home.jsp"><img src="./nuovologo.png" id="image" alt="#"></a>
    <div class="dx">
        <% if (session.getAttribute("email") == null) { %>
            <a href="#0" id="cercap"><img src="cerca.png" alt="#"></a>
            <div class="cerca">
                <form action="product" method="GET">
                    <input type="text" name="nome" id="searchInput" placeholder="Cerca prodotto">
                    <button type="submit" onclick="submitSearch(event)">Cerca</button>
                </form>
            </div>
            <a href="Accedi.jsp"><img src="utente.png" alt="#"></a>
            <a href="product?action=viewC"><img src="cart.png" alt="#"></a>
        <% } else { %>
            <a href="#0" id="cercap"><img src="cerca.png" alt="#"></a>
            <div class="cerca">
                <form action="product" method="GET">
                    <input type="text" name="nome" id="searchInput" placeholder="Cerca prodotto">
                    <button type="submit" onclick="submitSearch(event)">Cerca</button>
                </form>
            </div>
            <a href="ordine?action=ViewOrdini&email=<%=session.getAttribute("email") %>"><img src="utente.png" alt="#"></a>
            <a href="registration?action=logout"><img src="logout.png" alt="#"></a>
            <a href="product?action=viewC"><img src="cart.png" alt="#"></a>
        <% } %>
    </div>
</div>
<%
    if (product != null) {
        byte[] imageB = product.getImg();
        String base64img = "";
        if (imageB != null) {
            base64img = Base64.getEncoder().encodeToString(imageB);
        }
%>

<div class="cart">
    <div class="row row1">
        <div class="col-md-4">
            <div class="img1" id="zoomableImageContainer">
                <!-- Aggiungi l'attributo data-zoomable all'immagine per abilitare lo zoom -->
                <img src="data:image/jpg;base64, <%=base64img%>" alt="#" width="400px" id="ProductImg" data-zoomable>
            </div>
            <br>
            <div class="small-imgs">
                <% if (product.getAllimg() != null) {
                    ArrayList<immagine> a = product.getAllimg();
                    for (int i = 0; i < a.size(); i++) {
                        immagine im = a.get(i);
                        byte[] foto = im.getImg();
                        String base64foto = "";
                        if (foto != null) {
                            base64foto = Base64.getEncoder().encodeToString(foto);
                        }
                %>
                <a href="#" onclick="changeProduct('<%=im.getId()%>', '<%=product.getID()%>', '<%=product.getNome()%>', '<%=base64foto%>')">
                    <img src="data:image/jpg;base64, <%=base64foto%>" class="small-img" width="80px" alt="#">
                </a>
                <%
                        }
                    }
                %>
            </div>
        </div>
        <div class="col-md-6" id="col6">
            <h1 class="product-title"><%= product.getNome() %></h1>
            <div class="reviews">
                <% int wholeStars = (int) media; // Numero di stelle intere
                   double fraction = media - wholeStars; // Parte frazionaria della valutazione
                   boolean halfStar = fraction >= 0.5; // Indica se c'è mezza stella
                   for (int i = 0; i < 5; i++) {
                       if (i < wholeStars) { %>
                           <i class="fas fa-star filled-star" style="color: black;"></i>
                       <% } else if (i == wholeStars && halfStar) { %>
                           <i class="fas fa-star-half-alt filled-star" style="color: black;"></i>
                       <% } else { %>
                           <i class="fas fa-star" style="color: white; text-shadow: 0 0 1px black;"></i>
                       <% }
                   } %>
                <p>stelle</p>
            </div>
            <div class="price">
                € <%=product.getPrezzo()%>
            </div>
            <% int q = product.getQuantita(); %>
            <div class="row">
                <div class="col-md-4 qty">
                </div>
            </div>
            <br>
            <div id="product" class="product-inf">
                <ul>
                    <li class="active">Descrizione</li>
                </ul>
                <br>
                <div class="tabs-content">
                    <div id="Description">
                        <p><%= product.getDescrizione() %></p>
                    </div>
                </div>
            </div>
            <div class="buttons">
                <div class="row">
                    <div class="col-md-6">
                    <% if (product.getQuantita() == 1) { %>
                    <p>Prodotto Non disponibile</p>
                    <% } else if (cart != null && !cart.presente(product.getID())) { %>
                    <a href="product?action=addC&id=<%=product.getID()%>" class="custom-btn">Aggiungi al carrello<i class="fas fa-angle-right"></i></a>
                    <% } else { %>
                    <p>Prodotto già nel carrello</p>
                    <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%
    }
%>

<br><br><br>
<script>
    // Inizializza il plugin di zoom sull'immagine
    new Zooming({
        onOpen: function() {
            document.body.style.overflow = 'hidden'; // Impedisce lo scrolling della pagina quando è attivo il zoom
        },
        onClose: function() {
            document.body.style.overflow = ''; // Ripristina lo scrolling della pagina quando il zoom viene chiuso
        }
    }).listen('#zoomableImageContainer img[data-zoomable]');
</script>

<script>
    // Funzione AJAX per lo switch delle immagini
    function switchImage(imageUrl) {
      var productImg = document.getElementById('ProductImg');
      productImg.src = imageUrl;
    }
    // event listener alle immagini più piccole
    var smallImgs = document.getElementsByClassName('small-img');
    for (var i = 0; i < smallImgs.length; i++) {
      smallImgs[i].addEventListener('click', function() {
        var imageUrl = this.src;
        switchImage(imageUrl);
      });
    }
</script>
<script>
    function submitSearch(event) {
        event.preventDefault(); // Previeni il comportamento predefinito del link

        var searchInput = document.getElementById("searchInput");
        var searchTerm = searchInput.value.trim();

        if (searchTerm.length > 0) {
            // Se c'è un termine di ricerca, esegui la ricerca
            event.target.closest("form").submit();
        }
    }
</script>
</body>
</html>

