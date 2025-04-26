-- queries.sql
-- Complete each mission by writing your SQL query below the instructions.
-- Don't forget to end each query with a semicolon ;

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;

SELECT DISTINCT observations.region_id, COUNT(DISTINCT observations.species_id) AS distincts_species, regions.country, regions.name
FROM observations
INNER JOIN regions ON observations.region_id = regions.id
GROUP BY observations.region_id
ORDER BY distincts_species DESC
LIMIT 7;

SELECT observation_date, COUNT(DISTINCT observations.species_id) AS diver_species
FROM observations
GROUP BY observation_date
ORDER BY diver_species DESC;

SELECT strftime('%m', observation_date) AS mes, COUNT(*) AS num_observaciones
FROM observations
GROUP BY mes
ORDER BY num_observaciones DESC
LIMIT 5;

SELECT species.scientific_name, COUNT(observations.species_id) AS num_apariciones
FROM observations
INNER JOIN species ON observations.species_id = species.id
GROUP BY species.id
ORDER BY num_apariciones ASC
LIMIT 10;

SELECT regions.name, regions.id, COUNT(observations.species_id) AS obs_especies
FROM observations
INNER JOIN species ON observations.species_id = species.id
INNER JOIN regions ON observations.region_id = regions.id
GROUP BY species.id
ORDER BY obs_especies DESC
LIMIT 1;

SELECT species.scientific_name, COUNT(observations.species_id) AS num_apariciones
FROM observations
INNER JOIN species ON observations.species_id = species.id
GROUP BY species.id
ORDER BY num_apariciones DESC
LIMIT 10;

SELECT observer, COUNT(observer) as observador_frecuente
FROM observations
GROUP BY observer
ORDER BY observador_frecuente DESC
LIMIT 1;

SELECT species.id, species.scientific_name
FROM species
LEFT JOIN observations ON species.id = observations.species_id
WHERE observations.species_id IS NULL;

SELECT strftime('%d', observation_date) AS dia, strftime('%m', observation_date) AS mes, COUNT(species_id) AS num_especies_fecha, species.scientific_name
FROM observations
INNER JOIN species ON observations.species_id = species.id
GROUP BY dia, mes, species.id
ORDER BY num_especies_fecha DESC;
