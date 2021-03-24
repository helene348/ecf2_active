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
as select p."PROJETID", p."PROJETCOURT", e."ETAPENOM", i."INTERVENTIONJOUR", i."INTERVENTIONFONCTIONCOLLAB",
c."COLLABID", c."COLLABNOM", c."COLLABPRENOM" from "PROJET" p
inner join "ETAPE" e on p."PROJETID" = e."PROJETID" 
inner join "INTERVENIR" i on e."ETAPEID" = i."ETAPEID"
inner join "COLLABORATEUR" c on i."COLLABID" = c."COLLABID"; 

select "COLLABNOM" as nom, "COLLABPRENOM" as prenom, "PROJETCOURT" as projet,
 "INTERVENTIONFONCTIONCOLLAB" as fontion_intervention,"INTERVENTIONJOUR" as date_intervention 
 from vue_fonction_collab_projet where "COLLABPRENOM" = 'Marie' order by "INTERVENTIONJOUR" asc;

-- Requête 3
-- Liste des projets en cours, par secteur d'activité à une date précise. 

