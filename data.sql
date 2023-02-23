INSERT INTO animals(id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES
(gen_random_uuid(), 'Agumon', '2020-02-03', 10.23, TRUE, 0),
(gen_random_uuid(), 'Gabumon', '2018-11-15', 8.00, TRUE, 2),
(gen_random_uuid(), 'Pikachu', '2021-01-07', 15.04, FALSE, 1),
(gen_random_uuid(), 'Devimon', '2017-05-12', 11.00, TRUE, 5);