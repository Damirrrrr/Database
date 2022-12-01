---1:
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

--f
SELECT c.name, c.city, d.name, (s.amount * d.charge) as commission
FROM dealer d
    JOIN client c on d.id = c.dealer_id
    JOIN sell s on c.id = s.client_id;

--g
SELECT c.name, c.city, d.id, d.name, (s.amount * d.charge) as commission
FROM dealer d
    JOIN client c on d.id = c.dealer_id
    JOIN sell s on c.id = s.client_id
WHERE d.charge > 0.12;

--h
SELECT c.name, c.city, s.date, s.amount, s.id, d.name, d.charge
FROM dealer d
    JOIN client c on d.id = c.dealer_id
    JOIN sell s on c.id = s.client_id;

--i
SELECT c.name, c.city, s.date, s.amount, s.id, d.name, d.charge
FROM dealer d
    JOIN client c on d.id = c.dealer_id
    JOIN sell s on c.id = s.client_id
WHERE c.priority IS NOT NULL
AND s.amount > 2000;

---2:
--a
CREATE OR REPLACE VIEW a as
    SELECT count(DISTINCT client_id) as "number", avg(amount) as "average", sum(amount) as "total", date
FROM sell
GROUP BY date;

--b
CREATE OR REPLACE VIEW b AS
    SELECT sum(amount) as total, date
FROM sell
GROUP BY date
ORDER BY total DESC
LIMIT 5;

--c


