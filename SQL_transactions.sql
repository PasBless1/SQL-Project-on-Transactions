SELECT * FROM transactions;

SELECT sales_id, country, brand, unit 
FROM transactions;

--Return single columns
SELECT order_date from transactions;

-- SELECT EXPRESSIONS
SELECT 10+3 AS 'Ten + Three';
SELECT 1000 * 100;

SELECT 
    order_date,
    unit_price * unit AS 'Total Value'

FROM transactions;

SELECT unit, unit * 0.1 FROM transactions;

SELECT 
    order_date AS 'Transaction Date'
FROM transactions;

SELECT DISTINCT country FROM transactions;

SELECT DISTINCT country, region FROM transactions
ORDER BY country;

SELECT TOP 5 brand, unit FROM transactions;

SELECT TOP 10 brand, unit FROM transactions;

SELECT TOP 5 PERCENT brand, unit FROM transactions;

SELECT 
  TOP 5 PERCENT brand,
    unit

FROM transactions
ORDER BY unit DESC;

SELECT * FROM transactions
where country = 'Ghana';


SELECT * FROM transactions
where country = 'Nigeria';

SELECT brand, unit FROM transactions
where brand = 'infinix';

SELECT * FROM transactions
where unit > 450;

SELECT * FROM transactions
where order_date = '2020-01-01';

SELECT * FROM transactions
where country = 'Togo';

SELECT * FROM transactions
where brand = 'Techno';

SELECT * FROM transactions
where unit > 450;

SELECT * FROM transactions
where unit > 490;

SELECT * FROM transactions
where unit < 300 
ORDER BY unit DESC;

SELECT * FROM transactions
where country <> 'Ghana';

SELECT * FROM transactions
where country != 'Ghana';

--AND
SELECT * FROM transactions
where country = 'Ghana' AND brand = 'Infinix';

SELECT * FROM transactions
where country = 'Togo' AND unit > 400;

SELECT * FROM transactions
where country = 'Nigeria' AND brand = 'Hisense' AND unit > 400;

--OR
SELECT * FROM transactions
where country = 'Ghana' OR country = 'Nigeria';

SELECT * FROM transactions
where country = 'Ghana' OR brand = 'Techno';

SELECT * FROM transactions
where brand = 'Infinix' OR unit > 400;

--IN
SELECT * FROM transactions
where country IN('Ghana','Nigeria','Togo');

SELECT * FROM transactions
where brand in ('Infinix','Techno','Apple') and unit > 400;

--BETWEEN

SELECT * FROM transactions
where unit Between 400 and 450;

SELECT * FROM transactions
where order_date Between '2020-01-01' and '2022-06-01';

SELECT DISTINCT sales_rep FROM transactions
where sales_rep LIKE 'J%';

SELECT DISTINCT sales_rep FROM transactions
where sales_rep LIKE '%s';

SELECT DISTINCT sales_rep FROM transactions
where sales_rep LIKE '____s';

SELECT * FROM transactions
where country like '%A';

SELECT * FROM transactions
where country like '%A%';

SELECT * FROM transactions
where order_date IS NULL;

SELECT * FROM transactions
where region IS NULL;

SELECT * FROM transactions
where sales_id IS NULL;

SELECT * FROM transactions
where sales_id IS NOT NULL;

SELECT * FROM transactions
where region IS NOT NULL;

--IS NULL
SELECT region FROM transactions
where region IS NULL;

SELECT ISNULL(region, 'No region provided') FROM transactions
;

SELECT ISNULL(region, 'No region provided') FROM transactions
where region IS NULL;

SELECT * FROM transactions
where order_date IS NULL;

SELECT ISNULL(order_date, '2024-12-04') FROM transactions
where order_date IS NULL;

SELECT * FROM transactions

SELECT COUNT(order_date) FROM transactions;

SELECT COUNT(*) FROM transactions;

SELECT COUNT(region) FROM transactions;

SELECT COUNT(country) FROM transactions
where country = 'Ghana';

SELECT SUM (unit) AS total_orders FROM transactions;

SELECT SUM(unit) AS 'total_orders' FROM transactions
where brand = 'Infinix';

SELECT AVG(unit) FROM transactions
where country = 'Togo';

SELECT MAX(unit) FROM transactions;

SELECT MIN(unit) FROM transactions;

SELECT country, SUM(unit) AS 'total orders' FROM transactions
GROUP BY country;

SELECT brand, SUM(unit) FROM transactions
GROUP BY brand;

SELECT country, SUM(unit) FROM transactions
where unit > 400 
GROUP BY country;

SELECT country, region, SUM(unit) 
FROM transactions
GROUP BY country, region 
ORDER BY country;

SELECT country, COUNT(region), SUM(unit)
FROM transactions
GROUP BY country;

--ORDER BY
SELECT * FROM transactions
ORDER BY country DESC;

SELECT * FROM transactions
ORDER BY unit DESC;

SELECT * FROM transactions
ORDER BY country DESC, unit DESC;

--HAVING CLAUSE
SELECT country, SUM(unit) AS total_orders FROM transactions
GROUP BY country
HAVING SUM(unit) > 52000;

SELECT sales_rep, SUM(unit) AS 'total orders ' FROM transactions
GROUP BY sales_rep
ORDER BY SUM(unit) DESC;

--Target 20k
SELECT
    sales_rep,
    SUM(unit) AS orders
FROM transactions
GROUP BY sales_rep
HAVING SUM(unit) > 20000
ORDER BY SUM(unit);

SELECT 
    country,
    brand,
    SUM(unit) AS orders
 FROM transactions
GROUP BY country, brand
HAVING SUM(unit) > 8000
ORDER BY orders DESC;

SELECT 
    country,
    SUM(unit) AS orders

FROM transactions
where brand = 'Infinix'
GROUP BY country
HAVING SUM(unit) > 7000;

SELECT 
    country,
    SUM(unit) AS orders

FROM transactions
where brand = 'Infinix'
GROUP BY country
HAVING SUM(unit) > 6000
ORDER BY SUM(unit)  DESC;

SELECT * FROM transactions;

SELECT
    country,
    CASE WHEN country = 'Ghana' THEN 'Local'
    ELSE 'Foreign'
    END

FROM transactions;


SELECT 
 DISTINCT (country),
 CASE WHEN country IN('Ghana', 'Nigeria') THEN 'Anglophone'
 ELSE 'Francophone'
 END

FROM transactions;

SELECT 
 CASE WHEN country IN('Ghana', 'Nigeria') THEN 'Anglophone'
 ELSE 'Francophone'
 END AS Class,
 SUM(unit)

FROM transactions
GROUP BY (CASE WHEN country IN('Ghana', 'Nigeria') THEN 'Anglophone'
 ELSE 'Francophone'
 END );

--IF SHIPPING FEE IS > 400 0%, >= 150 15%, >=80 20%, < 80 25% 
SELECT
    unit,
    CASE WHEN unit > 400 THEN 0
        WHEN unit >= 150 THEN 0.15
        WHEN unit >= 80 THEN 0.2
    ELSE 0.25
    END AS shipping_fee
FROM transactions;

--Ghana 5%
--Nigeria 4%, --Senegal 10%, --Togo 0%, Benin 15%

SELECT 
    country,
    unit,
    CASE
        WHEN country = 'Ghana' THEN 0.05
        WHEN country = 'Nigeria' THEN 0.04
        WHEN country = 'Togo' THEN 0
        WHEN country = 'Senegal' THEN 0.1
        WHEN country = 'Benin' THEN 0.04
    END AS shipping_fees

FROM transactions;






