-- Methode 1 :
-- SELECT 'DROP VIEW '||view_name FROM sys.all_views WHERE owner LIKE 'GRC%';
-- Methode 2 :
BEGIN 
FOR mes_vues IN (SELECT owner,view_name FROM sys.all_views WHERE owner LIKE 'GRC_%') LOOP
  EXECUTE IMMEDIATE 'DROP VIEW ' || mes_vues.owner || '.' || mes_vues.view_name;
END LOOP;
END;
/

