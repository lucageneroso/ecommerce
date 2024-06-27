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
</script>
    
    
<style>

body {
    margin: 0;
    padding: 0;
    box-sizing: border-box; /* Include padding e border nella larghezza totale */
}

* {
    box-sizing: inherit; /* Inherit the box-sizing for all elements */
}

.header {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background: rgba(255, 255, 255, 0.6); /* Colore di base bianco con trasparenza */
    backdrop-filter: blur(10px); /* Effetto sfocato */
    z-index: 1000;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    padding: 10px 20px;
    //overflow: hidden; 
}

.content {
    margin-top: 80px; /* Altezza dell'header */
    padding: 20px; /* Aggiunge un po' di padding intorno al contenuto */
}

.navbar ul {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
    flex-wrap: wrap; /* Assicura che gli elementi si adattino alla larghezza disponibile */
}

.navbar li {
    margin-right: 20px;
}

.navbar a {
    text-decoration: none;
    color: #000;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: white;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    z-index: 1;
}

.dropdown:hover .dropdown-content {
    display: block;
}

.cerca-form {
    display: inline-block;
}

.cerca-form input {
    padding: 5px;
    margin-right: 5px;
}

.cerca-form button {
    padding: 5px;
}

.login {
    display: inline-block;
    margin-left: 20px;
}

.login-button {
    text-decoration: none;
    color: #000;
    padding: 5px 10px;
    border: 1px solid #000;
    border-radius: 5px;
}

.login-button:hover {
    background-color: #f0f0f0;
}


/*
	body {
    margin: 0;
    padding: 0;
}

.header {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background: rgba(255, 255, 255, 0.6); 
    backdrop-filter: blur(10px);
    z-index: 1000;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.content {
    margin-top: 100px;
}

.navbar ul {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
}

.navbar li {
    margin-right: 20px;
}

.navbar a {
    text-decoration: none;
    color: #000;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: white;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    z-index: 1;
}

.dropdown:hover .dropdown-content {
    display: block;
}

.cerca-form {
    display: inline-block;
}

.cerca-form input {
    padding: 5px;
    margin-right: 5px;
}

.cerca-form button {
    padding: 5px;
}

.login {
    display: inline-block;
    margin-left: 20px;
}

.login-button {
    text-decoration: none;
    color: #000;
    padding: 5px 10px;
    border: 1px solid #000;
    border-radius: 5px;
}

.login-button:hover {
    background-color: #f0f0f0;
}
*/
</style>
  
<div class="header">
	
     <a href="Home.jsp" class="logo-link">
        <img src="images/logohome.png" alt="Logo" class="logo-img">
    </a>
    
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
        <a class="login-button" href="pagina_accesso.jsp">Login</a>
    </div>
    <div class="carrello">
        <a class="login-button" href="carrello.jsp">Carrello</a>
    </div>
</div>
<br>