-- insert sans clés étrangères
insert into "COLLABORATEUR" values (default, 'Martin', 'Julie', 'F', 'MME', '0329874523','10 rue des Ecoles 54000 Nancy');
insert into "COLLABORATEUR" values (default, 'Leclerc', 'Florian', 'M', 'MR', '0329689865',' 15 Boulevard Marie Curie 67000 Strasbourg');
insert into "COLLABORATEUR" values (default, 'Grenot', 'Samuel', 'M', 'MR', '0155421689','115 Avenue Henri Martin 750000 Paris');
insert into "COLLABORATEUR" values (default,'Roussel', 'Helene','F', 'MME', '0688421515', '60 rue des Peupliers 88000 Epinal');
insert into "COLLABORATEUR" values (default, 'Zuliani', 'Marie', 'F', 'MME', '0656898956','88 Avenue des Poneys Bleus 57000 Metz');
insert into "COLLABORATEUR" values (default, 'Ross', 'Bob', 'M', 'MR', '0125659874','8 Place du Nord 95000 Paris');

insert into "POSTE" values (default, 'Directeur general');
insert into "POSTE" values (default, 'Responsable RH');
insert into "POSTE" values (default, 'Responsable commercial');
insert into "POSTE" values (default, 'Secretariat administratif');
insert into "POSTE" values (default, 'Chef de projet');
insert into "POSTE" values (default, 'Analyste');
insert into "POSTE" values (default, 'Developpeur');
insert into "POSTE" values (default, 'Secretariat technique');
insert into "POSTE" values (default, 'Technicien support');
insert into "POSTE" values (default, 'Commercial');


insert into "FRAMEWORK" values (default, 'Node');
insert into "FRAMEWORK" values (default, 'React');
insert into "FRAMEWORK" values (default, 'Angular');
insert into "FRAMEWORK" values (default, 'Swing');
insert into "FRAMEWORK" values (default, 'Symfony');
insert into "FRAMEWORK" values (default, 'Vue');
insert into "FRAMEWORK" values (default, 'JavaFX');
insert into "FRAMEWORK" values (default, '.NET');

insert into "IDE" values (default, 'IntelliJ');
insert into "IDE" values (default, 'Netbeans');
insert into "IDE" values (default, 'Eclipse');

insert into "LANGAGE" values (default, 'JAVA');
insert into "LANGAGE" values (default, 'JavaScript');
insert into "LANGAGE" values (default, 'C++');
insert into "LANGAGE" values (default, 'C#');
insert into "LANGAGE" values (default, 'PHP');
insert into "LANGAGE" values (default, 'html');
insert into "LANGAGE" values (default, 'CSS');

insert into "OS" values (default, 'Windows');
insert into "OS" values (default, 'Linux');
insert into "OS" values (default, 'Apple');

insert into "SGBD" values (default, 'PostGreSQL');
insert into "SGBD" values (default, 'MySQL');
insert into "SGBD" values (default, 'Microsoft SQL Server');

insert into "SECTEUR" values (default, 'Agro-alimentaire');
insert into "SECTEUR" values (default, 'Pharmaceutique');
insert into "SECTEUR" values (default, 'Bancaire');
insert into "SECTEUR" values (default, 'Loisirs');
insert into "SECTEUR" values (default, 'Institutions publiques');

-- tout est inséré (sans clé étrangères)
-- insert avec clés étrangères

-- document est dépendant de collaborateur
insert into "DOCUMENT" values (default, 2, 'La gestion de projet',
 'Document expliquant le fonctionnement de la gestion de projet (planification des taches et roles)',
 '18/11/2016');
 insert into "DOCUMENT" values (default, 2, 'Referentiel Qualite',
 'Document expliquant les normes à respecter ainsi que les tests à mettre en place',
 '11/03/2018');

-- contrat est dépendant de collaborateur
insert into "CONTRAT" values (default, 2, 'CDI', '25/04/2015', NULL, 2000.00);
insert into "CONTRAT" values (default, 3, 'CDD', '02/02/2021', NULL, 2500.50);
insert into "CONTRAT" values (default, 3, 'CDD', '08/12/2019', '01/12/2020', 2300.00);
insert into "CONTRAT" values (default, 4, 'Apprenti', '15/09/2020', '15/09/2022', 800.00);
insert into "CONTRAT" values (default, 5, 'Stagiaire', '12/07/2020', '15/11/2020', 300.00);
insert into "CONTRAT" values (default, 6, 'CDI', '02/01/2020', NULL, 2200);
insert into "CONTRAT" values (default, 7, 'CDI', '15/01/2016', NULL, 2300.50);

-- occuper est dépendant de collaborateur et poste
insert into "OCCUPER" values (2, 1, '25/04/2015', NULL);
insert into "OCCUPER" values (3, 9, '05/02/2021', NULL);
insert into "OCCUPER" values (3, 9, '08/12/2020', '20/11/2020');
insert into "OCCUPER" values (4, 5, '15/09/2020', '15/09/2022');
insert into "OCCUPER" values (5, 7, '12/07/2020', '15/11/2020');
insert into "OCCUPER" values (6, 6, '02/01/2020', NULL);
insert into "OCCUPER" values (7, 7, '15/01/2016', NULL);


 -- client est dépendant de secteur
insert into "CLIENT" values (default, 1, '1001 Bieres', 'Prive', '0412151519', 150000, 3, 'Tres bons produits', 'Secondaire',
'56 Rue du Houblon 88000 Alecity');
insert into "CLIENT" values (default, 3, 'La banque magique', 'Prive', '0856565656', 1150000, 45, 'Magiquement bien', 'Principale',
'100 rue des Dollars Thunesville');
insert into "CLIENT" values (default, 5, 'Mairie de Lavanville', 'Public', '0101010101', 300000, 8, 'Rien a dire', 'Ancienne',
'110 rue des Lilas 54800 Lavanville');
insert into "CLIENT" values (default, 1, '4 Epices', 'Prive', '0201054556', 15000, 1, 'Commentaire', 'Secondaire',
'1 Rue du sel 84400 PepperCity');


-- projet est dépendant de client, sgbd, os
insert into "PROJET" values (default, 1, 1, 1, 
E'Site d e-commerce pour l\'entreprise 1001 Bieres', 'site internet biere', 'complet', '3', '30',
 E'Duree estimee a une trentaire d\' heures', NULL,  '10/08/2020', '10/09/2020', '15/08/2020', '20/09/2020', 'Assistance',
  1500, '11/08/2020');

insert into "PROJET" values (default, 4, 3, 2, 
'Application desktop de gestion des produits', 'appli gestion epices', 'complet', '4', '80',
 'Duree estimee a moins de 100 heures', NULL, NULL, NULL, '04/07/2020', '15/09/2020', 'Forfait',
  3000, '01/07/2020');

insert into "PROJET" values (default, 2, 2, 1, 
'Application mobile pour clients de la banque', 'appli mobile banque', 'complet', '6', '200',
 'Duree estimee a 200 heures', NULL, NULL, NULL, '18/10/2020', '25/01/2021', 'Forfait',
  5000, '15/10/2020');

-- etape est dépendant de projet
insert into "ETAPE" values (default, 1, 'Conception', 2, 3, 4);
insert into "ETAPE" values (default, 1, 'Programmation', 10, 12, 15);
insert into "ETAPE" values (default, 1, 'Tests unitaires', 3, 12, 15);
insert into "ETAPE" values (default, 2, 'Conception', NULL, NULL, 30);
insert into "ETAPE" values (default, 2, 'Programmation', 24, 25, 20);
insert into "ETAPE" values (default, 2, 'Installation', NULL, 35, 30);
insert into "ETAPE" values (default, 3, 'Analyse', NULL, NULL, 20);
insert into "ETAPE" values (default, 3, 'Programmation', NULL, NULL, 120);
insert into "ETAPE" values (default, 3, 'Base de données', NULL, NULL, 50);

-- intervenir est dépendant de étape, projet et collaborateur
insert into "INTERVENIR" values (5, 10, '16/08/2020', 'Webdesigner');
insert into "INTERVENIR" values (5, 11, '25/08/2020', 'Developpeur Front');
insert into "INTERVENIR" values (3, 12, '31/08/2020', 'Testeur Qualité');

insert into "INTERVENIR" values (6, 13, '16/07/2020', 'Webdesigner');
insert into "INTERVENIR" values (5, 14, '18/08/2020', 'Developpeur Front');;
insert into "INTERVENIR" values (3, 14, '31/08/2020', 'Developpeur Back');
insert into "INTERVENIR" values (6, 15, '01/09/2020', 'Technicien support');

insert into "INTERVENIR" values (6, 16, '25/10/2020', 'Analyste');
insert into "INTERVENIR" values (5, 17, '28/10/2020', 'Developpeur Front');
insert into "INTERVENIR" values (7, 17, '02/01/2020', 'Developpeur Back');
insert into "INTERVENIR" values (3, 18, '22/12/2020', 'Developpeur base de donnees');


--associer est dépendant de document et projet
insert into "ASSOCIER" values (1, 5);
insert into "ASSOCIER" values (1, 6);
insert into "ASSOCIER" values (2, 5);
insert into "ASSOCIER" values (2, 6);
insert into "ASSOCIER" values (3, 5);
insert into "ASSOCIER" values (3, 6);

--compléter est dépendant de collaborateur et projet
insert into "COMPLETER" values (4, 1);
insert into "COMPLETER" values (4, 2);
insert into "COMPLETER" values (4, 3);

-- utiliser1 est dépendant de ide et projet
insert into "UTILISER1" values (1, 1);
insert into "UTILISER1" values (2, 1);
insert into "UTILISER1" values (3, 1);

-- utiliser2 est dépendant de langage et projet
insert into "UTILISER2" values (1, 2);
insert into "UTILISER2" values (1, 5);
insert into "UTILISER2" values (1, 6);
insert into "UTILISER2" values (1, 7);
insert into "UTILISER2" values (2, 1);
insert into "UTILISER2" values (2, 5);
insert into "UTILISER2" values (3, 4);
insert into "UTILISER2" values (3, 3);

-- utiliser3 est dépendant de framework et projet
insert into "UTILISER3" values (1, 2);
insert into "UTILISER3" values (1, 5);
insert into "UTILISER3" values (2, 7);
insert into "UTILISER3" values (3, 8);

