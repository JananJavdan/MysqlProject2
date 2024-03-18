/*1. Geef me alle alcoholpercentages, telkens maar eenmalig! Zet de hoogste vanboven. */
SELECT DISTINCT Alcohol FROM Beers ORDER BY Alcohol DESC;

/*2. Geef me de aantal brouwerijen per stad. */
SELECT City, COUNT(*) AS aantal_brouwerijen FROM brewers GROUP BY City;

/*3. Geef me alle bieren die gebrouwen zijn in Alken;*/
SELECT * FROM beers WHERE BrewerId IN (SELECT Id FROM brewers where City = 'Alken');

/*4.  Geef me het gemiddelde van alle bierprijzen per brouwerij.*/
SELECT beers.BrewerId, AVG(beers.Price) AS gemiddelde_prijs FROM beers GROUP BY beers.BrewerId;

/*5.  Geef me alle brouwers terug die meer dan 10 bieren produceren.*/
SELECT brewers.Id, COUNT(*) AS aantal_bieren FROM brewers GROUP BY brewers.Id HAVING COUNT(*) > 10;

/*6.  Geef me alle brouwers terug die 'Alcoholarm' of 'Alcoholvrij' bieren maken. Gebruik hiervoor ook de tabel Category*/


