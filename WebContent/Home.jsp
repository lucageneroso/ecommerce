<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,control.*,model.*"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Collection<?> products = (Collection<?>) request.getAttribute("products");
%>
<!DOCTYPE html>
<html lang="it">
<head>
	<title>Homepage</title>  
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	 <link rel="stylesheet" href="css/home2.css"> 

</head>
<body>
	<div class="header">  
	  <a href="Home.jsp" class="image"></a>
	  
	 
	 <div class="navbar">  
	      <nav>
	      <ul class="nav-list"> 
               <li><a  href="index.jsp">Home</a></li>
               <li><a  href="chi-siamo.jsp">Chi Siamo</a></li>
               <li class="dropdown">
                <a href="products.jsp" class="dropbtn">Prodotti</a>
                <div class="dropdown-content">
                    <a href="product.jsp?categoria=Cucina">Cucina</a>
                    <a href="product.jsp?categoria=Bagno">Bagno</a>
                    <a href="product.jsp?categoria=Soggiorno">Soggiorno</a>
                    <a href="product.jsp?categoria=Tuttiprodotti">Tutti i prodotti</a>
                </div>
                        </li>
                       </ul>
	      
	      </nav>
	
	 
	 </div>
	 
	<div class="dx">
	

    <% if (session.getAttribute("email") == null) { %>
       
        		<div class="cerca-form">
				<form action="product" method="GET">
				    <input type="text" name="nome" id="searchInput" placeholder="Cerca prodotto">
				    <button type="submit" onclick="submitSearch(event)">Cerca</button>
				</form>
				</div>
       
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

	  <br>
	

	<br><br><br>
	<div style="text-align:center">
		<span class="dot" onclick="currentSlide(1)"></span>
		<span class="dot" onclick="currentSlide(2)"></span>
		<span class="dot" onclick="currentSlide(3)"></span>
		<span class="dot" onclick="currentSlide(4)"></span>
	</div>
	
	<div class="slideshow-container">
        <div class="mySlides fade">
            <img src="images/Cucina.webp" style="width:50%">
        </div>
        <div class="mySlides fade">
            <img src="images/bagno.jpg" style="width:50%">
        </div>
        <div class="mySlides fade">
            <img src="soggiorno.jpg" style="width:100%">
        </div>
        <div class="mySlides fade">
            <img src="casa.jpg" style="width:100%">
        </div>
    </div>

	

	<!-- Script per lo slideshow automatico -->
	<script>
	// Inizializzazione dello slideshow
	var slideIndex = 1;
	showSlides(slideIndex);

	// Definizione della funzione per il cambio immagine
	function plusSlides(n) {
		showSlides(slideIndex += n);
	}

	// Definizione della funzione per il cambio immagine corrente
	function currentSlide(n) {
		showSlides(slideIndex = n);
	}

	// Definizione della funzione per il cambio immagine automatico ogni 2 secondi
	function autoSlides() {
		showSlides(slideIndex += 1);
	}

	// Definizione della funzione per la visualizzazione delle slide
	function showSlides(n) {
		var i;
		var slides = document.getElementsByClassName("slides");
		var dots = document.getElementsByClassName("dot");
		if (n > slides.length) {slideIndex = 1}
		if (n < 1) {slideIndex = slides.length}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex-1].style.display = "block";
		dots[slideIndex-1].className += " active";
	}

	// Avvio del cambio immagine automatico ogni 2 secondi
	setInterval(autoSlides, 2000);
</script>

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
    
    var cercaLink = document.getElementById("cercap");
	var cercaSection = document.querySelector(".cerca");
		 
			cercaLink.addEventListener("click", function(event) {
			event.preventDefault();
		if (cercaSection.style.display === "flex") {
			cercaSection.style.display = "none"; // Se la barra di ricerca è già visibile, nascondila
		} else {
			cercaSection.style.display = "flex"; // Altrimenti, mostra la barra di ricerca
		}
		});

</script>

	<div class="container1">
		<a href=""><img src="images/Cucina.webp" alt="Immagine 1" alt="#"></a>
		<a href="product?action=dettaglio&sesso=M"><img src="images/bagno.jpg" alt="Immagine 2" alt="#"></a>
		<a href="product?action=dettaglio&categoria=accessori&sesso=M"><img src="images/soggiorno.jpg" alt="Immagine 3"></a>
		<a href="product?action=all"><img src="images/casa.jpg" alt="Immagine 4"></a>
	</div>
<br><br><br>
<jsp:include page="footer.jsp"/>

</body>
</html>
