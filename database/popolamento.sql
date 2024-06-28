DROP DATABASE IF EXISTS ingrosso;
CREATE DATABASE ingrosso;
USE ingrosso;

DROP TABLE IF EXISTS Cliente;
CREATE TABLE IF NOT EXISTS Cliente (
    IVA INT PRIMARY KEY NOT NULL,
    nome VARCHAR(255) NOT NULL,
    cognome VARCHAR(255) NOT NULL,
    data_di_nascita DATE NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    PasswordCliente VARCHAR(255) NOT NULL,
    Iban VARCHAR(30) NOT NULL,
    Tipo_account INT
    
);

INSERT INTO Cliente(IVA, nome, cognome, data_di_nascita, Email, PasswordCliente, Iban,Tipo_account)
VALUES (1234567890, 'Giacomo', 'Rossi', '1990-04-30', 'giacomorossi@gmail.com', '12345', 'IT00001',0);

INSERT INTO Cliente(IVA, nome, cognome, data_di_nascita, Email, PasswordCliente, Iban,Tipo_account)
VALUES (12345, 'admin', 'admin', '2003-10-18', 'admin@gmail.com', 'admin', 'IT00002',1);

DROP TABLE IF EXISTS Ordine;
CREATE TABLE IF NOT EXISTS Ordine (
    id_ordine INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    indirizzo VARCHAR(255) NOT NULL,
    citta VARCHAR(255) NOT NULL,
    CAP INT NOT NULL,
    provincia VARCHAR(255) NOT NULL,
    data DATE NOT NULL,
    totale DECIMAL(10, 2) NOT NULL,
    stato ENUM('In Preparazione', 'In Consegna', 'Consegnato'),
    numero_prodotti INT NOT NULL,
    IVA_cliente INT NOT NULL,
<<<<<<< HEAD
    FOREIGN KEY (IVA_cliente) REFERENCES Cliente(IVA),
    EmailCliente VARCHAR(255) NOT NULL,
    FOREIGN KEY(Email_cliente) REFERENCES Cliente(Email)
=======
    Email_cliente VARCHAR(255) NOT NULL,
    FOREIGN KEY (IVA_cliente) REFERENCES Cliente(IVA),
    FOREIGN KEY (Email_cliente) REFERENCES Cliente(Email)
>>>>>>> branch 'masterL' of https://github.com/lucageneroso/ecommerce.git
);

DROP TABLE IF EXISTS Prodotto;
CREATE TABLE IF NOT EXISTS Prodotto (
    idProdotto INT PRIMARY KEY,
    Quantita INT NOT NULL,
    Prezzo DECIMAL(10, 2) NOT NULL,
    Nome VARCHAR(255) NOT NULL,
    Descrizione VARCHAR(255),
    Categoria VARCHAR(255),
    Sconto DECIMAL(10, 2),
    Foto mediumblob
);

<<<<<<< HEAD
CREATE TABLE IF NOT EXISTS DettagliOrdine (
    id_ordine INT NOT NULL,
    idProdotto INT NOT NULL,
    quantita INT NOT NULL,
    prezzo DECIMAL(10, 2) NOT NULL,
=======
DROP TABLE IF EXISTS DettagliOrdine;
CREATE TABLE IF NOT EXISTS DettagliOrdine (
    id_ordine INT NOT NULL,
    idProdotto INT NOT NULL,
    quantita INT NOT NULL,
>>>>>>> branch 'masterL' of https://github.com/lucageneroso/ecommerce.git
    FOREIGN KEY (id_ordine) REFERENCES Ordine(id_ordine),
    FOREIGN KEY (idProdotto) REFERENCES Prodotto(idProdotto)
);


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

;