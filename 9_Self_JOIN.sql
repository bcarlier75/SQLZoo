-- #1. How many stops are in the database.
SELECT COUNT(*)
FROM stops

-- #2. Find the id value for the stop 'Craiglockhart'
SELECT id
FROM stops
WHERE name = 'Craiglockhart'

-- #3. Give the id and the name for the stops on the '4' 'LRT' service.
SELECT id, name 
FROM stops JOIN route ON (stops.id = route.stop)
WHERE num = 4

-- #4. Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*)
FROM route
WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING (COUNT(*) = 2)

-- #5. Change the query so that it shows the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149

-- 6#. Change the query so that the services between 'Craiglockhart' and 'London Road' are
--     shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'.
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops stopa ON (a.stop=stopa.id) JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name = 'London Road'

-- 7#. 
