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
SELECT brewers.Name, beers.Name, beers.Price
FROM (
         SELECT BrewerId, MAX(Price) AS MaxPrice
         FROM beers
         GROUP BY BrewerId
     ) AS max_prices
         JOIN beers ON max_prices.BrewerId = beers.BrewerId AND max_prices.MaxPrice = beers.Price
         JOIN brewers  ON beers.BrewerId = beers.BrewerId = brewers.Id;


SELECT Brewers.Name AS BrewerName,
       MAX(Beers.Price) AS MaxPrice,
       GROUP_CONCAT(Beers.Name ORDER BY Beers.Price DESC) AS ExpensiveBeers
FROM Brewers
         LEFT JOIN Beers ON Brewers.Id = Beers.BrewerId
GROUP BY Brewers.Id;

SELECT
    brewers.name AS BrewerName,
    beers.name AS BeerName,
    beers.Price
FROM beers
         INNER JOIN brewers ON beers.brewerId = brewers.id
WHERE
    (beers.brewerId, beers.Price) IN (
        SELECT
            beers.brewerId,
            MAX(beers.Price) AS MaxPrice
        FROM beers
        GROUP BY beers.brewerId
    );
















