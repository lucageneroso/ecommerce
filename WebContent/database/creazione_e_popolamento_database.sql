DROP DATABASE IF EXISTS ingrosso;
CREATE DATABASE ingrosso;
USE ingrosso;

DROP TABLE IF EXISTS Cliente;
CREATE TABLE IF NOT EXISTS Cliente (
    IVA INT PRIMARY KEY NOT NULL,
    nome VARCHAR(255) NOT NULL,
    cognome VARCHAR(255) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    data_di_nascita DATE NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    PasswordCliente VARCHAR(255) NOT NULL,
    Iban VARCHAR(30) NOT NULL
);

INSERT INTO Cliente(IVA, nome, cognome, username, data_di_nascita, Email, PasswordCliente, Iban)
VALUES (1234567890, 'Giacomo', 'Rossi', 'Giak', '1990-04-30', 'giacomorossi@gmail.com', '12345', 'IT00001');

INSERT INTO Cliente(IVA, nome, cognome, username, data_di_nascita, Email, PasswordCliente, Iban)
VALUES (12345, 'admin', 'admin', 'admin', '2003-10-18', 'admin@gmail.com', 'admin', 'IT00002');

DROP TABLE IF EXISTS Ordine;
CREATE TABLE IF NOT EXISTS Ordine (
    id_ordine INT PRIMARY KEY NOT NULL,
    indirizzo VARCHAR(255) NOT NULL,
    data DATE NOT NULL,
    totale DECIMAL(10, 2) NOT NULL,
    stato VARCHAR(50) NOT NULL,
    numero_prodotti INT NOT NULL,
    IVA_cliente INT NOT NULL,
    FOREIGN KEY (IVA_cliente) REFERENCES Cliente(IVA)
);

DROP TABLE IF EXISTS Fornitore;
CREATE TABLE IF NOT EXISTS Fornitore (
    IVA INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cognome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

INSERT INTO Fornitore(IVA, nome, cognome, Email)
VALUES (13579, 'Luca', 'Grazioso', 'lucagrazioso@gmail.com');

DROP TABLE IF EXISTS Prodotto;
CREATE TABLE IF NOT EXISTS Prodotto (
    idProdotto INT PRIMARY KEY,
    Quantita INT NOT NULL,
    Fornitore_IVA INT NOT NULL,
    Prezzo DECIMAL(10, 2) NOT NULL,
    Nome VARCHAR(255) NOT NULL,
    Descrizione VARCHAR(255),
    Categoria VARCHAR(255),
    Situato_in VARCHAR(50) NOT NULL,
    Sconto INT,
    FOREIGN KEY (Fornitore_IVA) REFERENCES Fornitore(IVA)
);

INSERT INTO Prodotto(idProdotto, Quantita, Fornitore_IVA, Prezzo, Nome, Descrizione, Categoria, Situato_in, Sconto)
VALUES (1, 100, 13579, 9.90, 'Rotolone', 'Rotolone comodo per pulire', 'Cucina', 'Via Spennata', 0);

DROP TABLE IF EXISTS Acquista;
CREATE TABLE IF NOT EXISTS Acquista (
    IVA_cliente INT,
    Codice_prodotto INT,
    PRIMARY KEY (IVA_cliente, Codice_prodotto),
    FOREIGN KEY (IVA_cliente) REFERENCES Cliente(IVA),
    FOREIGN KEY (Codice_prodotto) REFERENCES Prodotto(idProdotto)
);

DROP TABLE IF EXISTS Recensione;
CREATE TABLE Recensione (
    idRecensione INT NOT NULL AUTO_INCREMENT,
    idProdotto INT NOT NULL,
    emailCliente VARCHAR(50) NOT NULL,
    votazione INT NOT NULL,
    testo VARCHAR(50),
    dataRecensione DATE NOT NULL,
    PRIMARY KEY (idRecensione),
    FOREIGN KEY (idProdotto) REFERENCES Prodotto(idProdotto),
    FOREIGN KEY (emailCliente) REFERENCES Cliente(Email)
);

/*
DROP TABLE IF EXISTS Magazzino;
CREATE TABLE IF NOT EXISTS Magazzino (
    Indirizzo VARCHAR(255) PRIMARY KEY,
    QuantitaProdotti INT NOT NULL
);

DROP TABLE IF EXISTS Situato_in;
CREATE TABLE IF NOT EXISTS Situato_in (
    Indirizzo_magazzino VARCHAR(255),
    Codice_prodotto INT,
    PRIMARY KEY (Indirizzo_magazzino, Codice_prodotto),
    FOREIGN KEY (Indirizzo_magazzino) REFERENCES Magazzino(Indirizzo),
    FOREIGN KEY (Codice_prodotto) REFERENCES Prodotto(Codice)
);
*/

/*
DROP TABLE IF EXISTS Sconto;
CREATE TABLE IF NOT EXISTS Sconto (
    Codice INT PRIMARY KEY,
    DataInizio DATE NOT NULL,
    DataFine DATE NOT NULL,
    Valore DECIMAL(5, 2) NOT NULL
);

DROP TABLE IF EXISTS Applicato;
CREATE TABLE IF NOT EXISTS Applicato (
    CodiceProdotto INT ,
    CodiceSconto INT,
    PRIMARY KEY (CodiceProdotto, CodiceSconto),
    FOREIGN KEY (CodiceProdotto) REFERENCES Prodotto(Codice)
);
*/