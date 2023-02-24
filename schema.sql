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

-- Create a table named vets with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- name: string
-- age: integer
-- date_of_graduation: date

CREATE TABLE vets (id SERIAL PRIMARY KEY,name VARCHAR(255), age INT, date_of_graduation DATE );

-- There is a many-to-many relationship between the tables species and vets: a vet can specialize in multiple species, and a species can have multiple vets specialized in it.
--  Create a "join table" called specializations to handle this relationship.

CREATE TABLE specializations (vet_id INTEGER REFERENCES vets(id),species_id INTEGER REFERENCES species(id),PRIMARY KEY (vet_id, species_id));

-- VISITS TABLE
CREATE TABLE visits (id SERIAL PRIMARY KEY,animal_id UUID REFERENCES animals(id),vet_id INTEGER REFERENCES vets(id),visit_date DATE);
