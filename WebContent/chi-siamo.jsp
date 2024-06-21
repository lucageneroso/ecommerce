<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi Siamo</title>
    <link rel="stylesheet" href="css/Chi-siamo.css">
</head>
<body>
<div class="header"> 
	  <a href="Home.jsp" class="image"><img src="images/loghi.png" id="image" alt="#"></a>
	  
	 
	 <div class="navbar">
	      <nav>
	      <ul class="nav-list">
               <li><a  href="index.jsp">Home</a></li>
               <li><a  href="chi-siamo.jsp">Chi Siamo</a></li>
               <li class="dropdown">
                <a href="products.jsp" class="dropbtn">Prodotti</a>
                <div class="dropdown-content">
                    <a href="product?action=viewCategory&category=Cucina">Cucina</a>
                    <a href="product?action=viewCategory&category=Uomo">Bagno</a>
                    <a href="product?action=viewCategory&category=Accessori">Soggiorno</a>
                    <a href="product?action=viewCategory&category=Tutti">Tutti i prodotti</a>
                </div>
                        </li>
                       </ul>
	      
	      </nav>
	
	 
	 </div>
	 
	<div class="dx">
	

    <% if (session.getAttribute("email") == null) { %>
        <a href="#0" id="cercap"><img src="cerca.png" alt="#"></a>
        		<div class="cerca-form">
				<form action="product" method="GET">
				    <input type="text" name="nome" id="searchInput" placeholder="Cerca prodotto">
				    <button type="submit" onclick="submitSearch(event)">Cerca</button>
				</form>
				</div>
        <a href="Accedi.jsp"><img src="utente.png" alt="#"></a>
        <a href="product?action=viewC"><img src="cart.png" alt="#"></a>
    <% } else { %>
                <a href="#0" id="cercap"><img src="cerca.png" alt="#"></a>
        		<div class="cerca-form">
				<form action="product" method="GET">
				    <input type="text" name="nome" id="searchInput" placeholder="Cerca prodotto">
				    <button type="submit" onclick="submitSearch(event)">Cerca</button>
				</form>
				</div>
      
    <% } %>
	</div>
	
	 <div class="login">
	     <a class="login-button" href="pagina_accesso.jsp" >login</a>
	
	
	
	</div>
	</div>
	<div class="container">
    <h1>Chi Siamo</h1>
    <p>Benvenuti nella pagina Chi Siamo. Qui troverete informazioni sulla nostra azienda, la nostra missione e i nostri valori.</p>
    <h2>La nostra Storia</h2>
    <p>La nostra azienda è stata fondata nel XXXX con l'obiettivo di XYZ...</p>
    <h2>Il nostro Team</h2>
    <p>Il nostro team è composto da professionisti con esperienza in...</p>
    <h2>Contattaci</h2>
    <p>Per ulteriori informazioni, potete contattarci a: info@example.com</p>
    <a href="../Home.jsp">Torna alla Home</a>
    </div>
</body>
</html>