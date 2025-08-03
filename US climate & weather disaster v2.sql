-- SQL Weather and Climate Project

CREATE DATABASE us_weather_and_climate_disaster;

-- Create Table

CREATE TABLE us_natural_disaster_cost
	(
		name TEXT,
		disaster TEXT,
		begin_date DATE,
		end_date DATE,
		cpi_adjusted_cost FLOAT,
		unadjusted_cost FLOAT,
		deaths INT
	);

-- Data cleaning 

-- Checking for NULL values

SELECT *
FROM us_natural_disaster_cost
WHERE name IS NULL
	OR disaster IS NULL
	OR begin_date IS NULL
	OR end_date IS NULL
	OR cpi_adjusted_cost IS NULL
	OR unadjusted_cost IS NULL
	OR deaths IS NULL;

--Deleting NULL values from data set

DELETE FROM us_natural_disaster_cost
WHERE name IS NULL
	OR disaster IS NULL
	OR begin_date IS NULL
	OR end_date IS NULL
	OR cpi_adjusted_cost IS NULL
	OR unadjusted_cost IS NULL
	OR deaths IS NULL;

-- Altering the table to include a new column that fixes the format of the CPI-Adjusted Cost column  

ALTER TABLE us_natural_disaster_cost
ADD COLUMN cpi_cost_full_amount bigint;

-- Updating new column

UPDATE us_natural_disaster_cost
SET cpi_cost_full_amount = cpi_adjusted_cost * 1000000000;

-- Data exploration

-- What are the distinct disasters?

SELECT DISTINCT disaster
FROM us_natural_disaster_cost;

-- How many disasters were reported from 1980 to 2024?

SELECT 
	COUNT(disaster) AS "total disaster amount"
FROM us_natural_disaster_cost;

-- How many disasters were there per decade?

SELECT
	(EXTRACT(YEAR FROM begin_date):: int / 10) * 10 AS decade,
	COUNT(*) AS "disaster amount"
FROM us_natural_disaster_cost
GROUP BY decade
ORDER BY decade;

-- What is the total CPI-Adjusted Cost of all disasters?

SELECT
	SUM(cpi_cost_full_amount) AS "total cpi adjusted cost"
FROM us_natural_disaster_cost;

-- What is the total CPI-Adjusted Cost of disaster per decade?

SELECT 
	(EXTRACT(YEAR FROM begin_date):: int / 10) * 10 AS decade,
	SUM(cpi_cost_full_amount) AS "total cpi adjusted cost"
FROM us_natural_disaster_cost
GROUP BY decade
ORDER BY decade; 

-- Checking for cost outliers

WITH stats AS (
	SELECT
		percentile_cont(0.25) WITHIN GROUP (ORDER BY "cpi_adjusted_cost") AS q1,
		percentile_cont(0.75) WITHIN GROUP (ORDER BY "cpi_adjusted_cost") AS q3
	FROM us_natural_disaster_cost
),
outliers AS (
	SELECT
		d.*,
		s.q1,
		s.q3,
		(s.q3 - s.q1) AS iqr
	FROM us_natural_disaster_cost d
	CROSS JOIN stats s
)
SELECT *
FROM outliers
WHERE "cpi_adjusted_cost" < (q1 - 1.5 * iqr)
	OR "cpi_adjusted_cost" > (q3 + 1.5 * iqr);

-- What was the total deaths from 1980 to 2024?

SELECT 
	SUM(deaths) AS "total deaths"
FROM us_natural_disaster_cost;

-- What was the average deaths reported per disaster?

SELECT DISTINCT disaster,
	AVG(deaths) AS "average death"
FROM us_natural_disaster_cost
GROUP BY disaster;

-- What type of disaster was the deadliest?

SELECT DISTINCT disaster,
	MAX(deaths) AS "highest death count"
FROM us_natural_disaster_cost
GROUP BY 1
ORDER BY 2 DESC;

-- What disasters last the longest?

SELECT disaster, begin_date, end_date, end_date - begin_date AS "duration"
FROM us_natural_disaster_cost
ORDER BY duration DESC;

-- Categorizing disaster severity

WITH disaster_severity AS (
    SELECT
        name,
        disaster,
        cpi_adjusted_cost,
        deaths,
        CASE
            WHEN deaths >= 1000 OR cpi_adjusted_cost >= 100000000 THEN 'catastrophic'
            WHEN deaths >= 100 OR cpi_adjusted_cost >= 1000000 THEN 'severe'
            WHEN deaths >= 10 OR cpi_adjusted_cost >= 100000 THEN 'moderate'
            ELSE 'minor'
        END AS severity,
        CASE
            WHEN deaths >= 1000 OR cpi_adjusted_cost >= 100000000 THEN 4
            WHEN deaths >= 100 OR cpi_adjusted_cost >= 1000000 THEN 3
            WHEN deaths >= 10 OR cpi_adjusted_cost >= 100000 THEN 2
            ELSE 1
        END AS severity_rank
    FROM us_natural_disaster_cost
)
SELECT 
name, disaster, cpi_adjusted_cost, deaths, severity
FROM disaster_severity
ORDER BY severity_rank DESC;

-- Counting disasters by severity

SELECT severity, COUNT(*) AS total_disasters
FROM (
  SELECT 
    name,
    disaster,
    cpi_adjusted_cost,
    deaths,
    CASE
      WHEN deaths >= 1000 OR cpi_adjusted_cost >= 100000000 THEN 'catastrophic'
      WHEN deaths >= 100 OR cpi_adjusted_cost >= 1000000 THEN 'severe'
      WHEN deaths >= 10 OR cpi_adjusted_cost >= 100000 THEN 'moderate'
      ELSE 'minor'
    END AS severity
  FROM us_natural_disaster_cost
) AS classified_disasters
GROUP BY severity
ORDER BY 
  CASE 
    WHEN severity = 'catastrophic' THEN 4
    WHEN severity = 'severe' THEN 3
    WHEN severity = 'moderate' THEN 2
    ELSE 1
  END DESC;

-- Is there an increase in the frequency of disasters per year?

SELECT
	EXTRACT(YEAR FROM begin_date) AS "year",
	COUNT(*) AS disaster_count
FROM us_natural_disaster_cost
GROUP BY year
ORDER BY year;






