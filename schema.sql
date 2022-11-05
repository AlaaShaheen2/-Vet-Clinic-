/* Database schema to keep the structure of entire database. */
CREATE Database vet_clinic;

CREATE TABLE animals (
    ID INT PRIMARY KEY     NOT NULL,
    name varchar(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(5,2));

 ALTER TABLE animals
ADD species varchar(255);

 CREATE TABLE owners(
        ID INT GENERATED ALWAYS AS IDENTITY,
        full_name VARCHAR(150),
        age INT,
        PRIMARY KEY(ID));

CREATE TABLE species (
   ID INT GENERATED ALWAYS AS IDENTITY,
   name VARCHAR(150), 
   PRIMARY KEY(id));

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT REFERENCES species(ID);
ALTER TABLE animals ADD owner_id INT REFERENCES owners(ID);

--Create a table named vets:
CREATE TABLE vets( 
    id INT GENERATED ALWAYS AS IDENTITY, 
    name VARCHAR(150),
    age INT, 
    date_of_graduation DATE, 
    PRIMARY KEY (id));

--specializations table:
CREATE TABLE specializations(
    species_id INT,
    vets_id INT,
    PRIMARY KEY(species_id,vets_id),
    FOREIGN KEY (species_id) REFERENCES species(id),
    FOREIGN KEY(vets_id) REFERENCES vets(id));

--visits table:

    CREATE TABLE visits(
        animal_id INT,
        vets_id INT,
        date_of_visit DATE,
        PRIMARY KEY(animal_id,vets_id,date_of_visit),
        FOREIGN KEY (animal_id) REFERENCES animals(id),
        FOREIGN KEY (vets_id) REFERENCES vets(id));