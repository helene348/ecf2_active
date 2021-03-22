-- insert sans clés étrangères
insert into "COLLABORATEUR" values (default, 'Martin', 'Julie', 'F', 'MME', '0329874523','10 rue des Ecoles 54000 Nancy');
insert into "COLLABORATEUR" values (default, 'Leclerc', 'Florian', 'M', 'MR', '0329689865',' 15 Boulevard Marie Curie 67000 Strasbourg');
insert into "COLLABORATEUR" values (default, 'Grenot', 'Samuel', 'M', 'MR', '0155421689','115 Avenue Henri Martin 750000 Paris');
insert into "COLLABORATEUR" values (default,'Roussel', 'Helene','F', 'MME', '0688421515', '60 rue des Peupliers 88000 Epinal');

insert into "FONCTION" values (default, 'Directeur general');
insert into "FONCTION" values (default, 'Responsable RH');
insert into "FONCTION" values (default, 'Responsable commercial');
insert into "FONCTION" values (default, 'Secretariat administratif');
insert into "FONCTION" values (default, 'Chef de projet');
insert into "FONCTION" values (default, 'Analyste');
insert into "FONCTION" values (default, 'Developpeur');
insert into "FONCTION" values (default, 'Secretariat technique');
insert into "FONCTION" values (default, 'Technicien support');
insert into "FONCTION" values (default, 'Commercial');


insert into "FRAMEWORK" values (default, 'Node');
insert into "FRAMEWORK" values (default, 'React');
insert into "FRAMEWORK" values (default, 'Angular');
insert into "FRAMEWORK" values (default, 'Swing');
insert into "FRAMEWORK" values (default, 'Symfony');
insert into "FRAMEWORK" values (default, 'Vue');
insert into "FRAMEWORK" values (default, 'JavaFX');

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

insert into "SECTEUR" values (default, 'Agro-alimentaire');
insert into "SECTEUR" values (default, 'Pharmaceutique');
insert into "SECTEUR" values (default, 'Bancaire');
insert into "SECTEUR" values (default, 'Vente');
insert into "SECTEUR" values (default, 'Institutions publiques');


-- insert avec clés étrangères

-- document est dépendant de collaborateur
insert into "DOCUMENT" values (default, 1, 'La gestion de projet',
 'Document expliquant le fonctionnement de la gestion de projet en informatique avec la planification des tâches et les rôles de chacun (sprint, backlog)',
 '18/11/2016');
 insert into "DOCUMENT" values (default, 1, 'Referentiel Qualité',
 'Document expliquant les normes à respecter pour chaque projet ainsi que les tests à mettre en place',
 '11/03/2018');

-- contrat est dépendant de collaborateur
insert into "CONTRAT" values (default, 1, 'CDI', '25/04/2015', NULL, 2000.00);
insert into "CONTRAT" values (default, 2, 'Consultant', '02/02/2021', NULL, 2500.50);
insert into "CONTRAT" values (default, 2, 'Consultant', '08/12/2019', '01/12/2020', 2300.00);
insert into "CONTRAT" values (default, 3, 'Apprenti', '15/09/2020', '15/09/2022', 800.00);
insert into "CONTRAT" values (default, 4, 'Stagiaire', '12/07/2020', '15/11/2020', 300.00);

-- occuper est dépendant de collaborateur et poste
insert into "OCCUPER" values (1, 1);
insert into "OCCUPER" values (2, 9);
insert into "OCCUPER" values (3, 5);
insert into "OCCUPER" values (4, 7);


 -- client est dépendant de secteur
insert into "CLIENT" values (default, 1, '1001 Bières', 'Privé', '0412151519', 150 000, 3, 'Très bons produits', 'Secondaire',
'56 Rue du Houblon 88000 Alecity');
insert into "CLIENT" values (default, 3, 'La banque magique', 'Privé', '0856565656', 1 150 000, 45, 'Magiquement bien', 'Principale',
'100 rue des Dollars Thunesville');
insert into "CLIENT" values (default, 5, 'Mairie de Lavanville', 'Public', '0101010101', 300 000, 8, NULL, 'Ancienne',
'110 rue des Lilas 54800 Lavanville');


-- projet est dépendant de client, sgbd, os
insert into "PROJET" values (default, 1, 1, 
'Réalisation d un site d e-commerce pour l entreprise 1001 Bières', 'site e-commerce vente bière', 'complet', '3', '30',
 'Durée estimée à une trentaire d heures', NULL,  '10/08/2020', '10/09/2020', '15/08/2020', '20/09/2020', 'assistance', 1500, '11/08/2020');

-- etape est dépendant de projet
insert into "ETAPE" values (default, 1, 'Conception', 2, 3, 4);
insert into "ETAPE" values (default, 1, 'Programmation', 10, 12, 15);
insert into "ETAPE" values (default, 1, 'Tests unitaires', 3, 12, 15);


-- intervenir est dépendant de étape, projet et collaborateur
insert into "INTERVENIR" values (4, 2, '25/08/2020', 'Développeur Front');
insert into "INTERVENIR" values (2, 1, '18/08/2020', 'Testeur Qualité');

--associer est dépendant de document et projet
insert into "ASSOCIER" values (1, 1);
insert into "ASSOCIER" values (1, 2);

--compléter est dépendant de collaborateur et projet
insert into "COMPLETER" values (3, 1);

-- utiliser1 est dépendant de ide et projet
insert into "UTILISER1" values (1, 1);

-- utiliser2 est dépendant de langage et projet
insert into "UTILISER2" values (1, 2);
insert into "UTILISER2" values (1, 5);
insert into "UTILISER2" values (1, 6);
insert into "UTILISER2" values (1, 7);

-- utiliser1 est dépendant de framework et projet
insert into "UTILISER2" values (1, 2);
insert into "UTILISER2" values (1, 5);

