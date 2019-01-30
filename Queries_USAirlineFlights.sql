use USAirlineFlights;

/*Number of records in the flights table.*/
SELECT COUNT(*) FROM Flights;

/*Average delay of departure and arrival according to the airport of origin.*/
SELECT Origin, AVG(DepDelay), AVG(ArrDelay) FROM Flights GROUP BY Origin;

/*Average delay of arrival, by months and according to the airport of origin.*/
SELECT Origin, colYear, colMonth, AVG(ArrDelay) FROM Flights
GROUP BY Origin, colYear, colMonth
ORDER BY Origin, colYear, ColMonth;

/*Average delay of arrival, by months and according to the airport of origin
(same consultation as before in the same order). But now they want to show
the name of the city instead of the airport code.*/
SELECT City, colYear, colMonth, AVG(ArrDelay) FROM USAirports INNER JOIN Flights 
ON USAirports.IATA = Flights.Origin
GROUP BY Origin, colYear, colMonth
ORDER BY City, colYear, ColMonth;

/*Companies with more canceled flights. In addition, they must be ordered
in such a way that the companies with more cancellations appear first.*/
SELECT Description, COUNT(Cancelled) FROM Flights
INNER JOIN Carriers 
ON Carriers.CarrierCode = Flights.UniqueCarrier
WHERE Cancelled = 1
GROUP BY Description;

/*ID of the 10 airplanes that have traveled more kilometers in commercial flights.*/
SELECT TailNum, SUM(Distance) AS TotalDistance FROM Flights
GROUP BY TailNum
ORDER BY TotalDistance DESC LIMIT 10;

/*Companies with their average delay, only for those with
an average of more than 10 minutes.*/
SELECT Description, AVG(ArrDelay) AS AverageDelay FROM Flights
INNER JOIN Carriers
ON Carriers.CarrierCode = Flights.UniqueCarrier
GROUP BY UniqueCarrier
HAVING AVG(ArrDelay) > 10
ORDER BY AverageDelay;