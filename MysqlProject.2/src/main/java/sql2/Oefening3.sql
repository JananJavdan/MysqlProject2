##a
SELECT Beers.Name AS BeerName, beers.CategoryId AS CategoryName
FROM Beers
JOIN category ON Beers.CategoryId = CategoryId
WHERE Beers.Alcohol = 0;

##b
SELECT brewers.Name AS BrewerName, MAX(Beers.Price) AS MaxPriceOfBeer
FROM Beers
JOIN brewers ON Beers.BrewerId = brewers.Id
GROUP BY brewers.Name;


##c
SELECT Beers.Id, Beers.Name AS BeerName, brewers.Name AS BrewerName
FROM Beers
LEFT JOIN brewers ON Beers.BrewerId = brewers.Id
WHERE Beers.Id BETWEEN 1500 AND 1600;

##d
SELECT Beers.Id,
       Beers.Name AS BeerName,
       brewers.Name AS BrewerName,
       CategoryId AS CategoryName,
       Beers.Alcohol
FROM Beers
INNER JOIN brewers ON Beers.BrewerId = brewers.Id
INNER JOIN category ON Beers.CategoryId = category.Id
ORDER BY Beers.Alcohol DESC
LIMIT 3;






