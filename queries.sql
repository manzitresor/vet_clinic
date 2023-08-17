/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE (escape_attempts < 3) AND neutered;
SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


BEGIN TRANSACTION;
UPDATE animals SET species='unspecified';
SELECT *FROM animals;
ROLLBACK;
SELECT *FROM animals;

BEGIN TRANSACTION;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
SELECT *FROM animals;
UPDATE animals SET species='pokemon' where species IS NULL;
SELECT *FROM animals;
COMMIT;

BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK;
SELECT *FROM animals;

 BEGIN TRANSACTION;
 DELETE FROM animals WHERE date_of_birth > '2022-01-01';
 SAVEPOINT del_1;
 UPDATE animals SET weight_kg = weight_kg * -1;
 ROLLBACK TO del_1;
 UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
 COMMIT;

 SELECT COUNT(*) FROM animals;
 SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
 SELECT AVG(weight_kg) FROM animals;
 SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;
 SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
 SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


 SELECT *FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name='Melody Pond';
 SELECT *FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name='Pokemon';
 SELECT owners.full_name,animals.name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;
 SELECT species.name,COUNT(animals.id) FROM animals  JOIN species ON animals.species_id = species.id GROUP BY species.name;
 SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';
 SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
 SELECT owners.full_name FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY COUNT(animals.id) DESC LIMIT 1;



--  JOIN TABLES QUERY

SELECT animals.name FROM visits  JOIN vets ON visits.vets_id = vets.id  JOIN animals ON visits.animals_id = animals.id WHERE vets.name = 'William Tatcher' ORDER BY date DESC LIMIT 1;
SELECT COUNT(date) FROM visits JOIN vets ON vets_id = vets.id WHERE vets.name = 'Stephanie Mendez';
SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON vets.id = vets_id LEFT JOIN species ON species.id = species_id;
SELECT animals.name,visits.date FROM visits  JOIN vets ON visits.vets_id = vets.id  JOIN animals ON visits.animals_id = animals.id WHERE vets.name = 'William Tatcher' AND date BETWEEN '2020-04-01' AND '2020-08-30';
SELECT animals.name FROM visits JOIN animals ON animals_id = animals.id GROUP BY animals.name ORDER BY COUNT(animals.id) DESC LIMIT 1;
SELECT animals.name,visits.date FROM visits JOIN animals ON animals_id = animals.id JOIN vets ON vets_id = vets.id WHERE vets.name = 'Maisy Smith' ORDER BY date LIMIT 1;
SELECT animals.name,vets.name,date FROM visits JOIN animals ON animals_id = animals.id JOIN vets ON vets_id = vets.id ORDER BY date DESC LIMIT 1;
SELECT *FROM visits JOIN animals ON animals_id = animals.id JOIN vets ON vets_id = vets.id JOIN specializations ON vets.id = specializations.vets_id WHERE animals.species_id != specializations.species_id;
SELECT species.name FROM visits JOIN animals ON animals_id = animals.id JOIN species ON animals.species_id = species.id JOIN vets ON vets_id = vets.id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY COUNT(species.id) DESC LIMIT 1;