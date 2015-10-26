-- sqlplus -s -l user/mdp@serveur:port/service_name @mon_fichier_sql.sql

-- Enlever les espaces
SET TRIMSPOOL ON
SET LINESIZE 1200
SET HEAD OFF
SET FEEDBACK OFF
SET VERIFY OFF
SET colsep ","
SET heading off
SET echo off
SET pagesize 0
-- Codes de sortie :
whenever sqlerror exit sqlcode
whenever oserror exit 1
-- pas d'affichage écran :
SET termout off


spool c:\temp\spooled.csv

-- SELECT * FROM scott.emp;
-- ..
spool off
exit;
-- @c:\temp\script.sql
