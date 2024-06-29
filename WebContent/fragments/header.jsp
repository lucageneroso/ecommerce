<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    
<script>
function submitSearch(event) {
    event.preventDefault(); // Previeni il comportamento predefinito del link

    var searchInput = document.getElementById("searchInput");
    var nome = searchInput.value.trim();

    if (nome !== "") {
        var url = "product?action=search&nome=" + encodeURIComponent(nome);
        window.location.href = url;
    }
}

document.addEventListener("DOMContentLoaded", function() {
    var menuBtn = document.getElementById("menuBtn");
    var navbar = document.querySelector(".navbar");

    menuBtn.addEventListener("click", function() {
        navbar.classList.toggle("show");
    });
});

</script>
<link rel="stylesheet" href="css/header.css">


    <div class="header">
    <button id="menuBtn" class="menu-btn">&#9776;</button>
    <p class="logo-text">HomeDecor</p>
    <div class="navbar">
        <nav>
            <ul class="nav-list">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="chi-siamo.jsp">Chi Siamo</a></li>
                <li class="dropdown">
                    <a href="Product.jsp" class="dropbtn">Prodotti</a>
                    <div class="dropdown-content">
                        <a href="Product.jsp?categoria=Cucina">Cucina</a>
                        <a href="Product.jsp?categoria=Bagno">Bagno</a>
                        <a href="Product.jsp?categoria=Soggiorno">Soggiorno</a>
                        <a href="tuttiProdotti.jsp">All</a>
                    </div>
                </li>
            </ul>
        </nav>
    </div>
    <div class="dx">
        <div class="cerca-form">
            <form action="product" method="GET">
                <input type="text" name="nome" id="searchInput" placeholder="Cerca prodotto">
                <button type="submit" onclick="submitSearch(event)">Cerca</button>
            </form>
        </div>
    </div>
    <div class="login">
        <% if (session.getAttribute("Email") == null) { %>
            <a class="login-button" href="pagina_accesso.jsp">Login</a>
        <% } else { %>
            <a class="login-button" href="logout">LogOut</a>
            <a class="login-button" href="Profilo.jsp">Profilo</a>
        <% } %>
    </div>
    <div class="carrello">
        <a class="login-button" href="carrello.jsp">Carrello</a>
    </div>
</div>


<br><br><br><br>