/* Database schema to keep the structure of entire database. */
CREATE Database vet_clinic;

CREATE TABLE animals (
    ID INT PRIMARY KEY     NOT NULL,
    name varchar(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(5,2));
 