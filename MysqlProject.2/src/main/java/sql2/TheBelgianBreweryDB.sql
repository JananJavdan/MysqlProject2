CREATE DATABASE if not exists thebelgianbrewerydb;

USE thebelgianbrewerydb;

SELECT
    Id, Name, BrewerID, CategoryId, Price, Stock, Alcohol, Version, Image
FROM Beers;