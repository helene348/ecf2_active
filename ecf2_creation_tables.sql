/*==============================================================*/
/* Nom de "SGBD" :  PostgreSQL 9.x                                */
/* Date de cr�ation :  23/03/2021 10:31:20                      */
/*==============================================================*/


drop index "UTILISER1_FK";
drop index "COMPLETER_FK";
drop index "COMPLETER_PK";
drop table "COMPLETER";
drop index "UTILISER3_FK";
drop index "ASSOCIATION_18_FK";
drop index "UTILISER1_PK";
drop table "UTILISER1";
drop index "OCCUPER_FK";
drop index "UTILISER2_FK";
drop index "UTILISER3_PK";
drop table "UTILISER3";
drop index "ASSOCIATION_24_FK";
drop index "ASSOCIATION_23_FK";
drop index "UTILISER2_PK";
drop table "UTILISER2";
drop index "ASSOCIATION_26_FK";
drop index "ASSOCIATION_25_FK";
drop index "OCCUPER_PK";
drop table "OCCUPER";
drop index "ASSOCIER2_FK";
drop index "ASSOCIER_FK";
drop index "ASSOCIER_PK";
drop table "ASSOCIER";
drop index "ASSOCIATION_15_FK";
drop index "CLIENT_PK";
drop table "CLIENT";
drop index "COLLABORATEUR_PK";
drop table "COLLABORATEUR";
drop index "SIGNER_FK";
drop index "CONTRAT_PK";
drop table "CONTRAT";
drop index "DIFFUSER_FK";
drop index "DOCUMENT_PK";
drop table "DOCUMENT";
drop index "CONTENIR_FK";
drop index "ETAPE_PK";
drop table "ETAPE";
drop index "FRAMEWORK_PK";
drop table "FRAMEWORK";
drop index "IDE_PK";
drop table "IDE";
drop index "INTERVENIR2_FK";
drop index "INTERVENIR_FK";
drop index "INTERVENIR_PK";
drop table "INTERVENIR";
drop index "LANGAGE_PK";
drop table "LANGAGE";
drop index "OS_PK";
drop table "OS";
drop index "POSTE_PK";
drop table "POSTE";
drop index "ASSOCIATION_19_FK";
drop index "ASSOCIATION_16_FK";
drop index "COMMANDER_FK";
drop index "PROJET_PK";
drop table "PROJET" cascade;
drop index "SECTEUR_PK";
drop table "SECTEUR";
drop index "SGBD_PK";
drop table "SGBD";

/*==============================================================*/
/* Table : "COMPLETER"                                       */
/*==============================================================*/
create table "COMPLETER" (
   "COLLABID"             INT4                 not null,
   "PROJETID"             INT4                 not null,
   constraint "PK_COMPLETER" primary key ("COLLABID", "PROJETID")
);

/*==============================================================*/
/* Index : "COMPLETER"_PK                                    */
/*==============================================================*/
create unique index "COMPLETER_PK" on "COMPLETER" (
"COLLABID",
"PROJETID"
);

/*==============================================================*/
/* Index : "COMPLETER"_FK                                    */
/*==============================================================*/
create  index "COMPLETER_FK" on "COMPLETER" (
"COLLABID"
);

/*==============================================================*/
/* Index : "UTILISER1"_FK                                    */
/*==============================================================*/
create  index "UTILISER1_FK" on "COMPLETER" (
"PROJETID"
);

/*==============================================================*/
/* Table : "UTILISER1"                                       */
/*==============================================================*/
create table "UTILISER1" (
   "IDEID"                INT4                 not null,
   "PROJETID"             INT4                 not null,
   constraint "PK_UTILISER1" primary key ("IDEID", "PROJETID")
);

/*==============================================================*/
/* Index : "UTILISER1"_PK                                    */
/*==============================================================*/
create unique index "UTILISER1_PK" on "UTILISER1" (
"IDEID",
"PROJETID"
);

/*==============================================================*/
/* Index : ASSOCIATION_18_FK                                    */
/*==============================================================*/
create  index "ASSOCIATION_18_FK" on "UTILISER1" (
"IDEID"
);

/*==============================================================*/
/* Index : "UTILISER3"_FK                                    */
/*==============================================================*/
create  index "UTILISER3_FK" on "UTILISER1" (
"PROJETID"
);

/*==============================================================*/
/* Table : "UTILISER3"                                       */
/*==============================================================*/
create table "UTILISER3" (
   "PROJETID"             INT4                 not null,
   "FRAMEWORDID"          INT4                 not null,
   constraint "PK_UTILISER3" primary key ("PROJETID", "FRAMEWORDID")
);

/*==============================================================*/
/* Index : "UTILISER3"_PK                                    */
/*==============================================================*/
create unique index "UTILISER3_PK" on "UTILISER3" (
"PROJETID",
"FRAMEWORDID"
);

/*==============================================================*/
/* Index : "UTILISER2"_FK                                    */
/*==============================================================*/
create  index "UTILISER2_FK" on "UTILISER3" (
"PROJETID"
);

/*==============================================================*/
/* Index : "OCCUPER"_FK                                    */
/*==============================================================*/
create  index "OCCUPER_FK" on "UTILISER3" (
"FRAMEWORDID"
);

/*==============================================================*/
/* Table : "UTILISER2"                                       */
/*==============================================================*/
create table "UTILISER2" (
   "PROJETID"             INT4                 not null,
   "LANGAGEID"            INT4                 not null,
   constraint "PK_UTILISER2" primary key ("PROJETID", "LANGAGEID")
);

/*==============================================================*/
/* Index : "UTILISER2"_PK                                    */
/*==============================================================*/
create unique index "UTILISER2_PK" on "UTILISER2" (
"PROJETID",
"LANGAGEID"
);

/*==============================================================*/
/* Index : ASSOCIATION_23_FK                                    */
/*==============================================================*/
create  index "ASSOCIATION_23_FK" on "UTILISER2" (
"PROJETID"
);

/*==============================================================*/
/* Index : ASSOCIATION_24_FK                                    */
/*==============================================================*/
create  index "ASSOCIATION_24_FK" on "UTILISER2" (
"LANGAGEID"
);

/*==============================================================*/
/* Table : "OCCUPER"                                       */
/*==============================================================*/
create table "OCCUPER" (
   "COLLABID"             INT4                 not null,
   "POSTEID"              INT4                 not null,
   "FONCTIONDATEDEBUT"    DATE                 not null,
   "FONCTIONDATEFIN"      DATE                 null,
   constraint "PK_OCCUPER" primary key ("COLLABID", "POSTEID")
);

/*==============================================================*/
/* Index : "OCCUPER"_PK                                    */
/*==============================================================*/
create unique index "OCCUPER_PK" on "OCCUPER" (
"COLLABID",
"POSTEID"
);

/*==============================================================*/
/* Index : ASSOCIATION_25_FK                                    */
/*==============================================================*/
create  index "ASSOCIATION_25_FK" on "OCCUPER" (
"COLLABID"
);

/*==============================================================*/
/* Index : ASSOCIATION_26_FK                                    */
/*==============================================================*/
create  index "ASSOCIATION_26_FK" on "OCCUPER" (
"POSTEID"
);

/*==============================================================*/
/* Table : "ASSOCIER"                                             */
/*==============================================================*/
create table "ASSOCIER" (
   "PROJETID"             INT4                 not null,
   "DOCID"                INT4                 not null,
   constraint "PK_ASSOCIER" primary key ("PROJETID", "DOCID")
);

/*==============================================================*/
/* Index : "ASSOCIER"_PK                                          */
/*==============================================================*/
create unique index "ASSOCIER_PK" on "ASSOCIER" (
"PROJETID",
"DOCID"
);

/*==============================================================*/
/* Index : "ASSOCIER"_FK                                          */
/*==============================================================*/
create  index "ASSOCIER_FK" on "ASSOCIER" (
"PROJETID"
);

/*==============================================================*/
/* Index : "ASSOCIER"2_FK                                         */
/*==============================================================*/
create  index "ASSOCIER_FK" on "ASSOCIER" (
"DOCID"
);

/*==============================================================*/
/* Table : "CLIENT"                                               */
/*==============================================================*/
create table "CLIENT" (
   "CLIENTID"             SERIAL               not null,
   "SECTEURID"            INT4                 not null,
   "CLIENTRAISONSOCALE"   VARCHAR(100)         not null,
   "CLIENTTYPE"           VARCHAR(15)          not null
      constraint "CKC_CLIENTTYPE_CLIENT" check ("CLIENTTYPE" in ('Priv�','Public')),
   "CLIENTTELEPHONE"      VARCHAR(12)          not null,
   "CLIENTCHIFFREAFFAIRES" NUMERIC(7)           not null,
   "CLIENTEFFECTIF"       INT4                 not null
      constraint "CKC_CLIENTEFFECTIF_CLIENT" check ("CLIENTEFFECTIF" >= 0),
   "CLIENTCOMMENTAIRES"   VARCHAR(100)         not null,
   "CLIENTNATURE"         VARCHAR(30)          not null,
   "CLIENTADRESSE"        VARCHAR(100)         not null,
   constraint "PK_CLIENT" primary key ("CLIENTID")
);

/*==============================================================*/
/* Index : CLIENT_PK                                            */
/*==============================================================*/
create unique index "CLIENT_PK" on "CLIENT" (
"CLIENTID"
);

/*==============================================================*/
/* Index : ASSOCIATION_15_FK                                    */
/*==============================================================*/
create  index "ASSOCIATION_15_FK" on "CLIENT" (
"SECTEURID"
);

/*==============================================================*/
/* Table : "COLLABORATEUR"                                        */
/*==============================================================*/
create table "COLLABORATEUR" (
   "COLLABID"             SERIAL               not null,
   "COLLABNOM"            VARCHAR(30)          not null,
   "COLLABPRENOM"         VARCHAR(30)          not null,
   "COLLABSEXE"           CHAR(1)              not null
      constraint "CKC_COLLABSEXE_COLLABOR" check ("COLLABSEXE" in ('F','M')),
   "COLLABCIVILITE"       VARCHAR(3)           not null
      constraint "CKC_COLLABCIVILITE_COLLABOR" check ("COLLABCIVILITE" in ('MME','MR')),
   "COLLABTELEPHONE"      VARCHAR(12)          not null,
   "COLLABADRESSE"        VARCHAR(100)         not null,
   constraint "PK_COLLABORATEUR" primary key ("COLLABID")
);

/*==============================================================*/
/* Index : COLLABORATEUR_PK                                     */
/*==============================================================*/
create unique index "COLLABORATEUR_PK" on "COLLABORATEUR" (
"COLLABID"
);

/*==============================================================*/
/* Table : CONTRAT                                              */
/*==============================================================*/
create table "CONTRAT" (
   "CONTRATID"            SERIAL               not null,
   "COLLABID"             INT4                 not null,
   "CONTRATTYPE"          VARCHAR(15)          not null,
   "CONTRATDATEDEBUT"     DATE                 not null,
   "CONTRATDATEFIN"       DATE                 null,
   "CONTRATSALAIRE"       DECIMAL(6,2)         not null,
   constraint "PK_CONTRAT" primary key ("CONTRATID")
);

/*==============================================================*/
/* Index : CONTRAT_PK                                           */
/*==============================================================*/
create unique index "CONTRAT_PK" on "CONTRAT" (
"CONTRATID"
);

/*==============================================================*/
/* Index : SIGNER_FK                                            */
/*==============================================================*/
create  index "SIGNER_FK" on "CONTRAT" (
"COLLABID"
);

/*==============================================================*/
/* Table : "DOCUMENT"                                             */
/*==============================================================*/
create table "DOCUMENT" (
   "DOCID"                SERIAL               not null,
   "COLLABID"             INT4                 not null,
   "DOCTITRE"             VARCHAR(100)         not null,
   "DOCRESUME"            VARCHAR(100)         not null,
   "DOCDATEDIFFUSION"     DATE                 not null,
   constraint "PK_DOCUMENT" primary key ("DOCID")
);

/*==============================================================*/
/* Index : "DOCUMENT_PK"                                          */
/*==============================================================*/
create unique index "DOCUMENT_PK" on "DOCUMENT" (
"DOCID"
);

/*==============================================================*/
/* Index : "DIFFUSER_FK"                                          */
/*==============================================================*/
create  index "DIFFUSER_FK" on "DOCUMENT" (
"COLLABID"
);

/*==============================================================*/
/* Table : "ETAPE"                                                */
/*==============================================================*/
create table "ETAPE" (
   "ETAPEID"              SERIAL               not null,
   "PROJETID"             INT4                 not null,
   "ETAPENOM"             VARCHAR(40)          not null,
   "ETAPECHARGEPROD"      NUMERIC(6)           null,
   "ETAPECHARGEVALID"     NUMERIC(6)           null,
   "ETAPECHARGEESTIMEE"   NUMERIC(6)           not null,
   constraint "PK_ETAPE" primary key ("ETAPEID")
);

/*==============================================================*/
/* Index : "ETAPE_PK"                                             */
/*==============================================================*/
create unique index "ETAPE_PK" on "ETAPE" (
"ETAPEID"
);

/*==============================================================*/
/* Index : "CONTENIR_FK"                                          */
/*==============================================================*/
create  index "CONTENIR_FK" on "ETAPE" (
"PROJETID"
);

/*==============================================================*/
/* Table : "FRAMEWORK"                                            */
/*==============================================================*/
create table "FRAMEWORK" (
   "FRAMEWORDID"          SERIAL               not null,
   "FRAMEWORKNOM"         VARCHAR(30)          not null,
   constraint "PK_FRAMEWORK" primary key ("FRAMEWORDID")
);

/*==============================================================*/
/* Index : "FRAMEWORK_PK"                                         */
/*==============================================================*/
create unique index "FRAMEWORK_PK" on "FRAMEWORK" (
"FRAMEWORDID"
);

/*==============================================================*/
/* Table : "IDE"                                                  */
/*==============================================================*/
create table "IDE" (
   "IDEID"                SERIAL               not null,
   "IDENOM"               VARCHAR(30)          not null,
   constraint "PK_IDE" primary key ("IDEID")
);

/*==============================================================*/
/* Index : "IDE_PK"                                               */
/*==============================================================*/
create unique index "IDE_PK" on "IDE" (
"IDEID"
);

/*==============================================================*/
/* Table : "INTERVENIR"                                           */
/*==============================================================*/
create table "INTERVENIR" (
   "COLLABID"             INT4                 not null,
   "ETAPEID"              INT4                 not null,
   "INTERVENTIONJOUR"     DATE                 not null,
   "INTERVENTIONFONCTIONCOLLAB" VARCHAR(30)          not null,
   constraint "PK_INTERVENIR" primary key ("COLLABID", "ETAPEID")
);

/*==============================================================*/
/* Index : "INTERVENIR_PK"                                        */
/*==============================================================*/
create unique index "INTERVENIR_PK" on "INTERVENIR" (
"COLLABID",
"ETAPEID"
);

/*==============================================================*/
/* Index : INTERVENIR_FK                                        */
/*==============================================================*/
create  index "INTERVENIR_FK" on "INTERVENIR" (
"COLLABID"
);

/*==============================================================*/
/* Index : INTERVENIR2_FK                                       */
/*==============================================================*/
create  index "INTERVENIR2_FK" on "INTERVENIR" (
"ETAPEID"
);

/*==============================================================*/
/* Table : "LANGAGE"                                              */
/*==============================================================*/
create table "LANGAGE" (
   "LANGAGEID"            SERIAL               not null,
   "LANGAGENOM"           VARCHAR(20)          not null,
   constraint "PK_LANGAGE" primary key ("LANGAGEID")
);

/*==============================================================*/
/* Index : "LANGAGE_PK"                                           */
/*==============================================================*/
create unique index "LANGAGE_PK" on "LANGAGE" (
"LANGAGEID"
);

/*==============================================================*/
/* Table : "OS"                                                   */
/*==============================================================*/
create table "OS" (
   "OSID"                 SERIAL               not null,
   "OSNOM"                VARCHAR(30)          not null,
   constraint "PK_OS" primary key ("OSID")
);

/*==============================================================*/
/* Index : "OS_PK"                                                */
/*==============================================================*/
create unique index "OS_PK" on "OS" (
"OSID"
);

/*==============================================================*/
/* Table : "POSTE"                                                */
/*==============================================================*/
create table "POSTE" (
   "POSTEID"              SERIAL               not null,
   "POSTENOM"             VARCHAR(30)          not null,
   constraint "PK_POSTE" primary key ("POSTEID")
);

/*==============================================================*/
/* Index : "POSTE_PK"                                             */
/*==============================================================*/
create unique index "POSTE_PK" on "POSTE" (
"POSTEID"
);

/*==============================================================*/
/* Table : "PROJET"                                               */
/*==============================================================*/
create table "PROJET" (
   "PROJETID"             SERIAL               not null,
   "CLIENTID"             INT4                 not null,
   "SGBDID"               INT4                 null,
   "OSID"                 INT4                 not null,
   "PROJETLONG"           VARCHAR(70)          not null,
   "PROJETCOURT"          VARCHAR(20)          not null,
   "PROJETCYCLE"          VARCHAR(20)          not null,
   "PROJETCOLLABMAX"      NUMERIC(8)           not null,
   "PROJETCHARGEESTIMEE"  NUMERIC(6)           not null,
   "PROJETREMARQUESESTIMATION" VARCHAR(100)         not null,
   "PROJETCOMMENTAIRES"   VARCHAR(100)         null,
   "PROJETDEBUTPREVU"     DATE                 null,
   "PROJETFINPREVU"       DATE                 null,
   "PROJETDEBUTREEL"      DATE                 not null,
   "PROJETFINREELLE"      DATE                 null,
   "PROJETTYPE"           VARCHAR(25)          not null
      constraint "CKC_PROJETTYPE_PROJET" check ("PROJETTYPE" in ('Forfait','Assistance','Regie')),
   "PROJETNOMBRELIGNES"   INT4                 not null,
   "PROJETDATECREATION"   DATE                 not null,
   constraint "PK_PROJET" primary key ("PROJETID")
);

/*==============================================================*/
/* Index : "PROJET_PK"                                            */
/*==============================================================*/
create unique index "PROJET_PK" on "PROJET" (
"PROJETID"
);

/*==============================================================*/
/* Index : "COMMANDER_FK"                                         */
/*==============================================================*/
create  index "COMMANDER_FK" on "PROJET" (
"CLIENTID"
);

/*==============================================================*/
/* Index : "ASSOCIATION_16_FK"                                    */
/*==============================================================*/
create  index "ASSOCIATION_16_FK" on "PROJET" (
"OSID"
);

/*==============================================================*/
/* Index : "ASSOCIATION_19_FK"                                    */
/*==============================================================*/
create  index "ASSOCIATION_19_FK" on "PROJET" (
"SGBDID"
);

/*==============================================================*/
/* Table : "SECTEUR"                                              */
/*==============================================================*/
create table "SECTEUR" (
   "SECTEURID"            SERIAL               not null,
   "SECTEURNOM"           VARCHAR(30)          not null,
   constraint "PK_SECTEUR" primary key ("SECTEURID")
);

/*==============================================================*/
/* Index : "SECTEUR_PK"                                           */
/*==============================================================*/
create unique index "SECTEUR_PK" on "SECTEUR" (
"SECTEURID"
);

/*==============================================================*/
/* Table : "SGBD"                                                 */
/*==============================================================*/
create table "SGBD" (
   "SGBDID"               SERIAL               not null,
   "SGBDNOM"              VARCHAR(30)          not null,
   constraint "PK_SGBD" primary key ("SGBDID")
);

/*==============================================================*/
/* Index : "SGBD_PK"                                              */
/*==============================================================*/
create unique index "SGBD_PK" on "SGBD" (
"SGBDID"
);

alter table "COMPLETER"
   add constraint "FK_ASSOCIAT_ASSOCIATI_COLLABOR" foreign key ("COLLABID")
      references "COLLABORATEUR" ("COLLABID")
      on delete restrict on update restrict;

alter table "COMPLETER"
   add constraint "FK_ASSOCIAT_ASSOCIATI_PROJET" foreign key ("PROJETID")
      references "PROJET" ("PROJETID")
      on delete restrict on update restrict;

alter table "UTILISER1"
   add constraint "FK_ASSOCIAT_ASSOCIATI_IDE" foreign key ("IDEID")
      references "IDE" ("IDEID")
      on delete restrict on update restrict;

alter table "UTILISER1"
   add constraint "FK_ASSOCIAT_ASSOCIATI_PROJET" foreign key ("PROJETID")
      references "PROJET" ("PROJETID")
      on delete restrict on update restrict;

alter table "UTILISER3"
   add constraint "FK_ASSOCIAT_ASSOCIATI_PROJET" foreign key ("PROJETID")
      references "PROJET" ("PROJETID")
      on delete restrict on update restrict;

alter table "UTILISER3"
   add constraint "FK_ASSOCIAT_ASSOCIATI_FRAMEWOR" foreign key ("FRAMEWORDID")
      references "FRAMEWORK" ("FRAMEWORDID")
      on delete restrict on update restrict;

alter table "UTILISER2"
   add constraint "FK_ASSOCIAT_ASSOCIATI_PROJET" foreign key ("PROJETID")
      references "PROJET" ("PROJETID")
      on delete restrict on update restrict;

alter table "UTILISER2"
   add constraint "FK_ASSOCIAT_ASSOCIATI_LANGAGE" foreign key ("LANGAGEID")
      references "LANGAGE" ("LANGAGEID")
      on delete restrict on update restrict;

alter table "OCCUPER"
   add constraint "FK_ASSOCIAT_ASSOCIATI_COLLABOR" foreign key ("COLLABID")
      references "COLLABORATEUR" ("COLLABID")
      on delete restrict on update restrict;

alter table "OCCUPER"
   add constraint "FK_ASSOCIAT_ASSOCIATI_POSTE" foreign key ("POSTEID")
      references "POSTE" ("POSTEID")
      on delete restrict on update restrict;

alter table "ASSOCIER"
   add constraint "FK_ASSOCIER_ASSOCIER_PROJET" foreign key ("PROJETID")
      references "PROJET" ("PROJETID")
      on delete restrict on update restrict;

alter table "ASSOCIER"
   add constraint "FK_ASSOCIER_ASSOCIER2_DOCUMENT" foreign key ("DOCID")
      references "DOCUMENT" ("DOCID")
      on delete restrict on update restrict;

alter table "CLIENT"
   add constraint "FK_CLIENT_ASSOCIATI_SECTEUR" foreign key ("SECTEURID")
      references "SECTEUR" ("SECTEURID")
      on delete restrict on update restrict;

alter table "CONTRAT"
   add constraint "FK_CONTRAT_SIGNER_COLLABOR" foreign key ("COLLABID")
      references "COLLABORATEUR" ("COLLABID")
      on delete restrict on update restrict;

alter table "DOCUMENT"
   add constraint "FK_DOCUMENT_DIFFUSER_COLLABOR" foreign key ("COLLABID")
      references "COLLABORATEUR" ("COLLABID")
      on delete restrict on update restrict;

alter table "ETAPE"
   add constraint "FK_ETAPE_CONTENIR_PROJET" foreign key ("PROJETID")
      references "PROJET" ("PROJETID")
      on delete restrict on update restrict;

alter table "INTERVENIR"
   add constraint "FK_INTERVEN_INTERVENI_COLLABOR" foreign key ("COLLABID")
      references "COLLABORATEUR" ("COLLABID")
      on delete restrict on update restrict;

alter table "INTERVENIR"
   add constraint "FK_INTERVEN_INTERVENI_ETAPE" foreign key ("ETAPEID")
      references "ETAPE" ("ETAPEID")
      on delete restrict on update restrict;

alter table "PROJET"
   add constraint "FK_PROJET_ASSOCIATI_OS" foreign key ("OSID")
      references "OS" ("OSID")
      on delete restrict on update restrict;

alter table "PROJET"
   add constraint "FK_PROJET_ASSOCIATI_SGBD" foreign key ("SGBDID")
      references "SGBD" ("SGBDID")
      on delete restrict on update restrict;

alter table "PROJET"
   add constraint "FK_PROJET_COMMANDER_CLIENT" foreign key ("CLIENTID")
      references "CLIENT" ("CLIENTID")
      on delete restrict on update restrict;

