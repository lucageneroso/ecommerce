<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <style>
        /* Stile del body con sfondo personalizzato */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: radial-gradient(circle, rgba(255, 215, 0, 0.8), rgba(255, 165, 0, 0.5), rgba(255, 255, 255, 0));
            background-size: cover;
            background-attachment: fixed;
        }

        /* Logo in alto a sinistra */
        .logo {
            position: absolute;
            top: 10px;
            left: 20px;
            max-height: 50px;
            z-index: 1001;
        }

        /* Stile della barra di navigazione */
        .navbar {
            background-color: rgba(255, 165, 0, 0.8);
            padding: 10px 20px;
            text-align: right;
            position: sticky;
            top: 0;
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            display: inline-block;
        }

        .navbar a:hover {
            background-color: #FF8C00;
        }

        .navbar .dropdown {
            position: relative;
            display: inline-block;
        }

        .navbar .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            border-radius: 5px;
            padding: 5px 0;
        }

        .navbar .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            transition: background-color 0.3s;
        }

        .navbar .dropdown-content a:hover {
            background-color: #f1f1f1;
        }

        .navbar .dropdown:hover .dropdown-content {
            display: block;
        }

        /* Stile per la barra di ricerca */
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

        /* Stile per i riquadri delle categorie */
   .category-container {
    text-align: center; /* Allinea il testo al centro */
    padding: 20px; /* Padding intorno al contenitore delle categorie */
    display: flex; /* Usa un layout flessibile */
    flex-wrap: wrap; /* Avvolgi i contenuti su più righe se necessario */
    justify-content: space-around; /* Distribuisci uniformemente i box con spazio attorno */
}

.category-box {
    width: 22%; /* Larghezza del box delle categorie, adattabile */
    margin: 10px; /* Margine tra i box */
    background-color: #fff; /* Colore di sfondo */
    border: 1px solid #ccc; /* Bordo */
    border-radius: 5px; /* Angoli arrotondati */
    padding: 20px; /* Spazio interno */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Ombra */
    text-align: center; /* Allinea il testo al centro */
    vertical-align: top; /* Allinea il box in cima */
    height: 100%; /* Altezza del box, prende lo spazio rimanente */
    display: flex; /* Usa un layout flessibile */
    flex-direction: column; /* Direzione dei contenuti: verticale */
    justify-content: space-between; /* Distribuisci uniformemente i contenuti all'interno */
    box-sizing: border-box; /* Assicura che il padding e il bordo non aumentino la dimensione del box */
}

.category-box h2 {
    font-size: 20px; /* Dimensione del font per il titolo */
    color: #FFA500; /* Colore del testo */
    margin-bottom: 10px; /* Margine inferiore */
}

.category-box img {
    max-width: 100%; /* Larghezza massima dell'immagine */
    border-radius: 5px; /* Angoli arrotondati dell'immagine */
    margin-bottom: 10px; /* Margine inferiore */
}

@media (max-width: 768px) {
    .category-box {
        width: 45%; /* Larghezza dei box delle categorie per schermi più piccoli */
    }
}


        /* Contenitore principale */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
            margin-top: 20px;
            position: relative;
        }

        /* Stile per il footer */
       /* footer {
            background-color: rgba(255, 165, 0, 0.8);
            color: #fff;
            padding: 20px 0;
            text-align: center;
            width: 100%;
            clear: both;
            position: relative;
            bottom: 0;
        }

        footer a {
            color: #fff;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        } */

        /* Stili per il carosello */
        .ekw_carousel_container {
            position: relative;
            max-width: 100%;
            overflow: hidden;
            margin-top: 20px;
        }

        .ekw_content_container {
            display: flex;
            transition: transform 0.5s ease;
        }

        .ekw_content_container div {
            min-width: 100%;
            flex: 1 0 auto;
            height: 500px;
        }

        .ekw_content_container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .ekw_control_container {
            position: absolute;
            top: 50%;
            width: 100%;
            display: flex;
            justify-content: space-between;
            transform: translateY(-50%);
        }

        .ekw_control_container .material-icons {
            cursor: pointer;
            font-size: 30px;
            color: #FF8C00;
        }
    </style>
</head>
<body>
    <!-- Logo -->
    <a href="home.jsp"><img src="images/loghihome.png" alt="Logo HomeDecore" class="logo"></a>

    <div class="navbar">
        <div class="dropdown">
            <button class="dropbtn">Altro</button>
            <div class="dropdown-content">
                <a href="Profilo.jsp">Profilo</a>
                <a href="#">Impostazioni</a>
            </div>
        </div>
        <a href="chi-siamo.jsp">Chi Siamo</a>
        <div class="cerca-form">
            <!-- Form di ricerca corretto con action e method -->
            <form action="product" method="GET">
                <input type="text" name="nome" id="searchInput" placeholder="Cerca prodotto">
                <button type="submit" onclick="submitSearch(event)">Cerca</button>
            </form>
        </div>
        <div class="dropdown">
            <button class="dropbtn">Login</button>
            <div class="dropdown-content">
                <a href="pagina_accesso.jsp">Login</a>
                <a href="#">LogOut</a>
                <a href="Profilo.jsp">Profilo</a>
            </div>
        </div>
        <a href="carrello.jsp">Carrello</a>
    </div>

    <div class="container">
        <h1>Benvenuti su HomeDecore</h1>
        <p>Esplora le nostre categorie di prodotti:</p>
       
       <!-- Carosello -->
        <div class="ekw_carousel_container">
            <div class="ekw_content_container">
                <div><img src="images/slide1.jpg" alt="Image 1"></div>
                <div><img src="images/slide2.jpg" alt="Image 2"></div>
            </div>
        </div>

        <div class="category-container">
            <div class="category-box">
                <img src="images/bagno.jpg" alt="Categoria Bagno">
                <h2>Bagno</h2>
                <a href="Product.jsp?categoria=Bagno" class="btn btn-primary">Esplora</a>
            </div>
            <div class="category-box">
                <img src="images/cucina.png" alt="Categoria Cucina">
                <h2>Cucina</h2>
                <a href="Product.jsp?categoria=Cucina" class="btn btn-primary">Esplora</a>
            </div>
            <div class="category-box">
                <img src="images/soggiorno.jpg" alt="Categoria Soggiorno">
                <h2>Soggiorno</h2>
                <a href="Product.jsp?categoria=Soggiorno" class="btn btn-primary">Esplora</a>
            </div>
            <div class="category-box">
                <img src="images/tutti.jpg" alt="Tutti i prodotti">
                <h2>Tutti i prodotti</h2>
                <a href="tuttiProdotti.jsp" class="btn btn-primary">Esplora</a>
            </div>
        </div>
    </div>
    

    <script>
        // Funzione per gestire il menu hamburger
        $(document).ready(function() {
            $('.hamburger').click(function() {
                $('.dropdown-content').slideToggle();
            });
        });

        // Funzione per scorrere automaticamente il carosello
        $(document).ready(function() {
            var currentPosition = 0;
            var slides = $('.ekw_content_container div');
            var numberOfSlides = slides.length;
            var slideWidth = slides.eq(0).outerWidth();

            // Impostazione della larghezza del contenitore del carosello
            $('.ekw_content_container').css('width', slideWidth * numberOfSlides);

            // Funzione per avanzare automaticamente il carosello
            function nextSlide() {
                if (currentPosition < numberOfSlides - 1) {
                    currentPosition++;
                } else {
                    currentPosition = 0;
                }
                $('.ekw_content_container').css({
                    'transform': 'translateX(' + (-currentPosition * slideWidth) + 'px)',
                    'transition': 'transform 0.5s ease'
                });
            }

            // Imposta l'intervallo per lo scorrimento automatico
            var slideInterval = setInterval(nextSlide, 3000);

            // Pausa lo scorrimento automatico quando il mouse entra nel carosello
            $('.ekw_carousel_container').mouseenter(function() {
                clearInterval(slideInterval);
            });

            // Riavvia lo scorrimento automatico quando il mouse esce dal carosello
            $('.ekw_carousel_container').mouseleave(function() {
                slideInterval = setInterval(nextSlide, 3000);
            });

            // Gestisce il reset della transizione dopo il completamento dell'animazione
            $('.ekw_content_container').on('transitionend', function() {
                if (currentPosition === numberOfSlides - 1) {
                    $('.ekw_content_container').css('transition', 'none');
                }
            });
        });

        // Funzione per la ricerca
        function submitSearch(event) {
            event.preventDefault(); // Previeni il comportamento predefinito del link

            var searchInput = document.getElementById("searchInput");
            var nome = searchInput.value.trim();

            if (nome !== "") {
                var url = "product?action=search&nome=" + encodeURIComponent(nome);
                window.location.href = url;
            }
        }

        $(document).ready(function() {
            var $slider = $('.ekw_content_container');
            var slideCount = $slider.children().length;
            var slideWidth = $slider.children().first().width();
            var currentIndex = 0;

            function goToSlide(index) {
                $slider.css('transform', 'translateX(' + (-index * slideWidth) + 'px)');
            }

            $('.left').click(function() {
                currentIndex = (currentIndex > 0) ? currentIndex - 1 : slideCount - 1;
                goToSlide(currentIndex);
            });

            $('.right').click(function() {
                currentIndex = (currentIndex < slideCount - 1) ? currentIndex + 1 : 0;
                goToSlide(currentIndex);
            });

            setInterval(function() {
                currentIndex = (currentIndex < slideCount - 1) ? currentIndex + 1 : 0;
                goToSlide(currentIndex);
            }, 3000);
        });
    </script>
    <jsp:include page="/fragments/footer.jsp" />
    
</body>
</html>
