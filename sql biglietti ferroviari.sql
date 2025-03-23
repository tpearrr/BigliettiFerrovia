-- Creazione del database
CREATE DATABASE IF NOT EXISTS SistemaBigliettiFerroviari;
USE SistemaBigliettiFerroviari;

-- Creazione della tabella Cliente
CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50),
    Cognome VARCHAR(50),
    Email VARCHAR(50),
    Cellulare VARCHAR(15)
);

-- Creazione della tabella Stazione
CREATE TABLE Stazione (
    ID_Stazione INT PRIMARY KEY AUTO_INCREMENT,
    Citta VARCHAR(100)
);

-- Creazione della tabella Treno
CREATE TABLE Treno (
    ID_Treno INT PRIMARY KEY AUTO_INCREMENT,
    Tipo_Treno VARCHAR(50),
    Capacita INT
);

-- Creazione della tabella Tratta
CREATE TABLE Tratta (
    ID_Tratta INT PRIMARY KEY AUTO_INCREMENT,
    ID_Stazione_Partenza INT,
    ID_Stazione_Arrivo INT,
    ID_Treno INT,
    Durata TIME,
    FOREIGN KEY (ID_Stazione_Partenza) REFERENCES Stazione(ID_Stazione),
    FOREIGN KEY (ID_Stazione_Arrivo) REFERENCES Stazione(ID_Stazione),
    FOREIGN KEY (ID_Treno) REFERENCES Treno(ID_Treno)
);

-- Creazione della tabella Biglietto
CREATE TABLE Biglietto (
    ID_Biglietto INT PRIMARY KEY AUTO_INCREMENT,
    ID_Tratta INT,
    ID_Cliente INT,
    Prezzo DECIMAL(10,2),
    Data_Acquisto DATETIME,
    FOREIGN KEY (ID_Tratta) REFERENCES Tratta(ID_Tratta),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

-- Creazione della tabella Prenotazione
CREATE TABLE Prenotazione (
    ID_Prenotazione INT PRIMARY KEY AUTO_INCREMENT,
    ID_Biglietto INT,
    ID_Cliente INT,
    FOREIGN KEY (ID_Biglietto) REFERENCES Biglietto(ID_Biglietto),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

-- Query 1: Ricerca biglietti disponibili per una tratta specifica
SELECT * FROM Biglietto
WHERE ID_Tratta = 1 AND Data_Acquisto >= NOW();

-- Query 2: Storico prenotazioni di un cliente
SELECT * FROM Prenotazione P
JOIN Biglietto B ON P.ID_Biglietto = B.ID_Biglietto
WHERE P.ID_Cliente = 1;

-- Query 3: Verifica validità di un biglietto
SELECT * FROM Biglietto
WHERE ID_Biglietto = 1 AND Data_Acquisto >= NOW();

-- Query 4: Visualizzazione di tutte le tratte disponibili
SELECT T.ID_Tratta, S1.Citta AS Stazione_Partenza, S2.Citta AS Stazione_Arrivo, Tr.Durata
FROM Tratta T
JOIN Stazione S1 ON T.ID_Stazione_Partenza = S1.ID_Stazione
JOIN Stazione S2 ON T.ID_Stazione_Arrivo = S2.ID_Stazione
JOIN Treno Tr ON T.ID_Treno = Tr.ID_Treno;

-- Query 5: Statistica di utilizzo (numero di biglietti venduti per tratta)
SELECT T.ID_Tratta, COUNT(B.ID_Biglietto) AS Biglietti_Venduti
FROM Biglietto B
JOIN Tratta T ON B.ID_Tratta = T.ID_Tratta
GROUP BY T.ID_Tratta;
