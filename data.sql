/* Populate database with sample data. */

INSERT INTO animals VALUES (1,'Agumon', '02-03-2020',0,true,10.23);
INSERT INTO animals VALUES (2,'Gabumon', '11-15-2018',2,true,8);    
INSERT INTO animals VALUES (3,'Pikachu', '01-07-2021',1,false,15.04);
INSERT INTO animals VALUES (4,'Devimon', '05-12-2017',5,true,11);

INSERT INTO animals VALUES (5,'Charmander', '02-08-2020',0,false,-11);
INSERT INTO animals VALUES (6,'Plantmon', '11-15-2021',2,true,-5.7);
INSERT INTO animals VALUES (7,'Squirtle', '04-02-1993',3,false,-12.13);
INSERT INTO animals VALUES (8,'Angemon', '06-12-2005',1,true,-45);
INSERT INTO animals VALUES (9,'Boarmon', '06-07-2005',7,true,20.4);
INSERT INTO animals VALUES (10,'Blossom', '10-13-1998',3,true,17);
INSERT INTO animals VALUES (11,'Ditto', '05-14-2022',4,true,22);

--owners table:
INSERT INTO owners (full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES('Bob', 45);
INSERT INTO owners (full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES('Jodie Whittaker', 38);

--species table:
INSERT INTO species (name) VALUES('Pokemon'), ('Digimon');


ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(ID);

UPDATE animals SET species_id=2 WHERE name LIKE '%mon%';
UPDATE animals SET species_id=1 WHERE species_id IS NULL;

--Modify my inserted animals to include owner information:
ALTER TABLE animals ADD CONSTRAINT fk_owner FOREIGN KEY(owner_id) REFERENCES owners(ID);
UPDATE animals SET owner_id=1 WHERE name = 'Agumon';
UPDATE animals SET owner_id=2 WHERE name = 'Gabumon';
UPDATE animals SET owner_id=2 WHERE name = 'Pikachu';
UPDATE animals SET owner_id=3 WHERE name = 'Devimon';
UPDATE animals SET owner_id=3 WHERE name = 'Plantmon';
UPDATE animals SET owner_id=4 WHERE name = 'Charmander';
UPDATE animals SET owner_id=4 WHERE name = 'Squirtle';
UPDATE animals SET owner_id=4 WHERE name = 'Blossom';
UPDATE animals SET owner_id=5 WHERE name = 'Angemon';
UPDATE animals SET owner_id=5 WHERE name = 'Boarmon';


--Insert the following data for vets: 
INSERT INTO vets (name, age, date_of_graduation)VALUES
('William Tatcher',45, DATE '2000-04-23'),
('Maisy Smith',26, DATE '2019-01-17'),
('Stephanie Mendez',64, DATE '1981-05-04'),
('Jack Harkness',38, DATE '2008-06-08');

--nsert the following data for specialties:
INSERT INTO specializations
 VALUES(1,1),(1,3),(2,3),(2,4);

--Insert the following data for visits: 
INSERT INTO visits VALUES
(1,1,DATE '2020-05-24'),
(1,3,DATE '2020-07-22'),
(2,4,DATE '2021-02-02'),
(3,2,DATE '2020-01-05'),
(3,2,DATE '2020-03-08'),
(3,2,DATE '2020-05-14'),
(4,3,DATE '2021-05-04'),
(5,4,DATE '2021-02-24'),
(6,2,DATE '2019-12-21'),
(6,1,DATE '2020-08-10'),
(6,2,DATE '2021-04-07'),
(7,3,DATE '2019-09-29'),
(8,4,DATE '2020-10-03'),
(8,4,DATE '2020-11-04'),
(9,2,DATE '2019-01-24'),
(9,2,DATE '2019-05-15'),
(9,2,DATE '2020-02-27'),
(9,2,DATE '2020-08-03'),
(10,3,DATE '2020-05-24'),
(10,1,DATE '2021-01-11');



