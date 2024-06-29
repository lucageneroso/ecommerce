<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <title>Header</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #f4f4f4 url('images/background.jpg') repeat;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
        }

        .logo {
            display: flex;
            align-items: center;
        }

        .logo img {
            height: 50px;
            margin-right: 10px;
        }

        .navbar {
            display: flex;
            align-items: center;
        }

        .navbar a {
            color: #333;
            text-decoration: none;
            padding: 10px;
            transition: color 0.3s;
        }

        .navbar a:hover {
            color: #000;
        }

        .dropdown {
            position: relative;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown-content a {
            color: #333;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            transition: background-color 0.3s;
        }

        .dropdown-content a:hover {
            background-color: #ff6600;
            color: #fff;
        }

        .cerca-form {
            display: flex;
            align-items: center;
            margin-left: 20px;
        }

        .cerca-form input[type="text"] {
            padding: 8px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
        }

        .cerca-form button {
            padding: 8px 20px;
            background-color: #ff6600;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            margin-left: 5px;
            transition: background-color 0.3s;
        }

        .cerca-form button:hover {
            background-color: #e55a00;
        }
    </style>
</head>
<body>

<div class="header">
    <div class="logo">
        <a href="Home.jsp">
            <img src="images/logohome.png" alt="Logo">
        </a>
        <h1>Nome del tuo sito</h1>
    </div>
    
    <div class="navbar">
        <a href="index.jsp">Chi Siamo</a>
        
        <div class="dropdown">
            <a href="#" class="dropbtn">Altro</a>
            <div class="dropdown-content">
                <a href="pagina_accesso.jsp">Login</a>
                <a href="Profilo.jsp">Profilo</a>
                <a href="carrello.jsp">Carrello</a>
            </div>
        </div>
        
        <div class="cerca-form">
            <form action="product" method="GET">
                <input type="text" name="nome" id="searchInput" placeholder="Cerca prodotto">
                <button type="submit" onclick="submitSearch(event)">Cerca</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
