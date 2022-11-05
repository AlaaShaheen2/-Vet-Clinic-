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

--day4 project

--Who was the last animal seen by William Tatcher?
SELECT animal.id,  animal.name, vt.date_of_visit FROM animals 
animal JOIN visits vt ON vt.animal_id =  animal.id JOIN vets v ON v.id = vt.vets_id WHERE v.name = 'William Tatcher' ORDER BY vt.date_of_visit DESC LIMIT 1;

--How many different animals did Stephanie Mendez see?
SELECT COUNT(*) AS all_animals FROM animals 
animal JOIN visits vt ON animal.id = vt.animal_id JOIN vets v on v.id = vt.vets_id WHERE v.id = 3;

--List all vets and their specialties, including vets with no specialties.
SELECT v.id, v.name AS Vet_name,sp.name
 AS Specialty FROM vets v LEFT JOIN specializations s ON s.vets_id = v.id
  LEFT JOIN species sp ON sp.id=s.species_id ORDER BY v.id;

--List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT a.name AS Animal, vt.date_of_visit FROM animals
 a INNER JOIN visits vt ON vt.animal_id = a.id INNER JOIN vets v ON v.id = vt.vets_id 
 WHERE v.name = 'Stephanie Mendez' AND vt.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

--What animal has the most visits to vets?
SELECT a.name as Animal, COUNT(*)
 AS all_visits FROM animals a JOIN visits vt ON a.id = vt.animal_id
  GROUP BY a.id ORDER BY all_visits DESC LIMIT 1;

--Who was Maisy Smith's first visit?
SELECT a.name AS First_Visit, s.name as Species, 
a.date_of_birth, vt.date_of_visit FROM animals
a JOIN species s ON a.species_id = s.id JOIN visits vt ON a.id = vt.animal_id 
JOIN vets v ON v.id = vt.vets_id WHERE v.name = 'Maisy Smith' ORDER BY vt.date_of_visit ASC LIMIT 1;

--Details for most recent visit: animal information, vet information, and date of visit.
SELECT a.name AS Animal, a.date_of_birth, a.weight_kg, v.name 
AS Vet_Name, v.age AS vet_age,v.date_of_graduation, vt.date_of_visit
FROM animals a JOIN visits vt ON a.id = vt.animal_id JOIN vets v ON vt.vets_id = v.id 
ORDER BY vt.date_of_visit DESC LIMIT 1;

--How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(unspecialized_visit.name) 
AS unspecialized_visit 
FROM vets v JOIN visits vt ON vt.vets_id = v.id 
JOIN animals ON vt.animal_id = animals.id 
JOIN species sp ON sp.id = animals.species_id 
JOIN specializations s ON s.vets_id = v.id 
JOIN species AS unspecialized_visit ON unspecialized_visit.id = s.vets_id 
WHERE sp.id != unspecialized_visit.id;

--What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT sp.name AS species 
FROM vets v JOIN visits vt 
ON v.id = vt.vets_id 
JOIN animals a 
ON vt.animal_id = a.id 
JOIN species sp ON sp.id = a.species_id 
WHERE v.name = 'Maisy Smith' GROUP BY species LIMIT 1;