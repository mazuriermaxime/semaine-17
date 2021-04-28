--Exercice 1 : base hotel

--1) Afficher la liste des hôtels avec leur station.

CREATE VIEW v_hotels_station
AS
SELECT * FROM hotel,station
WHERE hot_sta_id=sta_id

--2) Afficher la liste des chambres et leur hôtel

CREATE VIEW chambre_hotel
AS
SELECT * FROM chambre, hotel
WHERE cha_hot_id = hot_id

--3) Afficher la liste des réservations avec le nom des clients

CREATE VIEW reservation_client
AS
SELECT * FROM reservation, client
WHERE res_cha_id = cli_id

--4) Afficher la liste des chambres avec le nom de l'hôtel et le nom de la station

CREATE VIEW chambre_hotel_stattion
AS
SELECT cha_id,cha_hot_id,cha_numero,cha_capacite,cha_type,hot_nom,sta_nom 
FROM chambre,hotel,station
WHERE hotel.hot_sta_id=station.sta_id 
AND hotel.hot_id=chambre.cha_hot_id

-- 5) Afficher les réservations avec le nom du client et le nom de l'hôtel

CREATE VIEW reserv_hotel_client
AS
SELECT res_id, res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes, cli_nom, hot_nom 
FROM reservation, hotel, client, chambre
WHERE client.cli_id = reservation.res_cli_id 
AND reservation.res_cha_id = chambre.cha_id 
AND chambre.cha_hot_id = hotel.hot_id