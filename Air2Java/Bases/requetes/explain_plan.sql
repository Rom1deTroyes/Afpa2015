-- 1ere méthode :
explain plan &requette ;
select * from table(dbms_xplan.display);

-- 2èmè methode :
SELECT /*+ gather_plan_statistics */  ...;
SELECT * FROM TABLE(dbms_xplan.display_cursor(NULL,NULL,'ALLSTATS LAST'));
