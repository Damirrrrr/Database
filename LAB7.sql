---1)
CREATE OR REPLACE FUNCTION a(x int)
    returns int
    language plpgsql
AS
$$
    BEGIN
        return x + 1;
    end;
$$;

CREATE OR REPLACE FUNCTION b(x int, y int)
    returns int
    language plpgsql
AS
$$
    BEGIN
        return x + y;
    end;
$$;

CREATE OR REPLACE FUNCTION c(x int)
    returns bool
    language plpgsql
AS
$$
    BEGIN
        IF x % 2 = 0 THEN
            return true;
        ELSE
            return false;
        END IF;
    end;
$$;

CREATE OR REPLACE FUNCTION d(password text)
    returns bool
    language plpgsql
AS
$$
    BEGIN
        IF length(password)  >= 8 AND password SIMILAR TO '%[0-9]%' AND password SIMILAR TO '%[a-z]%'
               AND password SIMILAR TO '%[A-Z]%' AND password SIMILAR TO '%(@|_|$)%' THEN
            return true;
        ELSE
            return false;
        END IF;
    end;
$$;

CREATE OR REPLACE FUNCTION e(x int)
    returns table(NextNum int, PrevNum int)
    language plpgsql
AS
$$
    DECLARE
        next_num int;
        prev_num int;
    BEGIN
        next_num = x + 1;
        prev_num = x - 1;
        RETURN QUERY
            SELECT next_num, prev_num;
    END;
$$;

---3)
--a
CREATE OR REPLACE PROCEDURE increasing(year int, salary int, out salary1 int, out discount int)
AS
$$
DECLARE
    y int;
BEGIN
    while year >= 0
        loop
            if y % 2 = 0 then
                salary1 = salary * 0.1 + salary;
                discount = salary1 * 0.1;
            end if;
            if y % 5 = 0 then
                discount = discount * 0.01 + discount;
            end if;
            y = y + 1;
        end loop;
END;
$$
LANGUAGE plpgsql;
CALL increasing(6, 4000);

--b
CREATE OR REPLACE PROCEDURE increasing1(year int, salary int, out salary1 int, out discount int)
AS
$$
DECLARE
    y int;
BEGIN
    salary1 = salary;
    while year >= 0
        loop
            if y = 40 then
                salary1 = salary1 * 0.15 + salary1;
            end if;
            if y % 8 = 0 then
                salary1 = salary * 0.2 + salary1;
                discount = discount * 0.01 + discount;
            end if;
            y = y + 1;
        end loop;
END;
$$
LANGUAGE plpgsql;
CALL increasing1(20, 4000);

---4)
CREATE SCHEMA task4
    CREATE TABLE task4.worker(
        id integer,
        name varchar,
        date_of_birth date,
        age integer,
        salary integer,
        work_experience integer,
        discount integer,
        PRIMARY KEY (id)
    );