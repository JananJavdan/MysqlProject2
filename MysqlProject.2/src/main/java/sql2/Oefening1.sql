
/*(a) Geef een lijst van alle biercategorieën */
SELECT*FROM Category LIMIT 38;

/*(b) Toon de lijst van categorieën in dalende alfabetische volgorde zonder de categorie-id’s*/
SELECT Category FROM categories ORDER BY Category DESC LIMIT 38;

/*(c)  Toon een lijst van alle brouwerijen die meer dan 5000 Euro turnover hebben. (54)*/
SELECT* FROM brewers WHERE Turnover>5000 LIMIT 54;

/*(d) Toon nu enkel de naam en de stad van de brouwerijen die minder dan 5000 Euro turnover, maar niet 0.Sorteer de lijst op basis van de turnover. (53)*/
SELECT Name,City, Turnover FROM brewers WHERE Turnover<5000 AND Turnover> 0 ORDER BY Turnover LIMIT 53;

/*(e)   Geef een lijst van alle mogelijke alcoholgehaltes in de beers tabel. Dus geen dubbels. En gesorteerd van groot naar klein. (14)*/
SELECT DISTINCT Alcohol FROM Beers ORDER BY beers.Alcohol DESC;

/*(f)   Toon alle namen van bieren waarvan de naam “wit” bevat zonder dubbels, alfabetisch gesorteerd. (30)*/
SELECT DISTINCT Name FROM Beers WHERE Name LIKE '%wit%' ORDER BY Name;

/*(g)   Toon alle bieren met meer alcohol dan 3 en minder dan 7 zonder gebruik te maken van logische operatoren (<, >, …) (568)*/
SELECT * FROM Beers WHERE Alcohol IN (4,5,6);

/*(h)   Geef de top 3 van de sterkste bieren in onze database. (3)   [SELECT * FROM Beers WHERE Alcohol BETWEEN 4 AND 6;]*/
SELECT * FROM beers ORDER BY Alcohol DESC LIMIT 3;

/*(i)  Maak een lijst van de naam, straat, postcode en stad voor alle brouwers in 3 kolommen voor een adressenlijst. M.a.w. combineer de postcode en de stad in 1 kolom*/
SELECT Name, Address, CONCAT(City, ' ', ZipCode) As City_Zip FROM brewers;