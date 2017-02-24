DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS ownerships;

CREATE TABLE animals (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null,
  adoptable VARCHAR(255) not null,
  admission_date TIMESTAMP, 
  type VARCHAR(255) not null
);

CREATE TABLE owners (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null,
  experience VARCHAR(255) not null
);

CREATE TABLE ownerships (
  id SERIAL8 PRIMARY KEY,
  owner_id INT8 REFERENCES owners(id),
  animal_id INT8 REFERENCES animals(id)
);