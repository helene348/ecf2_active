-- Procédure 1 :
-- Obtenir la moyenne des charges estimées sur les projets en cours

-- Ce calcul n’est pas réalisable avec une procédure stockée avec Postgre. Donc utilisation d’une fonction.

CREATE function moyennes_projets_encours() returns setof numeric
language plpgsql
AS $projets_encours$
begin
 	return query select avg("PROJETCHARGEESTIMEE") from "PROJET" where "PROJETFINREELLE" is null;
 	return;
end;$projets_encours$

DROP function moyennes_projets_encours;

select moyennes_projets_encours();

-- Procedure 2:
-- On veut obtenir sur un thème technique la liste des projets associés et terminés depuis plus de 2 ans.

-- changement des dates des projets 1 et 2:
Update "PROJET" set "PROJETFINREELLE" = '15/01/2018' where "PROJETID" = 1;
Update "PROJET" set "PROJETFINREELLE" = '02/03/2016', "PROJETDEBUTPREVU" = '01/02/2016', "PROJETFINPREVU" = '01/04/2016' where "PROJETID" = 2;

-- fonction avec un langage donné en parametre:
CREATE or replace function liste_projets_techniques(in i varchar)
returns table (
    PROJET_PROJETID int,
    PROJET_PROJETCOURT varchar
)
language plpgsql
AS $liste_projets$
begin
    return query select p."PROJETID", p."PROJETCOURT" from "PROJET"p 
    inner join "UTILISER2" u on u."PROJETID" = p."PROJETID" 
    inner join "LANGAGE" l on l."LANGAGEID" = u."LANGAGEID"
    where extract(year from age(p."PROJETFINREELLE")) > 2 and l."LANGAGENOM" = i;
end;
$liste_projets$

drop function liste_projets_techniques();

select liste_projets_techniques('PHP');

-- Procedure 3:
-- On veut obtenir la liste des interventions d'un collaborateur entre 2 dates avec le nom du collaborateur, sa fonction,
-- les dates de début et fin d'intervention et la tâche associée

CREATE or replace function liste_interventions(in a TIMESTAMP, b TIMESTAMP)
returns table (
    COLLABORATEUR_COLLABNOM varchar,
    COLLABORATEUR_COLLABPRENOM varchar,
    PROJET_PROJETCOURT varchar,
    ETAPE_ETAPENOM varchar,
    INTERVENIR_INTERVENTIONFONCTIONCOLLAB varchar,
    INTERVENIR_INTERVENTIONDATEDEBUT TIMESTAMP,
    INTERVENIR_INTERVENTIONDATEFIN TIMESTAMP
)
language plpgsql
AS $liste_inter$
begin
    return query select c."COLLABNOM", c."COLLABPRENOM", p."PROJETCOURT", e."ETAPENOM",
     i."INTERVENTIONFONCTIONCOLLAB", i."INTERVENTIONDATEDEBUT", i."INTERVENTIONDATEFIN"
    from "PROJET"p 
    inner join "ETAPE" e on e."PROJETID" = p."PROJETID" 
    inner join "INTERVENIR" i on i."ETAPEID" = e."ETAPEID"
    inner join "COLLABORATEUR" c on c."COLLABID" = i."COLLABID"
    where i."INTERVENTIONDATEDEBUT" >= a and i."INTERVENTIONDATEFIN" <= b;
end;
$liste_inter$

drop function liste_interventions();
DROP FUNCTION liste_interventions(timestamp without time zone,timestamp without time zone);

select * from liste_interventions('01/01/2020 08:00:00', '03/12/2020 17:00:00');

-- point ED11 (page 7 de l'enonce)
-- Créer une nouvelle fonction (avec un nouvel id) à partir d'une fonction existante 
-- (recopier tous les champs sauf ceux qui ne sont pas obligatoires)
-- insérer également les étapes correspondantes au projet

CREATE or replace function nv_projet(in a int)
returns void
language plpgsql
AS $nv_projet$
begin
    WITH p_key as (
        INSERT INTO "PROJET"("CLIENTID", "SGBDID", "OSID", "PROJETLONG", "PROJETCOURT", "PROJETCYCLE", 
        "PROJETCOLLABMAX", "PROJETCHARGEESTIMEE", "PROJETREMARQUESESTIMATION", "PROJETCOMMENTAIRES", 
        "PROJETDEBUTPREVU", "PROJETFINPREVU", "PROJETDEBUTREEL", "PROJETFINREELLE", "PROJETTYPE", 
        "PROJETNOMBRELIGNES", "PROJETDATECREATION")
        SELECT "CLIENTID", NULL, "OSID", "PROJETLONG", "PROJETCOURT", "PROJETCYCLE", "PROJETCOLLABMAX",
        "PROJETCHARGEESTIMEE", "PROJETREMARQUESESTIMATION", NULL, '01/01/2021', '31/12/2021', "PROJETDEBUTREEL", 
        NULL, "PROJETTYPE", "PROJETNOMBRELIGNES", "PROJETDATECREATION"
        FROM "PROJET"
        WHERE "PROJETID" = a
        RETURNING "PROJETID")
    INSERT INTO "ETAPE"("ETAPEID", "PROJETID", "ETAPENOM", "ETAPECHARGEPROD", "ETAPECHARGEVALID", "ETAPECHARGEESTIMEE")
    SELECT p_key."PROJETID", "ETAPENOM", NULL, NULL, 0
    from "ETAPE"
    WHERE "PROJETID" = a;
end;
$nv_projet$

select nv_projet(6);

select * from "PROJET";
select * from "ETAPE";