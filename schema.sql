/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT PRIMARY KEY NOT NULL, 
    name VARCHAR(100) NOT NULL, 
    date_of_birth DATE NOT NULL, 
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
  );
  
/* Add a column species of type string to the animals table */
ALTER TABLE animals 
    ADD species VARCHAR(255);

-- Owners table 
CREATE TABLE owners (
    id INT NOT NULL,
    full_name varchar(100),
    age INT
    PRIMARY KEY(owner_id)
);

-- Species table 
CREATE TABLE species (
    id INT NOT NULL,
    name varchar(100)
    PRIMARY KEY(species_id)
);

-- Remove column species
ALTER TABLE animals DROP species;

--Add column species_id which is a foreign key referencing species table
ALTER TABLE animals
  ADD species_id INT,
  ADD CONSTRAINT fk_species
  FOREIGN KEY (species_id)
  REFERENCES species (id);

--Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE owners
  ADD owner_id INT,
  ADD CONSTRAINT fk_owner
  FOREIGN KEY (owner_id)
  REFERENCES owners (id);
