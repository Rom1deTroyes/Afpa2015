Select constraint_name,constraint_type from user_constraints where table_name = 'EST_MEMBRE' ;
Select column_name,position from user_cons_columns where constraint_name='PK_EST_MEMBRE';


SELECT cols.table_name, cols.column_name, cols.position, cons.status, cons.owner
FROM all_constraints cons, all_cons_columns cols
WHERE cols.table_name = 'EST_MEMBRE'
AND cons.constraint_type = 'P'
AND cons.constraint_name = cols.constraint_name
AND cons.owner = cols.owner
ORDER BY cols.table_name, cols.position;

