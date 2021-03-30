-- Triggers de creation 
-- Trigger 1 :
-- Vérifier que la date prévisionnelle de début de projet est bien inférieur
-- à la date prévisionnelle de fin de projet.

CREATE FUNCTION check_dates() returns trigger as $trigger_dates_projet$
    begin
        if new."PROJETDEBUTPREVU" <= new."PROJETFINPREVU" then
            return new;
        else 
            raise exception 'La date previsionnelle de debut du projet doit etre inferieure
            a la date previsionnelle de fin du projet ';
        end if;
    end;
$trigger_dates_projet$ language plpgsql


create trigger trigger_dates_projet
    BEFORE INSERT OR UPDATE
    ON "PROJET"
    FOR EACH ROW
    EXECUTE PROCEDURE check_dates();

-- essai d'insert de projet :
insert into "PROJET" values (default, 3, 2, 1, 
'Jeu video pour etre un bon citoyen de Lavanville', 'jeu citoyen mairie', 'complet', '3', '1500',
 'Duree estimee a 1500 heures', NULL, '20/03/2018', '10/03/2018', '24/03/2018', '30/03/2018', 'Forfait',
  8000, '25/03/2018');

-- Trigger 2 :
-- Vérifier que la division du chiffres d'affaires par le nombres d'employes du client
-- ne soit pas superieur a 1 million.

CREATE FUNCTION check_employes() returns trigger as $trigger_nombre_employes$
    begin
        if (new."CLIENTCHIFFREAFFAIRES"/new."CLIENTEFFECTIF") <= 1000000 then
            return new;
        else 
            raise exception E'Le chiffre d\'affaires est trop eleve par rapport aux nombres d\'employes ';
        end if;
    end;
$trigger_nombre_employes$ language plpgsql


create trigger trigger_nombre_employes
    BEFORE INSERT OR UPDATE
    ON "CLIENT"
    FOR EACH ROW
    EXECUTE PROCEDURE check_employes();

-- essai insert de client :
insert into "CLIENT" values (default, 1, '1001 Bieres', 'Prive', '0412151519', 3000000, 2, 'Tres bons produits', 'Secondaire',
'56 Rue du Houblon 88000 Alecity');

-- Trigger de mise à jour :
-- Trigger 3:
-- Vérifier qu'un stagiaire/CDD/apprenti peut passer en cdi, mais pas l'inverse

CREATE FUNCTION check_contrat() returns trigger as $trigger_contrat_employes$
    begin
        if old."CONTRATTYPE" = 'Stagiaire' 
        or old."CONTRATTYPE" = 'CDD' 
        or old."CONTRATTYPE" = 'Apprenti' 
        and new."CONTRATTYPE" = 'CDI' or new."CONTRATTYPE" = 'CDD' then
            return new;
        else 
            raise exception 'Un salarié en CDI ne peut pas devenir stagiaire.';
        end if;
    end;
$trigger_contrat_employes$ language plpgsql


create trigger trigger_contrat_employes
    BEFORE UPDATE
    ON "CONTRAT"
    FOR EACH ROW
    EXECUTE PROCEDURE check_contrat();

-- essai update contrat:
update "CONTRAT" set "CONTRATTYPE" = 'Stagiaire' where "CONTRATID" = 7;

-- Trigger de suppression :
-- Trigger 4:
-- Supprimer un projet uniquement si sa date de fin réelle est supérieure à 2 mois
-- par rapport à la date du jour.

-- affichage des projets avec les dates debut/fin reelles:
select "PROJETID" as id, "PROJETCOURT" as nom_projet,"PROJETDEBUTREEL" as date_debut,
"PROJETFINREELLE" as date_fin, date_part('year', age("PROJETFINREELLE")) as annees, 
date_part('month', age("PROJETFINREELLE")) as mois from "PROJET" order by "PROJETID" asc;

-- function et trigger:
CREATE FUNCTION check_fin_projet() returns trigger as $trigger_suppression_projet$
    begin
        if date_part('month', age(old."PROJETFINREELLE")) <= 2 and date_part('year', age(old."PROJETFINREELLE")) = 0 then
            raise exception 'On ne peut pas supprimer un projet qui n est pas fini depuis plus de 2 mois';
        else 
            return old;
        end if;
    end;
$trigger_suppression_projet$ language plpgsql

drop function check_fin_projet(); 

create trigger trigger_suppression_projet
    BEFORE delete
    ON "PROJET"
    FOR EACH ROW
    EXECUTE PROCEDURE check_fin_projet();

drop trigger trigger_suppression_projet on "PROJET";    

delete from "PROJET" where "PROJETFINREELLE" is not null; -- ne marche pas
delete from "PROJET" where "PROJETID" = 1;
delete from "PROJET" where "PROJETID" = 2;
delete from "PROJET" where "PROJETID" = 12;