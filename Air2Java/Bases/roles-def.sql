-- Roles :
CREATE ROLE mon_role IDENTIFIED BY mon_role_pass ;

GRANT CREATE SESSION, mon_role TO mon_utilisateur;
 
-- Privileges :
--  Systeme
     GRANT CREATE SESSION , CREATE TABLE , CREATE VIEW TO nom_utilisateur ;
--Pour que l'utilisateur puisse simplement se connecter à la base, il doit bénéficier du privilège système CREATE SESSION
GRANT CREATE SESSION TO nom_utilisateur ;
-- Ensuite il faut lui assigner des droits de création de table
GRANT CREATE TABLE TO nom_utilisateur ;
-- Puis les droits de création de vues
GRANT CREATE VIEW TO nom_utilisateur ;

--  Objets
GRANT SELECT ,INSERT ,UPDATE ,DELETE ON SCOTT.EMP TO nom_utilisateur ;
-- Une liste de colonnes peut être indiquée dans l'instruction afin de restreindre davantage les droits sur une table
GRANT UPDATE ( JOB, MGR ) ON SCOTT.EMP TO nom_utilisateur ;

