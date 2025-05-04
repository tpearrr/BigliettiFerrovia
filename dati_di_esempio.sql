-- Inserimento dati tabella CLIENTE
INSERT INTO CLIENTE (Nome, Cognome, Email, Cellulare) VALUES
('Mario', 'Rossi', 'mario.rossi@email.com', '3331234567'),
('Lucia', 'Verdi', 'lucia.verdi@email.com', '3347654321'),
('Giulia', 'Bianchi', 'giulia.bianchi@email.com', '3391122334'),
('Andrea', 'Neri', 'andrea.neri@email.com', '3369988776'),
('Paolo', 'Conti', 'paolo.conti@email.com', '3355544332');

-- Inserimento dati tabella STAZIONE
INSERT INTO STAZIONE (Nome, Città) VALUES
('Verona Porta Nuova', 'Verona'),
('Padova Centrale', 'Padova'),
('Vicenza', 'Vicenza'),
('Mestre', 'Venezia'),
('Treviso Centrale', 'Treviso'),
('Rovigo', 'Rovigo');

-- Inserimento dati tabella TRENO
INSERT INTO TRENO (Orario, Capacità, Tipo_Treno) VALUES
('08:00:00', 300, 'Regionale'),
('09:30:00', 250, 'Diretto'),
('11:00:00', 200, 'Regionale'),
('14:15:00', 180, 'Diretto');

-- Inserimento dati tabella TRATTA
-- ID Stazioni da 1 a 6
-- Verona = 1, Padova = 2, Vicenza = 3, Mestre = 4, Treviso = 5, Rovigo = 6
INSERT INTO TRATTA (Durata, ID_Treno, ID_Stazione_Partenza, ID_Stazione_Arrivo) VALUES
('01:30:00', 1, 1, 2),  -- Verona → Padova
('01:00:00', 2, 2, 4),  -- Padova → Mestre
('00:50:00', 3, 1, 3),  -- Verona → Vicenza
('01:20:00', 4, 3, 5),  -- Vicenza → Treviso
('01:10:00', 1, 4, 6),  -- Mestre → Rovigo
('01:00:00', 1, 4, 1);  -- Mestre → Verona

-- Inserimento dati tabella SCALO
-- Tratta 1: Verona → Padova (scalo a Vicenza)
-- Tratta 2: Padova → Mestre (scalo a Rovigo)
-- Tratta 4: Vicenza → Treviso (scalo a Padova)
INSERT INTO SCALO (ID_Tratta, ID_Stazione, Ordine, Tempo_sosta) VALUES
(1, 3, 1, '00:05:00'), -- Vicenza
(2, 6, 1, '00:03:00'), -- Rovigo
(4, 2, 1, '00:04:00'); -- Padova

-- Inserimento dati tabella BIGLIETTO
-- ID Cliente da 1 a 5, ID Tratte da 1 a 5, ID Treni da 1 a 4
INSERT INTO BIGLIETTO (Prezzo, Data_Acquisto, ID_Cliente, ID_Tratta, ID_Treno) VALUES
(12.50, '2025-05-01', 1, 1, 1),
(9.00,  '2025-05-01', 2, 2, 2),
(7.50,  '2025-05-02', 3, 3, 3),
(10.00, '2025-05-02', 4, 4, 4),
(6.00,  '2025-05-03', 5, 1, 1),
(11.50, '2025-05-03', 2, 5, 1),
(8.00,  '2025-05-04', 1, 2, 2),
(5.50,  '2025-05-04', 3, 3, 3);
