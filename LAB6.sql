---1)
--a
SELECT *
FROM dealer CROSS JOIN client;
--b
SELECT dealer.name, c.name, c.city, c.priority,s.id, s.amount, s.date
FROM dealer
    JOIN client c on dealer.id = c.dealer_id
    JOIN sell s on dealer.id = s.dealer_id;
--c
SELECT *
FROM dealer JOIN client c on dealer.location = c.city;

--d
SELECT sell.id, sell.amount, name as client_name, city
FROM sell JOIN client c on sell.client_id = c.id
WHERE sell.amount BETWEEN 100 AND 500;

--e
SELECT *
FROM dealer d
    FULL OUTER JOIN client c on d.id = c.dealer_id;