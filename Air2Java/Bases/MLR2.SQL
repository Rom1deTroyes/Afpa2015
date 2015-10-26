-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                      Oracle Version 10g
--                        (23/12/2013 15:28:17)
-- -----------------------------------------------------------------------------
--      Nom de la base : MLR3
--      Projet : Air2Java
--      Auteur : Rom1
--      Date de dernière modification : 23/12/2013 15:27:21
-- -----------------------------------------------------------------------------

DROP TABLE LIEUX CASCADE CONSTRAINTS;

DROP TABLE FONCTION CASCADE CONSTRAINTS;

DROP TABLE GROUPES CASCADE CONSTRAINTS;

DROP TABLE PAYS CASCADE CONSTRAINTS;

DROP TABLE INSTUMENTS CASCADE CONSTRAINTS;

DROP TABLE SPECIALITE CASCADE CONSTRAINTS;

DROP TABLE OEUVRETYPES CASCADE CONSTRAINTS;

DROP TABLE LIEUXREPRESENTATION CASCADE CONSTRAINTS;

DROP TABLE RESPONSABILITE CASCADE CONSTRAINTS;

DROP TABLE OEUVRES CASCADE CONSTRAINTS;

DROP TABLE PROGRAMME CASCADE CONSTRAINTS;

DROP TABLE INDIVIDUS CASCADE CONSTRAINTS;

DROP TABLE RENCONTRES CASCADE CONSTRAINTS;

DROP TABLE REGIONS CASCADE CONSTRAINTS;

DROP TABLE JOUE_EN_TANT_QUE CASCADE CONSTRAINTS;

DROP TABLE REPRESENTE_PAYS CASCADE CONSTRAINTS;

DROP TABLE REPRESENTE_REGION CASCADE CONSTRAINTS;

DROP TABLE EST_AUTEUR CASCADE CONSTRAINTS;

DROP TABLE SE_COMPOSE_DE CASCADE CONSTRAINTS;

DROP TABLE JOUEE_EN_TANT_QUE CASCADE CONSTRAINTS;

DROP TABLE JOUE CASCADE CONSTRAINTS;

DROP TABLE SE_DEROULE CASCADE CONSTRAINTS;

DROP TABLE COMPOSE CASCADE CONSTRAINTS;

DROP TABLE EST_DE_TYPE CASCADE CONSTRAINTS;

-- -----------------------------------------------------------------------------
--       CREATION DE LA BASE 
-- -----------------------------------------------------------------------------

CREATE DATABASE MLR3;

-- -----------------------------------------------------------------------------
--       TABLE : LIEUX
-- -----------------------------------------------------------------------------

CREATE TABLE LIEUX
   (
    ID_LIEU NUMBER(2)  NOT NULL,
    LIEU_LABEL VARCHAR2(32)  NULL
,   CONSTRAINT PK_LIEUX PRIMARY KEY (ID_LIEU)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : FONCTION
-- -----------------------------------------------------------------------------

CREATE TABLE FONCTION
   (
    ID_FONCTION NUMBER(2)  NOT NULL,
    ID_GROUPE NUMBER(2)  NOT NULL,
    ID_INDIVIDU NUMBER(2)  NOT NULL,
    FONCTION_LABEL VARCHAR2(32)  NULL
,   CONSTRAINT PK_FONCTION PRIMARY KEY (ID_FONCTION)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE FONCTION
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_FONCTION_GROUPES
     ON FONCTION (ID_GROUPE ASC)
    ;

CREATE  INDEX I_FK_FONCTION_INDIVIDUS
     ON FONCTION (ID_INDIVIDU ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : GROUPES
-- -----------------------------------------------------------------------------

CREATE TABLE GROUPES
   (
    ID_GROUPE NUMBER(2)  NOT NULL,
    ID_INDIVIDU NUMBER(2)  NOT NULL,
    DENOMINATION VARCHAR2(32)  NULL,
    CARACTERISTIQUES VARCHAR2(32)  NULL
,   CONSTRAINT PK_GROUPES PRIMARY KEY (ID_GROUPE)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE GROUPES
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_GROUPES_INDIVIDUS
     ON GROUPES (ID_INDIVIDU ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : PAYS
-- -----------------------------------------------------------------------------

CREATE TABLE PAYS
   (
    ID_PAYS NUMBER(2)  NOT NULL,
    PAYS_LABEL VARCHAR2(32)  NULL
,   CONSTRAINT PK_PAYS PRIMARY KEY (ID_PAYS)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : INSTUMENTS
-- -----------------------------------------------------------------------------

CREATE TABLE INSTUMENTS
   (
    ID_INSTRUMENT NUMBER(2)  NOT NULL,
    NOM_INSTRUMENT VARCHAR2(32)  NULL
,   CONSTRAINT PK_INSTUMENTS PRIMARY KEY (ID_INSTRUMENT)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : SPECIALITE
-- -----------------------------------------------------------------------------

CREATE TABLE SPECIALITE
   (
    ID_SPECIALITE NUMBER(2)  NOT NULL,
    NOM_SPÉCIALITE VARCHAR2(32)  NULL
,   CONSTRAINT PK_SPECIALITE PRIMARY KEY (ID_SPECIALITE)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : OEUVRETYPES
-- -----------------------------------------------------------------------------

CREATE TABLE OEUVRETYPES
   (
    ID_TITRETYPE NUMBER(2)  NOT NULL,
    TITRETYPE_LABEL VARCHAR2(32)  NULL
,   CONSTRAINT PK_OEUVRETYPES PRIMARY KEY (ID_TITRETYPE)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : LIEUXREPRESENTATION
-- -----------------------------------------------------------------------------

CREATE TABLE LIEUXREPRESENTATION
   (
    ID_LIEUREPRESENTATION NUMBER(2)  NOT NULL,
    LIEUREPRESENTATION_LABEL VARCHAR2(32)  NULL
,   CONSTRAINT PK_LIEUXREPRESENTATION PRIMARY KEY (ID_LIEUREPRESENTATION)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : RESPONSABILITE
-- -----------------------------------------------------------------------------

CREATE TABLE RESPONSABILITE
   (
    ID_RESPONSABILITE NUMBER(2)  NOT NULL,
    ID_INDIVIDU NUMBER(2)  NOT NULL,
    ID_GROUPE NUMBER(2)  NOT NULL,
    RESPONSABILITE_LABEL VARCHAR2(32)  NULL
,   CONSTRAINT PK_RESPONSABILITE PRIMARY KEY (ID_RESPONSABILITE)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE RESPONSABILITE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_RESPONSABILITE_INDIVIDUS
     ON RESPONSABILITE (ID_INDIVIDU ASC)
    ;

CREATE  INDEX I_FK_RESPONSABILITE_GROUPES
     ON RESPONSABILITE (ID_GROUPE ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : OEUVRES
-- -----------------------------------------------------------------------------

CREATE TABLE OEUVRES
   (
    ID_OEUVRE NUMBER(32)  NOT NULL,
    TITRE_OEUVRE VARCHAR2(32)  NULL,
    DATE_APPARITION_OEUVRE DATE  NULL,
    DUREE_OEUVRE DATE  NULL
,   CONSTRAINT PK_OEUVRES PRIMARY KEY (ID_OEUVRE)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : PROGRAMME
-- -----------------------------------------------------------------------------

CREATE TABLE PROGRAMME
   (
    ID_PROGRAMME NUMBER(2)  NOT NULL,
    ID_GROUPE CHAR(32)  NOT NULL,
    ID_GROUPE_1 NUMBER(2)  NOT NULL,
    ID_RENCONTRE NUMBER(2)  NOT NULL,
    ID_LIEUREPRESENTATION NUMBER(2)  NOT NULL,
    DATE_PASSAGE CHAR(32)  NULL,
    HEURE_DÉBUT DATE  NULL,
    HEURE_FIN DATE  NULL
,   CONSTRAINT PK_PROGRAMME PRIMARY KEY (ID_PROGRAMME, ID_GROUPE)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE PROGRAMME
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_PROGRAMME_GROUPES
     ON PROGRAMME (ID_GROUPE_1 ASC)
    ;

CREATE  INDEX I_FK_PROGRAMME_RENCONTRES
     ON PROGRAMME (ID_RENCONTRE ASC)
    ;

CREATE  INDEX I_FK_PROGRAMME_LIEUXREPRESENTA
     ON PROGRAMME (ID_LIEUREPRESENTATION ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : INDIVIDUS
-- -----------------------------------------------------------------------------

CREATE TABLE INDIVIDUS
   (
    ID_INDIVIDU NUMBER(2)  NOT NULL,
    NOM VARCHAR2(32)  NULL,
    PRENOM VARCHAR2(32)  NULL,
    CIVILITE VARCHAR2(3)  NULL,
    ADRESSE CHAR(32)  NULL,
    TELEPHONE CHAR(32)  NULL,
    FAX CHAR(32)  NULL,
    EMAIL CHAR(32)  NULL,
    DATE_NAISSANCE DATE  NULL
,   CONSTRAINT PK_INDIVIDUS PRIMARY KEY (ID_INDIVIDU)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : RENCONTRES
-- -----------------------------------------------------------------------------

CREATE TABLE RENCONTRES
   (
    ID_RENCONTRE NUMBER(2)  NOT NULL,
    ID_INDIVIDU NUMBER(2)  NOT NULL,
    NOM VARCHAR2(32)  NULL,
    DATE_DEBUT DATE  NULL,
    DATE_FIN DATE  NULL,
    PERIODICITE DATE  NULL,
    NB_PERSONNES NUMBER(2)  NULL
,   CONSTRAINT PK_RENCONTRES PRIMARY KEY (ID_RENCONTRE)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE RENCONTRES
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_RENCONTRES_INDIVIDUS
     ON RENCONTRES (ID_INDIVIDU ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : REGIONS
-- -----------------------------------------------------------------------------

CREATE TABLE REGIONS
   (
    ID_REGION NUMBER(2)  NOT NULL,
    REGION_LABEL VARCHAR2(32)  NULL
,   CONSTRAINT PK_REGIONS PRIMARY KEY (ID_REGION)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : JOUE_EN_TANT_QUE
-- -----------------------------------------------------------------------------

CREATE TABLE JOUE_EN_TANT_QUE
   (
    ID_INDIVIDU NUMBER(2)  NOT NULL,
    ID_SPECIALITE NUMBER(2)  NOT NULL
,   CONSTRAINT PK_JOUE_EN_TANT_QUE PRIMARY KEY (ID_INDIVIDU, ID_SPECIALITE)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE JOUE_EN_TANT_QUE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_JOUE_EN_TANT_QUE_INDIVIDU
     ON JOUE_EN_TANT_QUE (ID_INDIVIDU ASC)
    ;

CREATE  INDEX I_FK_JOUE_EN_TANT_QUE_SPECIALI
     ON JOUE_EN_TANT_QUE (ID_SPECIALITE ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : REPRESENTE_PAYS
-- -----------------------------------------------------------------------------

CREATE TABLE REPRESENTE_PAYS
   (
    ID_GROUPE NUMBER(2)  NOT NULL,
    ID_PAYS NUMBER(2)  NOT NULL
,   CONSTRAINT PK_REPRESENTE_PAYS PRIMARY KEY (ID_GROUPE, ID_PAYS)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE REPRESENTE_PAYS
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_REPRESENTE_PAYS_GROUPES
     ON REPRESENTE_PAYS (ID_GROUPE ASC)
    ;

CREATE  INDEX I_FK_REPRESENTE_PAYS_PAYS
     ON REPRESENTE_PAYS (ID_PAYS ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : REPRESENTE_REGION
-- -----------------------------------------------------------------------------

CREATE TABLE REPRESENTE_REGION
   (
    ID_GROUPE NUMBER(2)  NOT NULL,
    ID_REGION NUMBER(2)  NOT NULL
,   CONSTRAINT PK_REPRESENTE_REGION PRIMARY KEY (ID_GROUPE, ID_REGION)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE REPRESENTE_REGION
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_REPRESENTE_REGION_GROUPES
     ON REPRESENTE_REGION (ID_GROUPE ASC)
    ;

CREATE  INDEX I_FK_REPRESENTE_REGION_REGIONS
     ON REPRESENTE_REGION (ID_REGION ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : EST_AUTEUR
-- -----------------------------------------------------------------------------

CREATE TABLE EST_AUTEUR
   (
    ID_INDIVIDU NUMBER(2)  NOT NULL,
    ID_OEUVRE NUMBER(32)  NOT NULL
,   CONSTRAINT PK_EST_AUTEUR PRIMARY KEY (ID_INDIVIDU, ID_OEUVRE)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE EST_AUTEUR
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_EST_AUTEUR_INDIVIDUS
     ON EST_AUTEUR (ID_INDIVIDU ASC)
    ;

CREATE  INDEX I_FK_EST_AUTEUR_OEUVRES
     ON EST_AUTEUR (ID_OEUVRE ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : SE_COMPOSE_DE
-- -----------------------------------------------------------------------------

CREATE TABLE SE_COMPOSE_DE
   (
    ID_OEUVRE NUMBER(32)  NOT NULL,
    ID_PROGRAMME NUMBER(2)  NOT NULL,
    ID_GROUPE CHAR(32)  NOT NULL,
    DUREE_PREVUE DATE  NULL
,   CONSTRAINT PK_SE_COMPOSE_DE PRIMARY KEY (ID_OEUVRE, ID_PROGRAMME, ID_GROUPE)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE SE_COMPOSE_DE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_SE_COMPOSE_DE_OEUVRES
     ON SE_COMPOSE_DE (ID_OEUVRE ASC)
    ;

CREATE  INDEX I_FK_SE_COMPOSE_DE_PROGRAMME
     ON SE_COMPOSE_DE (ID_PROGRAMME ASC, ID_GROUPE ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : JOUEE_EN_TANT_QUE
-- -----------------------------------------------------------------------------

CREATE TABLE JOUEE_EN_TANT_QUE
   (
    ID_SPECIALITE NUMBER(2)  NOT NULL,
    ID_INSTRUMENT NUMBER(2)  NOT NULL
,   CONSTRAINT PK_JOUEE_EN_TANT_QUE PRIMARY KEY (ID_SPECIALITE, ID_INSTRUMENT)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE JOUEE_EN_TANT_QUE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_JOUEE_EN_TANT_QUE_SPECIAL
     ON JOUEE_EN_TANT_QUE (ID_SPECIALITE ASC)
    ;

CREATE  INDEX I_FK_JOUEE_EN_TANT_QUE_INSTUME
     ON JOUEE_EN_TANT_QUE (ID_INSTRUMENT ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : JOUE
-- -----------------------------------------------------------------------------

CREATE TABLE JOUE
   (
    ID_GROUPE NUMBER(2)  NOT NULL,
    ID_OEUVRE NUMBER(32)  NOT NULL
,   CONSTRAINT PK_JOUE PRIMARY KEY (ID_GROUPE, ID_OEUVRE)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE JOUE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_JOUE_GROUPES
     ON JOUE (ID_GROUPE ASC)
    ;

CREATE  INDEX I_FK_JOUE_OEUVRES
     ON JOUE (ID_OEUVRE ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : SE_DEROULE
-- -----------------------------------------------------------------------------

CREATE TABLE SE_DEROULE
   (
    ID_RENCONTRE NUMBER(2)  NOT NULL,
    ID_LIEU NUMBER(2)  NOT NULL
,   CONSTRAINT PK_SE_DEROULE PRIMARY KEY (ID_RENCONTRE, ID_LIEU)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE SE_DEROULE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_SE_DEROULE_RENCONTRES
     ON SE_DEROULE (ID_RENCONTRE ASC)
    ;

CREATE  INDEX I_FK_SE_DEROULE_LIEUX
     ON SE_DEROULE (ID_LIEU ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : COMPOSE
-- -----------------------------------------------------------------------------

CREATE TABLE COMPOSE
   (
    ID_PAYS NUMBER(2)  NOT NULL,
    ID_REGION NUMBER(2)  NOT NULL
,   CONSTRAINT PK_COMPOSE PRIMARY KEY (ID_PAYS, ID_REGION)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE COMPOSE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_COMPOSE_PAYS
     ON COMPOSE (ID_PAYS ASC)
    ;

CREATE  INDEX I_FK_COMPOSE_REGIONS
     ON COMPOSE (ID_REGION ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : EST_DE_TYPE
-- -----------------------------------------------------------------------------

CREATE TABLE EST_DE_TYPE
   (
    ID_OEUVRE NUMBER(32)  NOT NULL,
    ID_TITRETYPE NUMBER(2)  NOT NULL
,   CONSTRAINT PK_EST_DE_TYPE PRIMARY KEY (ID_OEUVRE, ID_TITRETYPE)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE EST_DE_TYPE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_EST_DE_TYPE_OEUVRES
     ON EST_DE_TYPE (ID_OEUVRE ASC)
    ;

CREATE  INDEX I_FK_EST_DE_TYPE_OEUVRETYPES
     ON EST_DE_TYPE (ID_TITRETYPE ASC)
    ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE FONCTION ADD (
     CONSTRAINT FK_FONCTION_GROUPES
          FOREIGN KEY (ID_GROUPE)
               REFERENCES GROUPES (ID_GROUPE))   ;

ALTER TABLE FONCTION ADD (
     CONSTRAINT FK_FONCTION_INDIVIDUS
          FOREIGN KEY (ID_INDIVIDU)
               REFERENCES INDIVIDUS (ID_INDIVIDU))   ;

ALTER TABLE GROUPES ADD (
     CONSTRAINT FK_GROUPES_INDIVIDUS
          FOREIGN KEY (ID_INDIVIDU)
               REFERENCES INDIVIDUS (ID_INDIVIDU))   ;

ALTER TABLE RESPONSABILITE ADD (
     CONSTRAINT FK_RESPONSABILITE_INDIVIDUS
          FOREIGN KEY (ID_INDIVIDU)
               REFERENCES INDIVIDUS (ID_INDIVIDU))   ;

ALTER TABLE RESPONSABILITE ADD (
     CONSTRAINT FK_RESPONSABILITE_GROUPES
          FOREIGN KEY (ID_GROUPE)
               REFERENCES GROUPES (ID_GROUPE))   ;

ALTER TABLE PROGRAMME ADD (
     CONSTRAINT FK_PROGRAMME_GROUPES
          FOREIGN KEY (ID_GROUPE_1)
               REFERENCES GROUPES (ID_GROUPE))   ;

ALTER TABLE PROGRAMME ADD (
     CONSTRAINT FK_PROGRAMME_RENCONTRES
          FOREIGN KEY (ID_RENCONTRE)
               REFERENCES RENCONTRES (ID_RENCONTRE))   ;

ALTER TABLE PROGRAMME ADD (
     CONSTRAINT FK_PROGRAMME_LIEUXREPRESENTATI
          FOREIGN KEY (ID_LIEUREPRESENTATION)
               REFERENCES LIEUXREPRESENTATION (ID_LIEUREPRESENTATION))   ;

ALTER TABLE RENCONTRES ADD (
     CONSTRAINT FK_RENCONTRES_INDIVIDUS
          FOREIGN KEY (ID_INDIVIDU)
               REFERENCES INDIVIDUS (ID_INDIVIDU))   ;

ALTER TABLE JOUE_EN_TANT_QUE ADD (
     CONSTRAINT FK_JOUE_EN_TANT_QUE_INDIVIDUS
          FOREIGN KEY (ID_INDIVIDU)
               REFERENCES INDIVIDUS (ID_INDIVIDU))   ;

ALTER TABLE JOUE_EN_TANT_QUE ADD (
     CONSTRAINT FK_JOUE_EN_TANT_QUE_SPECIALITE
          FOREIGN KEY (ID_SPECIALITE)
               REFERENCES SPECIALITE (ID_SPECIALITE))   ;

ALTER TABLE REPRESENTE_PAYS ADD (
     CONSTRAINT FK_REPRESENTE_PAYS_GROUPES
          FOREIGN KEY (ID_GROUPE)
               REFERENCES GROUPES (ID_GROUPE))   ;

ALTER TABLE REPRESENTE_PAYS ADD (
     CONSTRAINT FK_REPRESENTE_PAYS_PAYS
          FOREIGN KEY (ID_PAYS)
               REFERENCES PAYS (ID_PAYS))   ;

ALTER TABLE REPRESENTE_REGION ADD (
     CONSTRAINT FK_REPRESENTE_REGION_GROUPES
          FOREIGN KEY (ID_GROUPE)
               REFERENCES GROUPES (ID_GROUPE))   ;

ALTER TABLE REPRESENTE_REGION ADD (
     CONSTRAINT FK_REPRESENTE_REGION_REGIONS
          FOREIGN KEY (ID_REGION)
               REFERENCES REGIONS (ID_REGION))   ;

ALTER TABLE EST_AUTEUR ADD (
     CONSTRAINT FK_EST_AUTEUR_INDIVIDUS
          FOREIGN KEY (ID_INDIVIDU)
               REFERENCES INDIVIDUS (ID_INDIVIDU))   ;

ALTER TABLE EST_AUTEUR ADD (
     CONSTRAINT FK_EST_AUTEUR_OEUVRES
          FOREIGN KEY (ID_OEUVRE)
               REFERENCES OEUVRES (ID_OEUVRE))   ;

ALTER TABLE SE_COMPOSE_DE ADD (
     CONSTRAINT FK_SE_COMPOSE_DE_OEUVRES
          FOREIGN KEY (ID_OEUVRE)
               REFERENCES OEUVRES (ID_OEUVRE))   ;

ALTER TABLE SE_COMPOSE_DE ADD (
     CONSTRAINT FK_SE_COMPOSE_DE_PROGRAMME
          FOREIGN KEY (ID_PROGRAMME, ID_GROUPE)
               REFERENCES PROGRAMME (ID_PROGRAMME, ID_GROUPE))   ;

ALTER TABLE JOUEE_EN_TANT_QUE ADD (
     CONSTRAINT FK_JOUEE_EN_TANT_QUE_SPECIALIT
          FOREIGN KEY (ID_SPECIALITE)
               REFERENCES SPECIALITE (ID_SPECIALITE))   ;

ALTER TABLE JOUEE_EN_TANT_QUE ADD (
     CONSTRAINT FK_JOUEE_EN_TANT_QUE_INSTUMENT
          FOREIGN KEY (ID_INSTRUMENT)
               REFERENCES INSTUMENTS (ID_INSTRUMENT))   ;

ALTER TABLE JOUE ADD (
     CONSTRAINT FK_JOUE_GROUPES
          FOREIGN KEY (ID_GROUPE)
               REFERENCES GROUPES (ID_GROUPE))   ;

ALTER TABLE JOUE ADD (
     CONSTRAINT FK_JOUE_OEUVRES
          FOREIGN KEY (ID_OEUVRE)
               REFERENCES OEUVRES (ID_OEUVRE))   ;

ALTER TABLE SE_DEROULE ADD (
     CONSTRAINT FK_SE_DEROULE_RENCONTRES
          FOREIGN KEY (ID_RENCONTRE)
               REFERENCES RENCONTRES (ID_RENCONTRE))   ;

ALTER TABLE SE_DEROULE ADD (
     CONSTRAINT FK_SE_DEROULE_LIEUX
          FOREIGN KEY (ID_LIEU)
               REFERENCES LIEUX (ID_LIEU))   ;

ALTER TABLE COMPOSE ADD (
     CONSTRAINT FK_COMPOSE_PAYS
          FOREIGN KEY (ID_PAYS)
               REFERENCES PAYS (ID_PAYS))   ;

ALTER TABLE COMPOSE ADD (
     CONSTRAINT FK_COMPOSE_REGIONS
          FOREIGN KEY (ID_REGION)
               REFERENCES REGIONS (ID_REGION))   ;

ALTER TABLE EST_DE_TYPE ADD (
     CONSTRAINT FK_EST_DE_TYPE_OEUVRES
          FOREIGN KEY (ID_OEUVRE)
               REFERENCES OEUVRES (ID_OEUVRE))   ;

ALTER TABLE EST_DE_TYPE ADD (
     CONSTRAINT FK_EST_DE_TYPE_OEUVRETYPES
          FOREIGN KEY (ID_TITRETYPE)
               REFERENCES OEUVRETYPES (ID_TITRETYPE))   ;


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------