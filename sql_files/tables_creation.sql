USE superhero;

-- top 10 heroes by overall_ps
SELECT h.*, p.*, a.*
FROM hero AS h
JOIN powerstats p ON h.id = p.id
JOIN appearance a ON h.id = a.id
ORDER BY p.overall_ps DESC
LIMIT 10;

-- top 10 races with more heroes: Game Creation
SELECT race, COUNT(*) AS num_heroes
FROM appearance
GROUP BY race
ORDER BY num_heroes DESC
LIMIT 10;

-- top 5 heroes for each race with more then 5 heroes: Game Creation
WITH RankedHeroes AS (
    SELECT h.name,
           p.*,
           a.race,
           ROW_NUMBER() OVER (PARTITION BY a.race ORDER BY p.overall_ps DESC) AS hero_rank
    FROM hero h
    JOIN powerstats p ON h.id = p.id
    JOIN appearance a ON h.id = a.id
)
SELECT *
FROM RankedHeroes
WHERE race IN (
    SELECT race
    FROM appearance
    GROUP BY race
    HAVING COUNT(*) > 4
) AND hero_rank <= 5;

-- Calculate the maximum and minimum years in which heroes were published by each publisher. *how many generations inside each one apply: Comic Con
SELECT b.publisher,
       COUNT(h.id) AS num_heroes,
       MAX(b.year) AS max_published_year,
       MIN(b.year) AS min_published_year
FROM biography b
JOIN hero h ON b.id = h.id
GROUP BY b.publisher
ORDER BY num_heroes DESC;

-- Count the number of heroes published by each publisher
SELECT b.publisher, COUNT(*) AS num_heroes
FROM biography b
JOIN hero h ON b.id = h.id
GROUP BY b.publisher;

-- List heroes with the highest overall powerstats aligned with the given alignment: Last Defense
SELECT h.name, p.*
FROM hero AS h
JOIN powerstats p ON h.id = p.id
JOIN biography b ON h.id = b.id
WHERE b.alignment = 'good'
ORDER BY p.overall_ps DESC
LIMIT 10;

-- List villains with the highest overall powerstats
SELECT h.name, p.*
FROM hero AS h
JOIN powerstats p ON h.id = p.id
JOIN biography b ON h.id = b.id
WHERE b.alignment = 'bad'
ORDER BY p.overall_ps DESC
LIMIT 10;

-- Publisher_first_years
SELECT h.name AS character_name, b.publisher, b.year
FROM hero h
JOIN biography b ON h.id = b.id;



