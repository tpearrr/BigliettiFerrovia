-- Popolamento
-- Inserimento stazioni
INSERT INTO Stazione (Citta) VALUES ('Venezia');
INSERT INTO Stazione (Citta) VALUES ('Padova');
INSERT INTO Stazione (Citta) VALUES ('Verona');
INSERT INTO Stazione (Citta) VALUES ('Belluno');
INSERT INTO Stazione (Citta) VALUES ('Vicenza');
INSERT INTO Stazione (Citta) VALUES ('Rovigo');
INSERT INTO Stazione (Citta) VALUES ('Treviso');

-- Inserimento treni
INSERT INTO Treno (Tipo_Treno, Capacita) VALUES ('Regionale', 200);
INSERT INTO Treno (Tipo_Treno, Capacita) VALUES ('Alta Velocità', 400);


-- Inserimento tratte da Venezia
-- Treni Regionali (ID_Treno = 1)
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (1, 2, 1, '01:00:00'); -- Venezia -> Padova
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (1, 3, 1, '02:00:00'); -- Venezia -> Verona
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (1, 4, 1, '00:50:00'); -- Venezia -> Treviso
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (1, 5, 1, '01:30:00'); -- Venezia -> Vicenza
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (1, 6, 1, '02:30:00'); -- Venezia -> Belluno
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (1, 7, 1, '01:40:00'); -- Venezia -> Rovigo

-- Treni Alta Velocità (ID_Treno = 2) - Tempi dimezzati rispetto a Treni Regionali
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (1, 2, 2, '00:30:00'); -- Venezia -> Padova
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (1, 3, 2, '01:00:00'); -- Venezia -> Verona
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (1, 4, 2, '00:25:00'); -- Venezia -> Treviso
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (1, 5, 2, '00:45:00'); -- Venezia -> Vicenza
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (1, 6, 2, '01:15:00'); -- Venezia -> Belluno
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (1, 7, 2, '00:50:00'); -- Venezia -> Rovigo

-- Inserimento Clienti
INSERT INTO Cliente (Nome, Cognome, Email, Cellulare)
VALUES ('Mario', 'Rossi', 'mario.rossi@email.com', '1234567890');

INSERT INTO Cliente (Nome, Cognome, Email, Cellulare)
VALUES ('Luca', 'Bianchi', 'luca.bianchi@email.com', '0987654321');

INSERT INTO Cliente (Nome, Cognome, Email, Cellulare)
VALUES ('Andrea', 'Verdi', 'andrea.verdi@email.com', '3456789012');

-- Inserimento Biglietti
INSERT INTO Biglietto (ID_Tratta, ID_Cliente, Prezzo, Data_Acquisto)
VALUES (1, 1, 30.00, NOW());

INSERT INTO Biglietto (ID_Tratta, ID_Cliente, Prezzo, Data_Acquisto)
VALUES (1, 2, 15.50, NOW());

INSERT INTO Biglietto (ID_Tratta, ID_Cliente, Prezzo, Data_Acquisto)
VALUES (2, 1, 15.50, NOW());

INSERT INTO Biglietto (ID_Tratta, ID_Cliente, Prezzo, Data_Acquisto)
VALUES (2, 2, 30.00, NOW());

-- Inserimento Prenotazione
INSERT INTO Prenotazione (ID_Biglietto, ID_Cliente)
VALUES (1, 1);

INSERT INTO Prenotazione (ID_Biglietto, ID_Cliente)
VALUES (2, 1);

INSERT INTO Prenotazione (ID_Biglietto, ID_Cliente)
VALUES (1, 2);

INSERT INTO Prenotazione (ID_Biglietto, ID_Cliente)
VALUES (2, 2);
