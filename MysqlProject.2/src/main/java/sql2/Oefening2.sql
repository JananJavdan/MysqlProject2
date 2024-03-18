/*(a) Hoeveel verschillende brouwers zitten er in de database? (118)*/
SELECT COUNT(DISTINCT Name) AS aantal_brouwers FROM brewers;

/*• (b) Bereken de gemiddelde turnover van alle brouwers. (114302.1525)*/
SELECT AVG(brewers.Turnover) AS gemiddelde_turnover FROM brewers;

/*(c) Geef het laagste, gemiddelde en hoogste alcoholgehalte uit de beers tabel in 1 instructie. (0, 5.8706, 15)*/
SELECT MIN(beers.Alcohol) AS laagste_alcoholgehalte,
       AVG(beers.Alcohol) AS gemiddelde_alcoholgehalte,
       MAX(beers.Alcohol) AS hoogste_alcoholgehalte FROM beers;

/*(d) Bereken de gemiddelde turnover van alle brouwers in de provincie Brabant (postcodes die beginnen met
een 1) maar negeer de brouwerij ‘Palm’. (39525.7143)*/
SELECT AVG(Turnover) AS gemiddelde_turnover
FROM brewers WHERE ZipCode LIKE '1%' AND Name NOT LIKE '%PALM%';

SELECT AVG(Turnover) AS AverageTurnover
         FROM thebelgianbrewerydb.brewers
         JOIN brewers ON brewers.Turnover = brewers.Id
         WHERE brewers.ZipCode LIKE '1%'   -- Postcodes die beginnen met een 1 (provincie Brabant)
         AND brewers.Name NOT LIKE '%Palm%';      -- Negeer de brouwerij 'Palm'

/*(e) Bereken het gemiddelde alcohol per categorie(id). (114 records)*/
SELECT BrewerId, AVG(Alcohol) AS gemiddelde_alcohol FROM beers GROUP BY BrewerId;

/*(f) Toon de hoogste bierprijs per categorie maar negeer alle
  bieren die niet in stock zijn. Sorteer het resultaat
op categorie id. Zorg er ook voor dat we enkel prijzen zien
  die hoger zijn dan 3. (5 records)*/
SELECT CategoryId, MAX(beers.Price) AS bierprijs FROM beers
        WHERE Stock>0 -- Alleen bieren die in voorraad zijn
        AND beers.Price>3  -- Alleen prijzen hoger dan 3
        GROUP BY CategoryId
        ORDER BY CategoryId;

/* tweede manier met having*/
SELECT CategoryId, MAX(Price) AS bierprijs
FROM beers
WHERE Stock > 0 -- Alleen bieren die in voorraad zijn
GROUP BY CategoryId
HAVING MAX(Price) > 3 -- Alleen prijzen hoger dan 3
ORDER BY CategoryId;














