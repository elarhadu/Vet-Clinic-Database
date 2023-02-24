CREATE TABLE animals (id UUID NOT NULL,name VARCHAR(255) NOT NULL,date_of_birth DATE,escape_attempts INT NOT NULL,neutered BOOLEAN,weight_kg FLOAT(2),PRIMARY KEY(id));

ALTER TABLE animals ADD COLUMN species VARCHAR;

-- Create a table named owners with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- full_name: string
-- age: integer

CREATE TABLE owners (id SERIAL PRIMARY KEY,full_name VARCHAR(255),age INT);

-- Create a table named species with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- name: string

CREATE TABLE species (id SERIAL PRIMARY KEY,name VARCHAR(255));


-- Remove the species column
ALTER TABLE animals DROP COLUMN species;


-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD CONSTRAINT foreign_key_species FOREIGN KEY (species_id) REFERENCES species(id);

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD owner_id INT;

ALTER TABLE animals ADD CONSTRAINT foreign_key_owners FOREIGN KEY (owner_id) REFERENCES owners(id);

