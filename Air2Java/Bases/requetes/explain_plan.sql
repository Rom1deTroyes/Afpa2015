-- 1ere m�thode :
explain plan &requette ;
select * from table(dbms_xplan.display);

-- 2�m� methode :
SELECT /*+ gather_plan_statistics */  ...;
SELECT * FROM TABLE(dbms_xplan.display_cursor(NULL,NULL,'ALLSTATS LAST'));
