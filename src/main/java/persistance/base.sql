CREATE DATABASE patient;

USE patient;

-- CREATE TABLE role (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     libelle VARCHAR(50)
-- );

-- CREATE TABLE users (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     idRole INT NOT NULL,
--     nom VARCHAR(50),
--     prenom VARCHAR(50),
--     email VARCHAR(50),
--     mdp VARCHAR(255),
--     telephone VARCHAR(50),
--     FOREIGN KEY (id_role) REFERENCES role(id)
-- );

CREATE TABLE etatCivil (
    id INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(50) NOT NULL
);

CREATE TABLE sexe (
    id INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(20) NOT NULL
);

CREATE TABLE patient (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    idEtatCivil INT,
    idSexe INT,
    FOREIGN KEY (idEtatCivil) REFERENCES etatCivil(id),
    FOREIGN KEY (idSexe) REFERENCES sexe(id)
);