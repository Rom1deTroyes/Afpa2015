-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                      Oracle Version 10g
--                        (2/1/2014 14:14:09)
-- -----------------------------------------------------------------------------
--      Nom de la base : MLR4
--      Projet : Air2Java
--      Auteur : Rom1
--      Date de dernière modification : 2/1/2014 14:13:07
-- -----------------------------------------------------------------------------

DROP TABLE LIEUX CASCADE CONSTRAINTS;

DROP TABLE GROUPES CASCADE CONSTRAINTS;

DROP TABLE ADRESSETYPES CASCADE CONSTRAINTS;

DROP TABLE PAYS CASCADE CONSTRAINTS;

DROP TABLE CIVILITES CASCADE CONSTRAINTS;

DROP TABLE EMAILS CASCADE CONSTRAINTS;

DROP TABLE ADRESSES CASCADE CONSTRAINTS;

DROP TABLE TELEPHONES CASCADE CONSTRAINTS;

DROP TABLE SPECIALITES CASCADE CONSTRAINTS;

DROP TABLE FONCTIONS CASCADE CONSTRAINTS;

DROP TABLE OEUVRETYPES CASCADE CONSTRAINTS;

DROP TABLE LIEUXREPRESENTATION CASCADE CONSTRAINTS;

DROP TABLE INSTRUMENTS CASCADE CONSTRAINTS;

DROP TABLE OEUVRES CASCADE CONSTRAINTS;

DROP TABLE TELEPHONETYPES CASCADE CONSTRAINTS;

DROP TABLE PROGRAMME CASCADE CONSTRAINTS;

DROP TABLE INDIVIDUS CASCADE CONSTRAINTS;

DROP TABLE RESPONSABILITES CASCADE CONSTRAINTS;

DROP TABLE RENCONTRES CASCADE CONSTRAINTS;

DROP TABLE REGIONS CASCADE CONSTRAINTS;

DROP TABLE JOUE_EN_TANT_QUE CASCADE CONSTRAINTS;

DROP TABLE A_POUR_ADRESSE CASCADE CONSTRAINTS;

DROP TABLE REPRESENTE_PAYS CASCADE CONSTRAINTS;

DROP TABLE A_POUR_TEL CASCADE CONSTRAINTS;

DROP TABLE REPRESENTE_REGION CASCADE CONSTRAINTS;

DROP TABLE EST_RESPONSABLE CASCADE CONSTRAINTS;

DROP TABLE A_POUR_EMAIL CASCADE CONSTRAINTS;

DROP TABLE EST_AUTEUR CASCADE CONSTRAINTS;

DROP TABLE EST_MEMBRE CASCADE CONSTRAINTS;

DROP TABLE SE_COMPOSE_DE CASCADE CONSTRAINTS;

DROP TABLE JOUE CASCADE CONSTRAINTS;

DROP TABLE SE_DEROULE CASCADE CONSTRAINTS;

DROP TABLE COMPOSE CASCADE CONSTRAINTS;

DROP TABLE EST_DE_TYPE CASCADE CONSTRAINTS;

-- -----------------------------------------------------------------------------
--       CREATION DE LA BASE 
-- -----------------------------------------------------------------------------

CREATE DATABASE MLR4;

-- -----------------------------------------------------------------------------
--       TABLE : LIEUX
-- -----------------------------------------------------------------------------

CREATE TABLE LIEUX
   (
    ID_LIEU NUMBER(2)  NOT NULL,
    ID_ADRESSE NUMBER(2)  NOT NULL,
    LIEU_LABEL VARCHAR2(32)  NULL
,   CONSTRAINT PK_LIEUX PRIMARY KEY (ID_LIEU)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE LIEUX
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_LIEUX_ADRESSES
     ON LIEUX (ID_ADRESSE ASC)
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
--       TABLE : ADRESSETYPES
-- -----------------------------------------------------------------------------

CREATE TABLE ADRESSETYPES
   (
    ID_ADRESSETYPE NUMBER(2)  NOT NULL,
    ADRESSETYPE_LABEL VARCHAR2(12)  NULL
,   CONSTRAINT PK_ADRESSETYPES PRIMARY KEY (ID_ADRESSETYPE)  
   ) ;

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
--       TABLE : CIVILITES
-- -----------------------------------------------------------------------------

CREATE TABLE CIVILITES
   (
    ID_CIVILITE NUMBER(2)  NOT NULL,
    CIVILITE_ABRV VARCHAR2(5)  NULL,
    CIVILITE_LABEL VARCHAR2(128)  NULL
,   CONSTRAINT PK_CIVILITES PRIMARY KEY (ID_CIVILITE)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : EMAILS
-- -----------------------------------------------------------------------------

CREATE TABLE EMAILS
   (
    ID_EMAIL NUMBER(2)  NOT NULL,
    EMAIL_LABEL VARCHAR2(128)  NULL
,   CONSTRAINT PK_EMAILS PRIMARY KEY (ID_EMAIL)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : ADRESSES
-- -----------------------------------------------------------------------------

CREATE TABLE ADRESSES
   (
    ID_ADRESSE NUMBER(2)  NOT NULL,
    ADR_LABEL VARCHAR2(128)  NULL,
    ADR_CP VARCHAR2(12)  NULL,
    ADR_VILLE VARCHAR2(128)  NULL,
    ADR_PAYS CHAR(32)  NULL
,   CONSTRAINT PK_ADRESSES PRIMARY KEY (ID_ADRESSE)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : TELEPHONES
-- -----------------------------------------------------------------------------

CREATE TABLE TELEPHONES
   (
    ID_TELEPHONE NUMBER(2)  NOT NULL,
    NUM_TELEPHONE VARCHAR2(15)  NULL
,   CONSTRAINT PK_TELEPHONES PRIMARY KEY (ID_TELEPHONE)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : SPECIALITES
-- -----------------------------------------------------------------------------

CREATE TABLE SPECIALITES
   (
    ID_SPECIALITE NUMBER(2)  NOT NULL,
    SPECIALITE_LABEL VARCHAR2(32)  NULL
,   CONSTRAINT PK_SPECIALITES PRIMARY KEY (ID_SPECIALITE)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : FONCTIONS
-- -----------------------------------------------------------------------------

CREATE TABLE FONCTIONS
   (
    ID_FONCTION NUMBER(2)  NOT NULL,
    FONCTION_LABEL VARCHAR2(32)  NULL
,   CONSTRAINT PK_FONCTIONS PRIMARY KEY (ID_FONCTION)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : OEUVRETYPES
-- -----------------------------------------------------------------------------

CREATE TABLE OEUVRETYPES
   (
    ID_OEUVRETYPE NUMBER(2)  NOT NULL,
    OEUVRETYPE_LABEL VARCHAR2(32)  NULL
,   CONSTRAINT PK_OEUVRETYPES PRIMARY KEY (ID_OEUVRETYPE)  
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
--       TABLE : INSTRUMENTS
-- -----------------------------------------------------------------------------

CREATE TABLE INSTRUMENTS
   (
    ID_INSTRUMENT NUMBER(2)  NOT NULL,
    INSTRUMENT_LABEL VARCHAR2(32)  NULL
,   CONSTRAINT PK_INSTRUMENTS PRIMARY KEY (ID_INSTRUMENT)  
   ) ;

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
--       TABLE : TELEPHONETYPES
-- -----------------------------------------------------------------------------

CREATE TABLE TELEPHONETYPES
   (
    ID_TELTYPE NUMBER(2)  NOT NULL,
    TELTYPE_LABEL VARCHAR2(12)  NULL
,   CONSTRAINT PK_TELEPHONETYPES PRIMARY KEY (ID_TELTYPE)  
   ) ;

COMMENT ON TABLE TELEPHONETYPES
     IS 'Tél, Portable, fax, travail, domicile';

-- -----------------------------------------------------------------------------
--       TABLE : PROGRAMME
-- -----------------------------------------------------------------------------

CREATE TABLE PROGRAMME
   (
    ID_PROGRAMME NUMBER(2)  NOT NULL,
    ID_RENCONTRE NUMBER(2)  NOT NULL,
    ID_GROUPE NUMBER(2)  NOT NULL,
    ID_LIEUREPRESENTATION NUMBER(2)  NOT NULL,
    DATE_PASSAGE CHAR(32)  NULL,
    HEURE_DEBUT DATE  NULL,
    HEURE_FIN DATE  NULL
,   CONSTRAINT PK_PROGRAMME PRIMARY KEY (ID_PROGRAMME)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE PROGRAMME
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_PROGRAMME_RENCONTRES
     ON PROGRAMME (ID_RENCONTRE ASC)
    ;

CREATE  INDEX I_FK_PROGRAMME_GROUPES
     ON PROGRAMME (ID_GROUPE ASC)
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
    ID_CIVILITE NUMBER(2)  NOT NULL,
    NOM VARCHAR2(32)  NULL,
    PRENOM VARCHAR2(32)  NULL,
    DATE_NAISSANCE DATE  NULL
,   CONSTRAINT PK_INDIVIDUS PRIMARY KEY (ID_INDIVIDU)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE INDIVIDUS
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_INDIVIDUS_CIVILITES
     ON INDIVIDUS (ID_CIVILITE ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : RESPONSABILITES
-- -----------------------------------------------------------------------------

CREATE TABLE RESPONSABILITES
   (
    ID_RESPONSABILITE NUMBER(2)  NOT NULL,
    RESPONSABILITE_LABEL VARCHAR2(32)  NULL
,   CONSTRAINT PK_RESPONSABILITES PRIMARY KEY (ID_RESPONSABILITE)  
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
    ID_SPECIALITE NUMBER(2)  NOT NULL,
    ID_INSTRUMENT NUMBER(2)  NOT NULL
,   CONSTRAINT PK_JOUE_EN_TANT_QUE PRIMARY KEY (ID_INDIVIDU, ID_SPECIALITE, ID_INSTRUMENT)  
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

CREATE  INDEX I_FK_JOUE_EN_TANT_QUE_INSTRUME
     ON JOUE_EN_TANT_QUE (ID_INSTRUMENT ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : A_POUR_ADRESSE
-- -----------------------------------------------------------------------------

CREATE TABLE A_POUR_ADRESSE
   (
    ID_INDIVIDU NUMBER(2)  NOT NULL,
    ID_ADRESSE NUMBER(2)  NOT NULL,
    ID_ADRESSETYPE NUMBER(2)  NOT NULL
,   CONSTRAINT PK_A_POUR_ADRESSE PRIMARY KEY (ID_INDIVIDU, ID_ADRESSE, ID_ADRESSETYPE)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE A_POUR_ADRESSE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_A_POUR_ADRESSE_INDIVIDUS
     ON A_POUR_ADRESSE (ID_INDIVIDU ASC)
    ;

CREATE  INDEX I_FK_A_POUR_ADRESSE_ADRESSES
     ON A_POUR_ADRESSE (ID_ADRESSE ASC)
    ;

CREATE  INDEX I_FK_A_POUR_ADRESSE_ADRESSETYP
     ON A_POUR_ADRESSE (ID_ADRESSETYPE ASC)
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
--       TABLE : A_POUR_TEL
-- -----------------------------------------------------------------------------

CREATE TABLE A_POUR_TEL
   (
    ID_INDIVIDU NUMBER(2)  NOT NULL,
    ID_TELEPHONE NUMBER(2)  NOT NULL,
    ID_TELTYPE NUMBER(2)  NOT NULL
,   CONSTRAINT PK_A_POUR_TEL PRIMARY KEY (ID_INDIVIDU, ID_TELEPHONE, ID_TELTYPE)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE A_POUR_TEL
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_A_POUR_TEL_INDIVIDUS
     ON A_POUR_TEL (ID_INDIVIDU ASC)
    ;

CREATE  INDEX I_FK_A_POUR_TEL_TELEPHONES
     ON A_POUR_TEL (ID_TELEPHONE ASC)
    ;

CREATE  INDEX I_FK_A_POUR_TEL_TELEPHONETYPES
     ON A_POUR_TEL (ID_TELTYPE ASC)
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
--       TABLE : EST_RESPONSABLE
-- -----------------------------------------------------------------------------

CREATE TABLE EST_RESPONSABLE
   (
    ID_RESPONSABILITE NUMBER(2)  NOT NULL,
    ID_INDIVIDU NUMBER(2)  NOT NULL,
    ID_GROUPE NUMBER(2)  NOT NULL
,   CONSTRAINT PK_EST_RESPONSABLE PRIMARY KEY (ID_RESPONSABILITE)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE EST_RESPONSABLE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_EST_RESPONSABLE_INDIVIDUS
     ON EST_RESPONSABLE (ID_INDIVIDU ASC)
    ;

CREATE  INDEX I_FK_EST_RESPONSABLE_GROUPES
     ON EST_RESPONSABLE (ID_GROUPE ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : A_POUR_EMAIL
-- -----------------------------------------------------------------------------

CREATE TABLE A_POUR_EMAIL
   (
    ID_EMAIL NUMBER(2)  NOT NULL,
    ID_INDIVIDU NUMBER(2)  NOT NULL
,   CONSTRAINT PK_A_POUR_EMAIL PRIMARY KEY (ID_EMAIL, ID_INDIVIDU)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE A_POUR_EMAIL
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_A_POUR_EMAIL_EMAILS
     ON A_POUR_EMAIL (ID_EMAIL ASC)
    ;

CREATE  INDEX I_FK_A_POUR_EMAIL_INDIVIDUS
     ON A_POUR_EMAIL (ID_INDIVIDU ASC)
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
--       TABLE : EST_MEMBRE
-- -----------------------------------------------------------------------------

CREATE TABLE EST_MEMBRE
   (
    ID_GROUPE NUMBER(2)  NOT NULL,
    ID_INDIVIDU NUMBER(2)  NOT NULL,
    ID_FONCTION NUMBER(2)  NOT NULL
,   CONSTRAINT PK_EST_MEMBRE PRIMARY KEY (ID_GROUPE, ID_INDIVIDU, ID_FONCTION)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE EST_MEMBRE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_EST_MEMBRE_GROUPES
     ON EST_MEMBRE (ID_GROUPE ASC)
    ;

CREATE  INDEX I_FK_EST_MEMBRE_INDIVIDUS
     ON EST_MEMBRE (ID_INDIVIDU ASC)
    ;

CREATE  INDEX I_FK_EST_MEMBRE_FONCTIONS
     ON EST_MEMBRE (ID_FONCTION ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : SE_COMPOSE_DE
-- -----------------------------------------------------------------------------

CREATE TABLE SE_COMPOSE_DE
   (
    ID_OEUVRE NUMBER(32)  NOT NULL,
    ID_PROGRAMME NUMBER(2)  NOT NULL,
    DUREE_PREVUE DATE  NULL
,   CONSTRAINT PK_SE_COMPOSE_DE PRIMARY KEY (ID_OEUVRE, ID_PROGRAMME)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE SE_COMPOSE_DE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_SE_COMPOSE_DE_OEUVRES
     ON SE_COMPOSE_DE (ID_OEUVRE ASC)
    ;

CREATE  INDEX I_FK_SE_COMPOSE_DE_PROGRAMME
     ON SE_COMPOSE_DE (ID_PROGRAMME ASC)
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
    ID_OEUVRETYPE NUMBER(2)  NOT NULL
,   CONSTRAINT PK_EST_DE_TYPE PRIMARY KEY (ID_OEUVRE, ID_OEUVRETYPE)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE EST_DE_TYPE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_EST_DE_TYPE_OEUVRES
     ON EST_DE_TYPE (ID_OEUVRE ASC)
    ;

CREATE  INDEX I_FK_EST_DE_TYPE_OEUVRETYPES
     ON EST_DE_TYPE (ID_OEUVRETYPE ASC)
    ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE LIEUX ADD (
     CONSTRAINT FK_LIEUX_ADRESSES
          FOREIGN KEY (ID_ADRESSE)
               REFERENCES ADRESSES (ID_ADRESSE))   ;

ALTER TABLE GROUPES ADD (
     CONSTRAINT FK_GROUPES_INDIVIDUS
          FOREIGN KEY (ID_INDIVIDU)
               REFERENCES INDIVIDUS (ID_INDIVIDU))   ;

ALTER TABLE PROGRAMME ADD (
     CONSTRAINT FK_PROGRAMME_RENCONTRES
          FOREIGN KEY (ID_RENCONTRE)
               REFERENCES RENCONTRES (ID_RENCONTRE))   ;

ALTER TABLE PROGRAMME ADD (
     CONSTRAINT FK_PROGRAMME_GROUPES
          FOREIGN KEY (ID_GROUPE)
               REFERENCES GROUPES (ID_GROUPE))   ;

ALTER TABLE PROGRAMME ADD (
     CONSTRAINT FK_PROGRAMME_LIEUXREPRESENTATI
          FOREIGN KEY (ID_LIEUREPRESENTATION)
               REFERENCES LIEUXREPRESENTATION (ID_LIEUREPRESENTATION))   ;

ALTER TABLE INDIVIDUS ADD (
     CONSTRAINT FK_INDIVIDUS_CIVILITES
          FOREIGN KEY (ID_CIVILITE)
               REFERENCES CIVILITES (ID_CIVILITE))   ;

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
               REFERENCES SPECIALITES (ID_SPECIALITE))   ;

ALTER TABLE JOUE_EN_TANT_QUE ADD (
     CONSTRAINT FK_JOUE_EN_TANT_QUE_INSTRUMENT
          FOREIGN KEY (ID_INSTRUMENT)
               REFERENCES INSTRUMENTS (ID_INSTRUMENT))   ;

ALTER TABLE A_POUR_ADRESSE ADD (
     CONSTRAINT FK_A_POUR_ADRESSE_INDIVIDUS
          FOREIGN KEY (ID_INDIVIDU)
               REFERENCES INDIVIDUS (ID_INDIVIDU))   ;

ALTER TABLE A_POUR_ADRESSE ADD (
     CONSTRAINT FK_A_POUR_ADRESSE_ADRESSES
          FOREIGN KEY (ID_ADRESSE)
               REFERENCES ADRESSES (ID_ADRESSE))   ;

ALTER TABLE A_POUR_ADRESSE ADD (
     CONSTRAINT FK_A_POUR_ADRESSE_ADRESSETYPES
          FOREIGN KEY (ID_ADRESSETYPE)
               REFERENCES ADRESSETYPES (ID_ADRESSETYPE))   ;

ALTER TABLE REPRESENTE_PAYS ADD (
     CONSTRAINT FK_REPRESENTE_PAYS_GROUPES
          FOREIGN KEY (ID_GROUPE)
               REFERENCES GROUPES (ID_GROUPE))   ;

ALTER TABLE REPRESENTE_PAYS ADD (
     CONSTRAINT FK_REPRESENTE_PAYS_PAYS
          FOREIGN KEY (ID_PAYS)
               REFERENCES PAYS (ID_PAYS))   ;

ALTER TABLE A_POUR_TEL ADD (
     CONSTRAINT FK_A_POUR_TEL_INDIVIDUS
          FOREIGN KEY (ID_INDIVIDU)
               REFERENCES INDIVIDUS (ID_INDIVIDU))   ;

ALTER TABLE A_POUR_TEL ADD (
     CONSTRAINT FK_A_POUR_TEL_TELEPHONES
          FOREIGN KEY (ID_TELEPHONE)
               REFERENCES TELEPHONES (ID_TELEPHONE))   ;

ALTER TABLE A_POUR_TEL ADD (
     CONSTRAINT FK_A_POUR_TEL_TELEPHONETYPES
          FOREIGN KEY (ID_TELTYPE)
               REFERENCES TELEPHONETYPES (ID_TELTYPE))   ;

ALTER TABLE REPRESENTE_REGION ADD (
     CONSTRAINT FK_REPRESENTE_REGION_GROUPES
          FOREIGN KEY (ID_GROUPE)
               REFERENCES GROUPES (ID_GROUPE))   ;

ALTER TABLE REPRESENTE_REGION ADD (
     CONSTRAINT FK_REPRESENTE_REGION_REGIONS
          FOREIGN KEY (ID_REGION)
               REFERENCES REGIONS (ID_REGION))   ;

ALTER TABLE EST_RESPONSABLE ADD (
     CONSTRAINT FK_EST_RESPONSABLE_INDIVIDUS
          FOREIGN KEY (ID_INDIVIDU)
               REFERENCES INDIVIDUS (ID_INDIVIDU))   ;

ALTER TABLE EST_RESPONSABLE ADD (
     CONSTRAINT FK_EST_RESPONSABLE_GROUPES
          FOREIGN KEY (ID_GROUPE)
               REFERENCES GROUPES (ID_GROUPE))   ;

ALTER TABLE EST_RESPONSABLE ADD (
     CONSTRAINT FK_EST_RESPONSABLE_RESPONSABIL
          FOREIGN KEY (ID_RESPONSABILITE)
               REFERENCES RESPONSABILITES (ID_RESPONSABILITE))   ;

ALTER TABLE A_POUR_EMAIL ADD (
     CONSTRAINT FK_A_POUR_EMAIL_EMAILS
          FOREIGN KEY (ID_EMAIL)
               REFERENCES EMAILS (ID_EMAIL))   ;

ALTER TABLE A_POUR_EMAIL ADD (
     CONSTRAINT FK_A_POUR_EMAIL_INDIVIDUS
          FOREIGN KEY (ID_INDIVIDU)
               REFERENCES INDIVIDUS (ID_INDIVIDU))   ;

ALTER TABLE EST_AUTEUR ADD (
     CONSTRAINT FK_EST_AUTEUR_INDIVIDUS
          FOREIGN KEY (ID_INDIVIDU)
               REFERENCES INDIVIDUS (ID_INDIVIDU))   ;

ALTER TABLE EST_AUTEUR ADD (
     CONSTRAINT FK_EST_AUTEUR_OEUVRES
          FOREIGN KEY (ID_OEUVRE)
               REFERENCES OEUVRES (ID_OEUVRE))   ;

ALTER TABLE EST_MEMBRE ADD (
     CONSTRAINT FK_EST_MEMBRE_GROUPES
          FOREIGN KEY (ID_GROUPE)
               REFERENCES GROUPES (ID_GROUPE))   ;

ALTER TABLE EST_MEMBRE ADD (
     CONSTRAINT FK_EST_MEMBRE_INDIVIDUS
          FOREIGN KEY (ID_INDIVIDU)
               REFERENCES INDIVIDUS (ID_INDIVIDU))   ;

ALTER TABLE EST_MEMBRE ADD (
     CONSTRAINT FK_EST_MEMBRE_FONCTIONS
          FOREIGN KEY (ID_FONCTION)
               REFERENCES FONCTIONS (ID_FONCTION))   ;

ALTER TABLE SE_COMPOSE_DE ADD (
     CONSTRAINT FK_SE_COMPOSE_DE_OEUVRES
          FOREIGN KEY (ID_OEUVRE)
               REFERENCES OEUVRES (ID_OEUVRE))   ;

ALTER TABLE SE_COMPOSE_DE ADD (
     CONSTRAINT FK_SE_COMPOSE_DE_PROGRAMME
          FOREIGN KEY (ID_PROGRAMME)
               REFERENCES PROGRAMME (ID_PROGRAMME))   ;

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
          FOREIGN KEY (ID_OEUVRETYPE)
               REFERENCES OEUVRETYPES (ID_OEUVRETYPE))   ;


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------