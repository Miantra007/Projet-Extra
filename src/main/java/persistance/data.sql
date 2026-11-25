INSERT INTO
    etatCivil (libelle)
VALUES
    ('Célibataire'),
    ('Marié(e)'),
    ('Divorcé(e)'),
    ('Veuf / Veuve');

INSERT INTO
    sexe (libelle)
VALUES
    ('M'),
    ('F');

INSERT INTO
    patient (nom, prenom, idEtatCivil, idSexe)
VALUES
    ('Rakoto', 'Jean', 1, 1),
    ('Rabe', 'Marie', 2, 2),
    ('Randria', 'Paul', 1, 1),
    ('Razanakoto', 'Sarah', 2, 2),
    ('Andria', 'Hery', 3, 1),
    ('Rasoa', 'Lina', 4, 2),
    ('Rakotomalala', 'Michel', 1, 1),
    ('Ravaka', 'Anna', 3, 2),
    ('Rajaonarivelo', 'David', 2, 1),
    ('Rasolofoniaina', 'Julie', 1, 2);