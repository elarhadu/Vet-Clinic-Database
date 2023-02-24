CREATE TABLE animals (id UUID NOT NULL,name VARCHAR(255) NOT NULL,date_of_birth DATE,escape_attempts INT NOT NULL,neutered BOOLEAN,weight_kg FLOAT(2),PRIMARY KEY(id));

ALTER TABLE animals ADD COLUMN species VARCHAR;
