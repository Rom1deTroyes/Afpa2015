DROP USER Air2Java CASCADE;
DROP USER Air2Javauser CASCADE;
DROP USER Air2JavaConsult CASCADE;

DROP ROLE R_Air2JavaAdmin;
DROP ROLE R_Air2JavaUser;
DROP ROLE R_Air2JavaConsult;

DROP TABLESPACE Air2Java
  INCLUDING CONTENTS AND DATAFILES
    CASCADE CONSTRAINTS;

-- -----------------------------------------------------------------------------
--      Nom de la base : XE
--      Projet : Air2Java
--      Auteur : Rom1
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
--      Creation du tablespace Air2Java
-- -----------------------------------------------------------------------------

CREATE TABLESPACE Air2Java
DATAFILE 'TS_Air2Java.DBF' SIZE 500M
ONLINE;

-- -----------------------------------------------------------------------------
--      Creation de l'admin
-- -----------------------------------------------------------------------------

CREATE USER Air2Java
  IDENTIFIED BY Air2Java
    DEFAULT TABLESPACE Air2Java
      TEMPORARY TABLESPACE TEMP
        ACCOUNT UNLOCK;

-- -----------------------------------------------------------------------------
--      Creation du manager
-- -----------------------------------------------------------------------------

CREATE USER Air2JavaUser
  IDENTIFIED BY Air2JavaUser
    DEFAULT TABLESPACE Air2Java
      TEMPORARY TABLESPACE TEMP
        ACCOUNT UNLOCK;

-- -----------------------------------------------------------------------------
--      Creation du consultant
-- -----------------------------------------------------------------------------

CREATE USER Air2JavaConsult
  IDENTIFIED BY Air2JavaConsult
    DEFAULT TABLESPACE Air2Java
      TEMPORARY TABLESPACE TEMP
        ACCOUNT UNLOCK;

-- -----------------------------------------------------------------------------
--      Creation des Roles
-- -----------------------------------------------------------------------------

CREATE ROLE R_Air2JavaAdmin;
CREATE ROLE R_Air2JavaUser;
CREATE ROLE R_Air2JavaConsult;

-- -----------------------------------------------------------------------------
--      Assignation des privileges au role R_Air2JavaAdmin
-- -----------------------------------------------------------------------------

GRANT
  CONNECT, RESOURCE,
  CREATE SESSION,
  CREATE TABLE,
  CREATE PROCEDURE,
  CREATE TRIGGER,
  CREATE SEQUENCE,
  CREATE VIEW
  TO R_Air2JavaAdmin;
  
ALTER USER Air2Java QUOTA UNLIMITED ON Air2Java;

GRANT R_Air2JavaAdmin TO Air2Java;

EXIT;
