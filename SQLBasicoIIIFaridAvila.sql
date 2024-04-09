 /************************************************************************************************
    Nombre       : SQLBASICOIII
    Descripcion  : SCRIPT ARREGLANDO LOS QUERY'S PROPORCIONADOS EN EL TALLES
    Autor        : FARID DALIANG AVILA
    Fecha        : 08/24/2024
 ***********************************************************************************************/


--A)

WITH Numbers AS(
  SELECT DISTINCT 1 AS  x
  FROM departments
  UNION ALL
  SELECT DISTINCT 2
  FROM departments
  UNION ALL
  SELECT DISTINCT 2
  FROM departments
  UNION ALL
  SELECT DISTINCT 5
  FROM departments
  UNION ALL
  SELECT DISTINCT 8
  FROM departments
  UNION ALL
  SELECT DISTINCT 10
  FROM departments
  UNION ALL
  SELECT DISTINCT 10
  FROM departments
  UNION ALL
  SELECT DISTINCT 10
  FROM departments
  UNION ALL
  SELECT DISTINCT 11
  FROM departments
)
SELECT x,
RANK() OVER (ORDER BY x ASC) AS rank
FROM Numbers;

/

--B)

WITH Numbers AS(
  SELECT DISTINCT 1 AS  x
  FROM employees
  UNION ALL
  SELECT DISTINCT 2
  FROM employees
  UNION ALL
  SELECT DISTINCT 2
  FROM employees
  UNION ALL
  SELECT DISTINCT 5
  FROM employees
  UNION ALL
  SELECT DISTINCT 8
  FROM employees
  UNION ALL
  SELECT DISTINCT 10
  FROM employees
  UNION ALL
  SELECT DISTINCT 10
  FROM employees

)
SELECT x,
DENSE_RANK() OVER (ORDER BY x ASC) AS desen_rank
FROM Numbers;

--C)

WITH finishers AS
(SELECT DISTINCT 'Sophia Liu' as name,
    TIMESTAMP '2016-10-18 2:51:45' as finish_time,'F30-34' as division
    FROM EMPLOYEES
    UNION ALL SELECT DISTINCT'Lisa Stelzner', TIMESTAMP '2016-10-18 2:54:11', 'F35-39'
    FROM EMPLOYEES
    UNION ALL SELECT DISTINCT 'Nikki Leith', TIMESTAMP '2016-10-18 2:59:01', 'F30-34'
    FROM EMPLOYEES
    UNION ALL SELECT DISTINCT 'Lauren Matthews', TIMESTAMP '2016-10-18 3:01:17', 'F35-39'
    FROM EMPLOYEES
    UNION ALL SELECT DISTINCT 'Desiree Berry', TIMESTAMP '2016-10-18 3:05:42', 'F35-39'
    FROM EMPLOYEES
    UNION ALL SELECT DISTINCT 'Suzy Slane', TIMESTAMP '2016-10-18 3:06:24', 'F35-39'
    FROM EMPLOYEES
    UNION ALL SELECT DISTINCT 'Jen Edwards', TIMESTAMP '2016-10-18 3:06:36', 'F30-34'
    FROM EMPLOYEES
    UNION ALL SELECT DISTINCT 'Meghan Lederer', TIMESTAMP '2016-10-18 2:59:01', 'F30-34'
    FROM EMPLOYEES)
    SELECT
    name,
    finish_time,
    division,
    RANK() OVER (PARTITION BY division ORDER BY finish_time ASC) AS finish_rank
FROM finishers;


--D)

WITH finishers AS
 (SELECT DISTINCT 'Sophia Liu' as name,
    TIMESTAMP '2016-10-18 2:51:45' as finish_time,'F30-34' as division
    FROM EMPLOYEES
    UNION ALL SELECT DISTINCT 'Lisa Stelzner', TIMESTAMP '2016-10-18 2:54:11', 'F35-39'
    FROM EMPLOYEES
    UNION ALL SELECT DISTINCT 'Nikki Leith', TIMESTAMP '2016-10-18 2:59:01', 'F30-34'
    FROM EMPLOYEES
    UNION ALL SELECT DISTINCT 'Lauren Matthews', TIMESTAMP '2016-10-18 3:01:17', 'F35-39'
    FROM EMPLOYEES
    UNION ALL SELECT DISTINCT 'Desiree Berry', TIMESTAMP '2016-10-18 3:05:42', 'F35-39'
    FROM EMPLOYEES
    UNION ALL SELECT DISTINCT 'Suzy Slane', TIMESTAMP '2016-10-18 3:06:24', 'F35-39'
    FROM EMPLOYEES
    UNION ALL SELECT DISTINCT 'Jen Edwards', TIMESTAMP '2016-10-18 3:06:36', 'F30-34'
    FROM EMPLOYEES
    UNION ALL SELECT DISTINCT 'Meghan Lederer', TIMESTAMP '2016-10-18 2:59:01', 'F30-34'
    FROM EMPLOYEES)
    SELECT name,
    finish_time,
    division,
    PERCENT_RANK() OVER (PARTITION BY division ORDER BY finish_time ASC) AS finish_rank
FROM finishers;
