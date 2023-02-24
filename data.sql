INSERT INTO animals(id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES
(gen_random_uuid(), 'Agumon', '2020-02-03', 10.23, TRUE, 0),
(gen_random_uuid(), 'Gabumon', '2018-11-15', 8.00, TRUE, 2),
(gen_random_uuid(), 'Pikachu', '2021-01-07', 15.04, FALSE, 1),
(gen_random_uuid(), 'Devimon', '2017-05-12', 11.00, TRUE, 5),
(gen_random_uuid(), 'Charmander', '2020-02-08', -11.00, FALSE, 0),
(gen_random_uuid(), 'Plantmon', '2021-11-15', -5.7, TRUE, 2),
(gen_random_uuid(), 'Squirtle', '1993-04-02', -12.13, FALSE, 3),
(gen_random_uuid(), 'Angemon', '2005-06-12', -45, TRUE, 1),
(gen_random_uuid(), 'Boarmon', '2005-06-07', 20.4, TRUE, 7),
(gen_random_uuid(), 'Blossom', '1998-10-13', 17, TRUE, 3),
(gen_random_uuid(), 'Ditto', '2022-05-14', 22, TRUE, 4);


INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34),('Jennifer Orwell', 19),('Bob', 45),('Melody Pond', 77),('Dean Winchester', 14),('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'),('Digimon');

-- Modify your inserted animals so it includes the species_id value:
-- If the name ends in "mon" it will be Digimon
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';

-- All other animals are Pokemon
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;

-- Modify your inserted animals to include owner information (owner_id):
-- Sam Smith owns Agumon.
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';


-- Jennifer Orwell owns Gabumon and Pikachu
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name = 'Gabumon' OR name = 'Pikachu';


-- Bob owns Devimon and Plantmon.
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name = 'Devimon' OR name = 'Plantmon';


-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';


-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name = 'Angemon' OR name = 'Boarmon';