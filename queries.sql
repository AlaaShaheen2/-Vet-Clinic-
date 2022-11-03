/*Queries that provide answers to the questions from all projects.*/

 SELECT * FROM animals WHERE name LIKE '%mon%';
 SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
 SELECT name FROM animals WHERE neutered IS true AND escape_attempts<3;
 SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
 SELECT name,escape_attempts FROM animals WHERE weight_kg >10.5;
 SELECT * FROM animals WHERE neutered IS true;
 SELECT * FROM animals WHERE name !='Gabumon';
 SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 and 17.3;


BEGIN TRANSACTION;

ALTER TABLE animals RENAME COLUMN species TO unspecified;

SELECT * FROM animals;

ROLLBACK TRANSACTION;
SELECT * FROM animals;

--update animales table
BEGIN TRANSACTION;
UPDATE animals SET species='Digimon' WHERE name Like'%mon%';
UPDATE animals SET species='Pokemon' WHERE species IS NULL;
COMMIT TRANSACTION;
SELECT * FROM animals;

BEGIN TRANSACTION;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK TRANSACTION;
SELECT * FROM animals;

BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT CH1;
UPDATE animals SET weight_kg=weight_kg*-1;
ROLLBACK TO CH1;
UPDATE animals SET weight_kg=weight_kg*-1 WHERE weight_kg<0;
COMMIT TRANSACTION;
SELECT * FROM animals;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;
SELECT AVG(weight_kg) FROM  animals;
SELECT neutered, COUNT(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT name,date_of_birth, AVG(escape_attempts) FROM animals GROUP BY name, date_of_birth HAVING date_of_birth BETWEEN '1990-01-01' AND '2000-01-01';

--Write queries (using JOIN):
SELECT name FROM  animals JOIN owners ON animals.owner_id = owners.id WHERE owners.id=4;

SELECT animals.name FROM  animals JOIN species ON animals.species_id = species.id WHERE species.id=1;

SELECT full_name,name FROM  owners LEFT JOIN animals ON owner_id = owners.id;

SELECT species.name, COUNT(*) FROM animals, species WHERE species_id = species.id GROUP BY species.name;

SELECT name, full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Jennifer Orwell' and species_id = 2;

SELECT full_name, name FROM animals LEFT JOIN owners ON owner_id = owners.id WHERE owners.id=5 and escape_attempts=0;

SELECT full_name , COUNT(animals.name) AS all_animals FROM owners JOIN animals ON owner_id=owners.id GROUP BY owners.id ORDER BY all_animals DESC LIMIT 1;