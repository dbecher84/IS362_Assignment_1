# Count of planes in planes table with a listed speed
#Answer: 23
SELECT COUNT(*)
FROM planes
WHERE speed;

#Maximum and Minimun speed listed
#Answer: max 432 min 90
SELECT MAX(speed), min(Speed)
FROM planes;

#Total distance for flights in Jaunary 2013
#Answer: 27188805 
SELECT SUM(distance)
from flights
WHERE month = 1 AND year = 2013;

#Total distance for flights in January 2013 where there is no Tail number listed
#Answer: 81763
SELECT SUM(distance)
from flights
WHERE month = 1 AND year = 2013 AND tailnum = '';

#Total distance all planes on July 5, 2013 grouped by aircraft manufacture using INNER JOIN
SELECT planes.manufacturer, SUM(flights.distance)
FROM flights
INNER JOIN planes ON flights.tailnum = planes.tailnum
WHERE flights.month = 7 AND flights.day = 5 AND flights.year =2013
GROUP BY planes.manufacturer
ORDER BY planes.manufacturer;

#Total distance all planes on July 5, 2013 grouped by aircraft manufacture using LEFT OUTER JOin
SELECT planes.manufacturer, SUM(flights.distance)
FROM flights
LEFT OUTER JOIN planes ON flights.tailnum = planes.tailnum
WHERE flights.month = 7 AND flights.day = 5 AND flights.year =2013
GROUP BY planes.manufacturer
ORDER by planes.manufacturer;
#ANSWER: LEFT OUTER JOIN includes NULL values. It totaled the distace for flights that 
# did not have a manufacuture listed. 

#Average departure delay by airline ordered high to low
SELECT AVG(flights.dep_delay), airlines.name
FROM flights
INNER JOIN airlines ON airlines.carrier = flights.carrier
GROUP BY flights.carrier
ORDER BY AVG(flights.dep_delay);