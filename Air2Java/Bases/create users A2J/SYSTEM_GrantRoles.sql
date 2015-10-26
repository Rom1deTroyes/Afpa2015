-- -----------------------------------------------------------------------------
--      Assignation des privileges au role R_Air2JavaUser
-- -----------------------------------------------------------------------------
 
 GRANT
  CONNECT,
  CREATE SESSION
  TO R_Air2JavaUser;
  
  -- Privileges sur les tables
  
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.AUTEUR TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.INDIVIDU TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.SCENE TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.RENCONTRE TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.CORRESPONDANT TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.REGION TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.INSTRUMENT TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.GROUPE TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.ADRESSE TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.ARTISTE TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.TYPE_CHANSON TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.CHANSON TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.SPECIALITE TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.PERIODICITE TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.COORDONNEE TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.ORGANISATEUR TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.CONCERT TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.PLAYLIST TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.A_UN_REPERTOIRE TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.REPRESENTE TO R_Air2JavaUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Air2Java.EST_COMPOSE TO R_Air2JavaUser;
  
-- -----------------------------------------------------------------------------
--      Assignation des privileges au role R_Air2JavaConsult
-- -----------------------------------------------------------------------------
 
 GRANT
  CONNECT,
  CREATE SESSION
  TO R_Air2JavaConsult;
  
  -- Privileges sur les tables
  
GRANT SELECT ON Air2Java.AUTEUR TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.INDIVIDU TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.SCENE TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.RENCONTRE TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.CORRESPONDANT TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.REGION TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.INSTRUMENT TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.GROUPE TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.ADRESSE TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.ARTISTE TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.TYPE_CHANSON TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.CHANSON TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.SPECIALITE TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.PERIODICITE TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.COORDONNEE TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.ORGANISATEUR TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.CONCERT TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.PLAYLIST TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.A_UN_REPERTOIRE TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.REPRESENTE TO R_Air2JavaConsult;
GRANT SELECT ON Air2Java.EST_COMPOSE TO R_Air2JavaConsult;

-- -----------------------------------------------------------------------------
--      Assignation des roles aux utilisateurs
-- -----------------------------------------------------------------------------

GRANT R_Air2JavaUser TO Air2JavaUser;

GRANT R_Air2JavaConsult TO Air2JavaConsult;

EXIT;
