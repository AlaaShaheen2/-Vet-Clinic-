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