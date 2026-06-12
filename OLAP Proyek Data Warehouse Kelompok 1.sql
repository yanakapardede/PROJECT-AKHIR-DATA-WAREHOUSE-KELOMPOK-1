-- Validasi Isi Tabel
SELECT * FROM fact_crime LIMIT 5;

ALTER TABLE fact_crime
ADD CONSTRAINT fk_date
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);

SELECT * FROM dim_date LIMIT 5;
SELECT * FROM dim_city LIMIT 5;
SELECT * FROM dim_crime LIMIT 5;
SELECT * FROM dim_victim LIMIT 5;
SELECT * FROM dim_weapon LIMIT 5;
SELECT * FROM fact_crime LIMIT 5;
-- Implementasi Query OLAP
-- 1. Total Crime per Year
SELECT d.year,
    SUM(f.crime_count) AS total_crime
FROM fact_crime f
JOIN dim_date d
    ON f.date_id = d.date_id
GROUP BY d.year
ORDER BY d.year;

-- 2. Top 10 City by Total Crime
SELECT c.city,
    SUM(f.crime_count) AS total_crime
FROM fact_crime f
JOIN dim_city c
    ON f.city_id = c.city_id
GROUP BY c.city
ORDER BY total_crime DESC
LIMIT 10;

-- 3. Crime Domain vs Total Crime
SELECT c.crime_domain,
    SUM(f.crime_count) AS total_crime
FROM fact_crime f
JOIN dim_crime c
    ON f.crime_id = c.crime_id
GROUP BY c.crime_domain
ORDER BY total_crime DESC;

-- 4. Victim Gender vs Total Crime
SELECT v.victim_gender,
    SUM(f.crime_count) AS total_crime
FROM fact_crime f
JOIN dim_victim v
    ON f.victim_id = v.victim_id
GROUP BY v.victim_gender
ORDER BY total_crime DESC;

-- 5. Age Group vs Total Crime
SELECT v.age_group,
    SUM(f.crime_count) AS total_crime
FROM fact_crime f
JOIN dim_victim v
    ON f.victim_id = v.victim_id
GROUP BY v.age_group
ORDER BY total_crime DESC;

-- 6. Weapon Used vs Total Crime
SELECT w.weapon_used,
    SUM(f.crime_count) AS total_crime
FROM fact_crime f
JOIN dim_weapon w
    ON f.weapon_id = w.weapon_id
GROUP BY w.weapon_used
ORDER BY total_crime DESC;

-- 7. Crime Domain vs Avg Resolution Days
SELECT c.crime_domain,
    AVG(f.resolution_days) AS avg_resolution_days
FROM fact_crime f
JOIN dim_crime c
    ON f.crime_id = c.crime_id
GROUP BY c.crime_domain
ORDER BY avg_resolution_days DESC;

-- 8. City vs Avg Resolution Days
SELECT c.city,
    AVG(f.resolution_days) AS avg_resolution_days
FROM fact_crime f
JOIN dim_city c
    ON f.city_id = c.city_id
GROUP BY c.city
ORDER BY avg_resolution_days DESC;

-- Pembuatan Dashboard View
CREATE VIEW vw_crime_dashboard AS
SELECT
    f.report_number,
    d.year,
    d.month_name,
    c.city,
    cr.crime_domain,
    cr.crime_description,
    v.victim_gender,
    v.age_group,
    w.weapon_used,
    f.police_deployed,
    f.resolution_days,
    f.crime_count
FROM fact_crime f
JOIN dim_date d
    ON f.date_id = d.date_id
JOIN dim_city c
    ON f.city_id = c.city_id
JOIN dim_crime cr
    ON f.crime_id = cr.crime_id
JOIN dim_victim v
    ON f.victim_id = v.victim_id
JOIN dim_weapon w
    ON f.weapon_id = w.weapon_id;

SELECT * FROM vw_crime_dashboard LIMIT 10;
