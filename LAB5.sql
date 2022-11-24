CREATE TABLE warehouses(
    code integer,
    location varchar(255),
    capacity integer,
    PRIMARY KEY(code)
);

CREATE TABLE boxes(
    code char(4),
    contents varchar(255),
    value real,
    warehouses integer REFERENCES Warehouses(code)
);


INSERT INTO Warehouses(code, location, capacity) VALUES(1, 'Chicago', 3);
INSERT INTO Warehouses(code, location, capacity) VALUES(2, 'Rocks', 4);
INSERT INTO Warehouses(code, location, capacity) VALUES(3, 'New York', 7);
INSERT INTO Warehouses(code, location, capacity) VALUES(4, 'Los Angeles', 2);
INSERT INTO Warehouses(code, location, capacity) VALUES(5, 'San Francisсo', 8);

INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('0MN7', 'Rocks', 180, 3);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('4H8P', 'Rocks', 250, 1);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('4RT3', 'Scissors', 190, 4);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('7G3H', 'Rocks', 200, 1);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('8JN6', 'Papers', 75, 1);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('8Y6U', 'Papers', 50, 3);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('9J6F', 'Papers', 175, 2);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('LL08', 'Rocks', 140, 4);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('P0H6', 'Scissors', 125, 1);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('P2T6', 'Scissors', 150, 2);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('TUSS', 'Papers', 90, 5);

---4---
SELECT *
FROM warehouses;

---5---

SELECT *
FROM boxes WHERE value > 150;

---6---

SELECT DISTINCT contents
from boxes
GROUP BY contents;

---7---

select warehouses, count(warehouses) as amount
from boxes group by warehouses;

---8---
SELECT warehouses from (
SELECT warehouses, count(warehouses) as cnt FROM boxes group by warehouses) as amount
where amount.cnt>2;

---9---

INSERT INTO warehouses (code, location, capacity) VALUES (6, 'New York', 3);

---10---
INSERT INTO boxes (code, contents, value, warehouses) VALUES ('H5RT', 'Papers', 200, 2)

---11---
UPDATE boxes
SET value = (value * 0.85)
WHERE value = (SELECT value FROM boxes
                            ORDER BY value desc LIMIT 1 OFFSET 2);

---12---
DELETE FROM boxes
where value < 150
RETURNING *;

---13---
DELETE FROM boxes
WHERE warehouses in(SELECT code from Warehouses where location = 'New York')
RETURNING *;


