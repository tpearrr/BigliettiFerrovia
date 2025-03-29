USE SistemaBigliettiFerroviari;
-- Popolamento delle tabelle con dati di esempio (Solo per treni regionali)
-- Inserimento stazioni
INSERT INTO Stazione (Citta, Nome) VALUES ('Venezia', 'Venezia Santa Lucia');
INSERT INTO Stazione (Citta, Nome) VALUES ('Padova', 'Padova Centrale');
INSERT INTO Stazione (Citta, Nome) VALUES ('Verona', 'Verona Porta Nuova');
INSERT INTO Stazione (Citta, Nome) VALUES ('Treviso', 'Treviso Centrale');
INSERT INTO Stazione (Citta, Nome) VALUES ('Vicenza', 'Vicenza Centrale');
INSERT INTO Stazione (Citta, Nome) VALUES ('Belluno', 'Belluno Centrale');
INSERT INTO Stazione (Citta, Nome) VALUES ('Rovigo', 'Rovigo Centrale');

-- Inserimento treni
INSERT INTO Treno (Tipo_Treno, Capacita) VALUES ('Regionale', 200);
INSERT INTO Treno (Tipo_Treno, Capacita) VALUES ('Alta Velocità', 300);

-- Inserimento tratte per treni regionali
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (1, 3, 1, '02:00:00');  -- Venezia -> Verona
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (1, 6, 1, '02:30:00');  -- Venezia -> Belluno
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (2, 3, 1, '01:30:00');  -- Padova -> Verona
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (5, 7, 1, '01:40:00');  -- Vicenza -> Rovigo

-- Inserimento tratte per treni alta velocità
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (1, 3, 2, '01:00:00');  -- Venezia -> Verona
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (1, 6, 2, '01:15:00');  -- Venezia -> Belluno
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (2, 3, 2, '00:45:00');  -- Padova -> Verona
INSERT INTO Tratta (ID_Stazione_Partenza, ID_Stazione_Arrivo, ID_Treno, Durata) VALUES (5, 7, 2, '00:50:00');  -- Vicenza -> Rovigo

-- Inserimento scali predefiniti per treni regionali
INSERT INTO Scalo (ID_Tratta, ID_Stazione, Ordine, Tempo_Sosta) VALUES (1, 2, 1, '00:10:00'); -- Scalo a Padova
INSERT INTO Scalo (ID_Tratta, ID_Stazione, Ordine, Tempo_Sosta) VALUES (1, 5, 2, '00:05:00'); -- Scalo a Vicenza
INSERT INTO Scalo (ID_Tratta, ID_Stazione, Ordine, Tempo_Sosta) VALUES (2, 4, 1, '00:10:00'); -- Scalo a Treviso
INSERT INTO Scalo (ID_Tratta, ID_Stazione, Ordine, Tempo_Sosta) VALUES (3, 5, 1, '00:08:00'); -- Scalo a Vicenza
INSERT INTO Scalo (ID_Tratta, ID_Stazione, Ordine, Tempo_Sosta) VALUES (4, 2, 1, '00:15:00'); -- Scalo a Padova

-- Inserimento Clienti
INSERT INTO Cliente (Nome, Cognome, Email, Cellulare)
VALUES ('Mario', 'Rossi', 'mario.rossi@email.com', '1234567890');

INSERT INTO Cliente (Nome, Cognome, Email, Cellulare)
VALUES ('Luca', 'Bianchi', 'luca.bianchi@email.com', '0987654321');

INSERT INTO Cliente (Nome, Cognome, Email, Cellulare)
VALUES ('Andrea', 'Verdi', 'andrea.verdi@email.com', '3456789012');

-- Inserimento Biglietti
INSERT INTO Biglietto (ID_Tratta, ID_Cliente, Prezzo, Data_Acquisto)
VALUES (1, 1, 30.00, '2025-03-10');

INSERT INTO Biglietto (ID_Tratta, ID_Cliente, Prezzo, Data_Acquisto)
VALUES (1, 2, 15.50, '2025-03-12');

INSERT INTO Biglietto (ID_Tratta, ID_Cliente, Prezzo, Data_Acquisto)
VALUES (2, 1, 15.50, '2025-03-14');

INSERT INTO Biglietto (ID_Tratta, ID_Cliente, Prezzo, Data_Acquisto)
VALUES (2, 2, 30.00, '2025-03-16');

-- Inserimento Prenotazione
INSERT INTO Prenotazione (ID_Biglietto, ID_Cliente)
VALUES (1, 1);

INSERT INTO Prenotazione (ID_Biglietto, ID_Cliente)
VALUES (2, 1);

INSERT INTO Prenotazione (ID_Biglietto, ID_Cliente)
VALUES (1, 2);

INSERT INTO Prenotazione (ID_Biglietto, ID_Cliente)
VALUES (2, 2);
