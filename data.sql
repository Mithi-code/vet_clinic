/* Populate database with sample data. */

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES (
        1, 
        'Agumon',
        '2020-02-03',
        0,
        TRUE,
        10.23
);

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES (
    2, 
    'Gabumon',
    '2018-11-15',
    2,
    TRUE,
    8
);

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    3,
    'Pikachu',
    '2021-01-7',
    1,
    FALSE,
    15.08
);

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    4,
    'Devimon',
    '2017-05-12',
    5,
    TRUE,
    11
);

/*Inserting new data to table*/

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES (
        5, 
        'Charmander',
        '2020-02-08',
        0,
        FALSE,
        11
);

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES (
    6, 
    'Plantmon',
    '2022-11-15',
    2,
    TRUE,
    5.7
);

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    7,
    'Squirtle',
    '1993-04-02',
    3,
    FALSE,
    12.13
);

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    8,
    'Angemon',
    '2005-06-12',
    1,
    TRUE,
    45
);

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    9,
    'Boarmon',
    '2005-06-07',
    7,
    TRUE,
    20.4
);

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    10,
    'Blossom',
    '1998-10-13',
    3,
    TRUE,
    17
);

-- Inserting data into owners table
INSERT INTO owners(owner_id,full_name,age) VALUES (1,'sam smith',34);
INSERT INTO owners(owner_id,full_name,age) VALUES (2,'Jennifer Orwell',19);
INSERT INTO owners(owner_id,full_name,age) VALUES (3,'Bob',45);
INSERT INTO owners(owner_id,full_name,age) VALUES (4,'Melody Pond',77);
INSERT INTO owners(owner_id,full_name,age) VALUES (5,'Dean Winchester',14);
INSERT INTO owners(owner_id,full_name,age) VALUES (6,'Jodie Whittaker',38);

-- Inserting daat into Species table
INSERT INTO species(species_id,name) VALUES (1,'pokemon');
INSERT INTO species(species_id,name) VALUES (2,'Digimon'

-- Modify your inserted animals to include owner information (owner_id):
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id IS NULL;

UPDATE animals 
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals 
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals 
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals 
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals 
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');


/* Start a transaction and update the animals 
   table by setting the species column to unspecified.
*/
BEGIN TRANSACTION; -- start transaction

UPDATE animals SET species = 'unspecified';

--verify the changes were made
SELECT * FROM animals;

--rollback changes made to species
ROLLBACK TRANSACTION;

/* Start a transaction and update the animals 
   table by setting species column
*/
BEGIN TRANSACTION;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

COMMIT TRANSACTION;

SELECT name, species FROM animals;

/* Start a transaction and delete 
   all records in the animals table
*/
BEGIN TRANSACTION;

DELETE FROM animals;

ROLLBACK TRANSACTION;

-- start and run multiple transactions on the animals table
BEGIN TRANSACTION;

DELETE FROM animals WHERE date_of_birth > 'Jan 1, 2022';

SAVE TRANSACTION first_deleted_transaction;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TRANSACTION first_deleted_transaction;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT TRANSACTION;