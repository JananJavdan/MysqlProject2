-- a Selecteer de brouwers die een turnover hebben die hoger dan het gemiddelde is
SELECT * FROM brewers WHERE turnover > (select AVG(turnover) FROM brewers);

-- b  Toon alle bieren die het minimum of maximum alcohol gehalte hebben.
SELECT * FROM beers WHERE Alcohol = (SELECT MAX(Alcohol) FROM beers);
SELECT * FROM beers WHERE Alcohol = (SELECT MIN(Alcohol) FROM beers);

-- c Toon alle bieren met een alcohol hoger dan het gemiddelde
-- en waarvan de brouwers een turnover hebben dat boven het gemiddelde ligt
SELECT b1.* FROM beers b1
JOIN brewers b2 ON b1.BrewerId = b1.BrewerId = b2.Id
WHERE b1.alcohol > (SELECT AVG(alcohol) FROM beers)
  AND b2.turnover > (SELECT AVG(turnover) FROM brewers);

-- d : toon een lijst van alle brouwers met de prijs en naam van hun duurste
-- bier. Het is mogelijk dat er meerdere bieren per brouwer geselecteerd worden
SELECT b2.Name, b1.Name, b1.Price
FROM (
         SELECT BrewerId, MAX(Price) AS MaxPrice
         FROM beers
         GROUP BY BrewerId
     ) AS max_prices
         JOIN beers b1 ON max_prices.BrewerId = b1.BrewerId AND max_prices.MaxPrice = b1.Price
         JOIN brewers b2 ON b1.BrewerId = b1.BrewerId = b2.Id;


 SELECT b1.* FROM beers b1
  WHERE b1.alcohol < (SELECT AVG(b2.alcohol)
                      FROM beers b2
                      WHERE b2.categoryid=b1.categoryid);














