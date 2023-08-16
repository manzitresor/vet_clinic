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


 UPDATE animals SET species_id=(SELECT id FROM species WHERE name='Digimon') WHERE name LIKE '%mon';
 UPDATE animals SET species_id=(SELECT id FROM species WHERE name='Pokemon') WHERE species_id IS NULL;

 UPDATE animals SET owner_id=(SELECT id FROM owners WHERE full_name='Sam Smith') WHERE name='Agumon';
 UPDATE animals SET owner_id=(SELECT id FROM owners WHERE full_name='Jennifer Orwell') WHERE name IN('Gabumon','Pikachu');
 UPDATE animals SET owner_id=(SELECT id FROM owners WHERE full_name='Bob') WHERE name IN('Devimon','Plantmon');
 UPDATE animals SET owner_id=(SELECT id FROM owners WHERE full_name='Melody Pond') WHERE name IN('Charmander','Squirtle','Blossom');
 UPDATE animals SET owner_id=(SELECT id FROM owners WHERE full_name='Dean Winchester') WHERE name IN('Angemon','Boarmon');
