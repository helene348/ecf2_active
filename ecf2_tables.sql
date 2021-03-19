/*==============================================================*/
/* Nom de SGBD :  PostgreSQL 9.x                                */
/* Date de cr�ation :  19/03/2021 13:59:15                      */
/*==============================================================*/


/*==============================================================*/
/* Table : COMPLETER                                       */
/*==============================================================*/
create table "COMPLETER" (
   "COLLABID"             INT4                 not null,
   "PROJETID"             NUMERIC(4)           not null,
   constraint "PK_COMPLETER" primary key ("COLLABID", "PROJETID")
);


/*==============================================================*/
/* Table : UTILISER1                                       */
/*==============================================================*/
create table "UTILISER1"(
   "IDEID"                INT4                 not null,
   "PROJETID"             NUMERIC(4)           not null,
   constraint "PK_UTILISER1" primary key ("IDEID", "PROJETID")
);


/*==============================================================*/
/* Table : UTILISER5                                       */
/*==============================================================*/
create table "UTILISER5" (
   "PLATEFORMEID"         INT4                 not null,
   "PROJETID"             NUMERIC(4)           not null,
   constraint "PK_UTILISER5" primary key ("PLATEFORMEID", "PROJETID"));

/*==============================================================*/
/* Table : UTILISER3                                       */
/*==============================================================*/
create table "UTILISER3" (
   "PROJETID"             NUMERIC(4)           not null,
   "FRAMEWORDID"          INT4                 not null,
   constraint "PK_UTILISER3" primary key ("PROJETID", "FRAMEWORDID")
);

/*==============================================================*/
/* Table : UTILISER2                                       */
/*==============================================================*/
create table "UTILISER2" (
   "PROJETID"             NUMERIC(4)           not null,
   "LANGAGEID"            INT4                 not null,
   constraint "PK_UTILISER2" primary key ("PROJETID", "LANGAGEID")
);

/*==============================================================*/
/* Table : OCCUPER                                       */
/*==============================================================*/
create table "OCCUPER" (
   "COLLABID"             INT4                 not null,
   "FONCTIONID"           INT4                 not null,
   "FONCTIONDATEDEBUT"    DATE                 not null,
   "FONCTIONDATEFIN"      DATE                 null,
   constraint "PK_OCCUPER" primary key ("COLLABID", "FONCTIONID")
);


/*==============================================================*/
/* Table : ASSOCIER                                             */
/*==============================================================*/
create table "ASSOCIER" (
   "PROJETID"             NUMERIC(4)           not null,
   "DOCID"                INT4                 not null,
   constraint "PK_ASSOCIER" primary key ("PROJETID", "DOCID")
);

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table "CLIENT" (
   "CLIENTID"             SERIAL               not null,
   "SECTEURID"            INT4                 not null,
   "CLIENTRAISONSOCALE"   VARCHAR(100)         not null,
   "CLIENTDOMAINE"        VARCHAR(100)         not null,
   "CLIENTTYPE"           INT4                 not null,
   "CLIENTTELEPHONE"      VARCHAR(12)          not null,
   "CLIENTCHIFFREAFFAIRES" NUMERIC(7)           not null,
   "CLIENTEFFECTIF"       INT4                 not null,
   "CLIENTCOMMENTAIRES"   VARCHAR(100)         not null,
   "CLIENTNATURE"         VARCHAR(30)          not null,
   "CLIENTADRESSE"        VARCHAR(100)         not null,
   constraint "PK_CLIENT" primary key ("CLIENTID")
);

/*==============================================================*/
/* Table : COLLABORATEUR                                        */
/*==============================================================*/
create table "COLLABORATEUR" (
   "COLLABID"             SERIAL               not null,
   "COLLABNOM"            VARCHAR(30)          not null,
   "COLLABPRENOM"         VARCHAR(30)          not null,
   "COLLABSEXE"           CHAR(1)              not null,
   "COLLABCIVILITE"       VARCHAR(3)           not null,
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
   "CONTRATFONCTION"      VARCHAR(30)          not null,
   "CONTRATSALAIRE"       DECIMAL(6,2)         not null,
   constraint "PK_CONTRAT" primary key ("CONTRATID")
);

/*==============================================================*/
/* Table : DOCUMENT                                             */
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
/* Table : ETAPE                                                */
/*==============================================================*/
create table "ETAPE" (
   "ETAPEID"              NUMERIC(6)           not null,
   "PROJETID"             NUMERIC(4)           not null,
   "ETAPENUMERO"          SERIAL               not null,
   "ETAPENOM"             VARCHAR(40)          not null,
   "ETAPECHARGEPROD"      NUMERIC(6)           null,
   "ETAPECHARGEVALID"     NUMERIC(6)           null,
   "ETAPECHARGEESTIMEE"   NUMERIC(6)           not null,
   constraint "PK_ETAPE" primary key ("ETAPEID")
);


/*==============================================================*/
/* Table : FONCTION                                             */
/*==============================================================*/
create table "FONCTION" (
   "FONCTIONID"          SERIAL               not null,
   "FONCTIONNOM"          VARCHAR(30)          not null,
   constraint "PK_FONCTION" primary key ("FONCTIONID")
);


/*==============================================================*/
/* Table : FRAMEWORK                                            */
/*==============================================================*/
create table "FRAMEWORK" (
   "FRAMEWORDID"          SERIAL               not null,
   "FRAMEWORKNOM"         VARCHAR(30)          not null,
   constraint "PK_FRAMEWORK" primary key ("FRAMEWORDID")
);

/*==============================================================*/
/* Table : IDE                                                  */
/*==============================================================*/
create table "IDE" (
   "IDEID"                SERIAL               not null,
   "IDENOM"               VARCHAR(30)          not null,
   constraint "PK_IDE" primary key ("IDEID")
);


/*==============================================================*/
/* Table : INTERVENIR                                           */
/*==============================================================*/
create table "INTERVENIR" (
   "COLLABID"             INT4                 not null,
   "ETAPEID"              NUMERIC(6)           not null,
   "INTERVENTIONJOUR"     DATE                 not null,
   "INTERVENTIONFONCTIONCOLLAB" VARCHAR(30)          not null,
   "INTERVENTIONTYPE"     VARCHAR(30)          not null,
   constraint "PK_INTERVENIR" primary key ("COLLABID", "ETAPEID")
);

/*==============================================================*/
/* Table : LANGAGE                                              */
/*==============================================================*/
create table "LANGAGE" (
   "LANGAGEID"            SERIAL               not null,
   "LANGAGENOM"           VARCHAR(20)          not null,
   constraint "PK_LANGAGE" primary key ("LANGAGEID")
);

/*==============================================================*/
/* Table : OS                                                   */
/*==============================================================*/
create table "OS" (
   "OSID"                 SERIAL               not null,
   "OSNOM"                VARCHAR(30)          not null,
   constraint "PK_OS" primary key ("OSID")
);

/*==============================================================*/
/* Table : PLATEFORME                                           */
/*==============================================================*/
create table "PLATEFORME" (
   "PLATEFORMEID"         SERIAL               not null,
   "PLATEFORMENOM"        VARCHAR(30)          not null,
   constraint "PK_PLATEFORME" primary key ("PLATEFORMEID")
);


/*==============================================================*/
/* Table : PROJET                                               */
/*==============================================================*/
create table "PROJET" (
   "PROJETID"                    NUMERIC(4)           not null,
   "CLIENTID"                    INT4                 null,
   "OSID"                        INT4                 not null,
   "PROJETNUMERO"                SERIAL               not null,
   "PROJETLONG"                  VARCHAR(50)          not null,
   "PROJETCOURT"                 VARCHAR(10)          not null,
   "PROJETCYCLE"                 VARCHAR(20)          not null,
   "PROJETCOLLABMAX"             NUMERIC(8)           not null,
   "PROJETCHARGEESTIMEE"         NUMERIC(6)           not null,
   "PROJETREMARQUESESTIMATION"   VARCHAR(100)         not null,
   "PROJETCOMMENTAIRES"          VARCHAR(100)         null,
   "PROJETDEBUTPREVU"            DATE                 null,
   "PROJETFINPREVU"              DATE                 null,
   "PROJETDEBUTREEL"             DATE                 not null,
   "PROJETFINREELLE"             DATE                 null,
   "PROJETTYPE"                  VARCHAR(1)           not null,
   "PROJETNOMBRELIGNES"          INT4                 not null,
   "PROJETDATECREATION"          DATE                 not null,
   constraint "PK_PROJET" primary key ("PROJETID")
);

/*==============================================================*/
/* Table : SECTEUR                                              */
/*==============================================================*/
create table "SECTEUR" (
   "SECTEURID"            SERIAL               not null,
   "SECTEURNOM"           VARCHAR(30)          not null,
   constraint "PK_SECTEUR" primary key ("SECTEURID")
);

/*==============================================================*/
/* Table : SGBD                                                 */
/*==============================================================*/
create table "SGBD" (
   "SGBDID"               SERIAL               not null,
   "SGBDNOM"             VARCHAR(30)          not null,
   constraint "PK_SGBD" primary key ("SGBDID")
);

