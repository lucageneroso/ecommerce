<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
  
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
        <a class="login-button" href="pagina_accesso.jsp">login</a>
    </div>
</div>