-- Requête 1
-- Moyenne des charges estimees des projets par secteur d'activités

CREATE view Vue_charges_secteur
as select p."PROJETCOURT" as nom_projet, p."PROJETCHARGEESTIMEE" as charges_estimees, s."SECTEURNOM"as secteur
from "PROJET"p 
inner join "CLIENT"c on p."CLIENTID" = c."CLIENTID"
inner join "SECTEUR"s on s."SECTEURID" = c."SECTEURID";

select avg(charges_estimees) as charge_moyenne, secteur from vue_charges_secteur group by secteur; 

-- Requête 2
-- Liste des projets (nom court) sur lequels un collaborateur 
-- est intervenu avec la/les fonction(s) qu'il occupait sur les différentes étapes du projet
create view Vue_fonction_collab_projet
as select p."PROJETID", p."PROJETCOURT", e."ETAPENOM", i."INTERVENTIONDATEDEBUT", i."INTERVENTIONDATEFIN", i."INTERVENTIONFONCTIONCOLLAB",
c."COLLABID", c."COLLABNOM", c."COLLABPRENOM" from "PROJET" p
inner join "ETAPE" e on p."PROJETID" = e."PROJETID" 
inner join "INTERVENIR" i on e."ETAPEID" = i."ETAPEID"
inner join "COLLABORATEUR" c on i."COLLABID" = c."COLLABID"; 

select "COLLABNOM" as nom, "COLLABPRENOM" as prenom, "PROJETCOURT" as projet,
 "INTERVENTIONFONCTIONCOLLAB" as fontion_intervention,"INTERVENTIONDATEDEBUT" as date_debut_intervention, 
 "INTERVENTIONDATEFIN" as date_fin_intervention
 from vue_fonction_collab_projet where "COLLABNOM" = 'Ross' order by "INTERVENTIONDATEDEBUT" asc;

 select "COLLABNOM" as nom, "COLLABPRENOM" as prenom, "PROJETCOURT" as projet,
 "INTERVENTIONFONCTIONCOLLAB" as fontion_intervention,"INTERVENTIONDATEDEBUT" as date_debut_intervention, 
 "INTERVENTIONDATEFIN" as date_fin_intervention
 from vue_fonction_collab_projet where "COLLABNOM" = 'Roussel' order by "INTERVENTIONDATEDEBUT" asc;

-- Requête 3
-- Liste des projets en cours, par secteur d'activité à la date du jour (aujourd'hui).
-- On veut aussi savoir le nombre de collaborateurs associés par fonction (donc combien de dev, combien d'analystes...)

create view Vue_projet_encours
as select p."PROJETCOURT", s."SECTEURNOM", p."PROJETDEBUTREEL", p."PROJETFINREELLE", co."COLLABNOM", co."COLLABPRENOM",
i."INTERVENTIONFONCTIONCOLLAB", i."INTERVENTIONDATEDEBUT", i."INTERVENTIONDATEFIN"
from "PROJET"p 
inner join "CLIENT"c on p."CLIENTID" = c."CLIENTID"
inner join "SECTEUR"s on s."SECTEURID" = c."SECTEURID"
inner join "ETAPE" e on p."PROJETID" = e."PROJETID"
inner join "INTERVENIR" i on e."ETAPEID" = i."ETAPEID"
inner join "COLLABORATEUR" co on i."COLLABID" = co."COLLABID";

select * from Vue_projet_encours;

select "PROJETCOURT" as projet,"SECTEURNOM" as secteur, "INTERVENTIONFONCTIONCOLLAB" as fonction, 
count("COLLABNOM") as nombre_collaborateurs from Vue_projet_encours where "PROJETFINREELLE" IS NULL 
group by "INTERVENTIONFONCTIONCOLLAB", "PROJETCOURT","SECTEURNOM", "PROJETFINREELLE" order by "PROJETCOURT" asc;

--Requête de mise à jour 1:
-- Augmentation du salaire de 5% pour tous les employés avec plus de 5 ans d'ancienneté

create view Vue_salaire_collab
as select c."COLLABNOM" as nom, c."COLLABPRENOM" as prenom, co."CONTRATSALAIRE" as salaire, 
co."CONTRATDATEDEBUT" as date_debut, co."CONTRATDATEFIN" as date_fin, 
extract(year from age(co."CONTRATDATEDEBUT")) as anciennete
from "COLLABORATEUR" c
inner join "CONTRAT" co on co."COLLABID" = c."COLLABID";

select * from Vue_salaire_collab order by salaire desc;

update "CONTRAT" set "CONTRATSALAIRE"=("CONTRATSALAIRE"*1.05) 
where extract(year from age("CONTRATDATEDEBUT")) >= 5 and "CONTRATDATEFIN" is null;

--Requête de mise à jour 2:
-- supprimer les projet terminés qui n'ont pas eu d'étapes associées