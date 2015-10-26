---------------------------------------------------------------- 
-- Création et attribution profiles, rôles et privilèges
-- Doit être lancé par un usilisateur ayant les droits dba
----------------------------------------------------------------
-- Les Utilisateurs obtiennent des privilèges par les roles
-- les roles sont donnés aux utilisateurs sur une 
-- Role Administrateur
-- Role Utilisateur
-- Role de consultation
----------------------------------------------------------------
-- Roles
DROP ROLE 
CREATE ROLE bdd_admin   IDENTIFIED BY adminpass ;
CREATE ROLE bdd_user    IDENTIFIED BY userpass ;
CREATE ROLE bdd_consult IDENTIFIED BY consultpass ;
-- Activer les roles pour pouvoir les utiliser
SET ROLE bdd_admin   IDENTIFIED BY adminpass ;
SET ROLE bdd_user    IDENTIFIED BY userpass ;
SET ROLE bdd_consult IDENTIFIED BY consultpass ;
-- attribution de privilèges génériques :
GRANT CREATE TABLE , CREATE VIEW, CREATE SEQUENCE , INSERT ANY TABLE , UPDATE ANY TABLE , DELETE ANY TABLE , SELECT ANY TABLE TO bdd_admin IDENTIFIED BY adminpass ;
GRANT                                               INSERT ANY TABLE , UPDATE ANY TABLE , DELETE ANY TABLE , SELECT ANY TABLE TO bdd_user ;
GRANT                                                                                                        SELECT ANY TABLE TO bdd_consult ;
--   GRANT UPDATE ( individus, adresses ) ON Air2Java TO bdd_individu ;
----------------------------------------------------------------
-- Profiles
----------------------------------------------------------------
DROP PROFILE Air2Java_Admin CASCADE;
CREATE PROFILE Air2Java_Admin    LIMIT 
        SESSIONS_PER_USER          UNLIMITED 
        CPU_PER_SESSION            UNLIMITED 
        CPU_PER_CALL               3000 
        CONNECT_TIME               45 
        LOGICAL_READS_PER_SESSION  DEFAULT 
        LOGICAL_READS_PER_CALL     1000 
        PRIVATE_SGA                15K
        COMPOSITE_LIMIT            5000000
	;
DROP PROFILE Air2Java_User CASCADE;
CREATE PROFILE Air2Java_User    LIMIT 
        SESSIONS_PER_USER          UNLIMITED 
        CPU_PER_SESSION            UNLIMITED 
        CPU_PER_CALL               3000 
        CONNECT_TIME               45
        FAILED_LOGIN_ATTEMPTS 5
        PASSWORD_LOCK_TIME 1
        LOGICAL_READS_PER_SESSION  DEFAULT 
        LOGICAL_READS_PER_CALL     1000 
        PRIVATE_SGA                15K
        COMPOSITE_LIMIT            5000000
	;
DROP PROFILE Air2Java_Consult CASCADE;
CREATE PROFILE Air2Java_Consult    LIMIT 
        SESSIONS_PER_USER          UNLIMITED 
        CPU_PER_SESSION            UNLIMITED 
        CPU_PER_CALL               3000 
        CONNECT_TIME               5
        LOGICAL_READS_PER_SESSION  DEFAULT
        LOGICAL_READS_PER_CALL     1000 
        PRIVATE_SGA                15K
        COMPOSITE_LIMIT            5000000
	;
----------------------------------------------------------------
-- Utilisateurs
-- Administrateur
CREATE  USER Air2JavaAdmin identified by Air2JavaAdminpass
--        PROFILE Air2Java_Admin
        default tablespace USERS temporary tablespace TEMP
        ;
-- Utilisateur
CREATE  USER Air2JavaUser identified by Air2JavaUserpass 
--        PROFILE Air2Java_User
        default tablespace USERS temporary tablespace TEMP
        ;
-- Consultant
CREATE  USER Air2JavaConsult identified by Air2JavaConsultpass 
--        PROFILE Air2Java_Consult
        default tablespace USERS temporary tablespace TEMP
        ;
----------------------------------------------------------------
-- Affectation du profil aux utilisateurs
ALTER USER Air2JavaAdmin PROFILE Air2Java_Admin ;
ALTER USER Air2JavaUser PROFILE Air2Java_User ;
ALTER USER Air2JavaConsult PROFILE Air2Java_Consult ;
-- Affectation des roles aux utilisateurs
ALTER USER Air2JavaAdmin ROLE bdd_admin ;
ALTER USER Air2JavaUser ROLE bdd_user ;
ALTER USER Air2JavaConsult ROLE bdd_consult ;
-- 
GRANT bdd_admin   TO Air2JavaAdmin;
GRANT bdd_user    TO Air2JavaUser;
GRANT bdd_consult TO Air2JavaConsult;
GRANT CREATE SESSION, bdd_admin   ON Air2Java TO Air2JavaAdmin;
GRANT CREATE SESSION, bdd_user    ON Air2Java TO Air2JavaUser;
GRANT CREATE SESSION, bdd_consult ON Air2Java TO Air2JavaConsult;

-- grant select on Air2Java.MusiciensNomInstruments to AIR2JAVAConsult ;
----------------------------------------------------------------
-- Visualiser les utilisateurs, profils, roles
-- Roles
-- Liste des roles
SELECT * FROM dba_roles WHERE role like '%BDD_%' ;
-- Privilèges des roles
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE like '%BDD_%' ;
-- Liste des privilèges sur les shemas.tables
select * from DBA_TAB_PRIVS where grantee like '%BDD%'
-- Utilisateurs
-- liste des roles affectés aux utilisateurs
SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE like '%AIR2JAVA%';
-- Listes des privilèges des utilisateurs
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE like '%AIR2JAVA%' ;







-- Aprés connexion chez Air2Java faire

create role Gestion_Air2Java;
grant SELECT ON individus INSERT ON individus to Gestion_Air2Java;
grant Gestion_Air2Java to Air2JavaAdmin , Air2JavaUser ;
commit;
