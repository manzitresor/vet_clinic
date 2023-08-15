/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
    id INT PRIMARY KEY NOT NULL, 
    name VARCHAR(25) NOT NULL,
    date_of_birth Date NOT NULL, 
    escape_attempts INT NOT NULL, 
    neutered BOOLEAN NOT NULL, 
    weight_kg DECIMAL NOT NULL
    );
