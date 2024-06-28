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
	 <link rel="stylesheet" href="css/header.css">

</head>
<body>
	
    <jsp:include page="fragments/header.jsp"/>
	  <br>
	

	<br><br><br>
	<section id="hero">
    <div class="container">
        <h1>
            Scopri tutti i nostri prodotti di qualità!
        </h1>
        <div class="hero-image">
            <img src="images/casa.jpg" alt="Immagine prodotti Casa">
        </div>
        <a href="tuttiProdotti.jsp" class="btn btn-primary">Scopri di più</a>
    </div>
</section>
    

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

<br><br><br>
<jsp:include page="fragments/footer.jsp"/>

</body>
</html>
