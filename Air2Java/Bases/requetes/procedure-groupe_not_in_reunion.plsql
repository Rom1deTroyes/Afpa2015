CREATE OR REPLACE PROCEDURE groupe_not_in_reunion(r_Id rencontres.id_rencontre%TYPE) IS
        individ_id      individus.id_individu%TYPE       ;
        CURSOR C IS 
SELECT id_groupe, denomination
FROM groupes
WHERE groupes.id_groupe NOT IN (
-- Les groupes qui participent à la rencontre r_id :
	SELECT UNIQUE g.id_groupe
	FROM programme p
	INNER JOIN rencontres r
		ON p.id_rencontre = r_id
	INNER JOIN groupes g
		ON p.id_groupe = g.id_groupe
)
ORDER BY denomination
;

	TYPE tgroupe IS RECORD (
                groupe_id      groupes.id_groupe%TYPE
              , groupe_nom     groupes.denomination%TYPE
	);
	vgroupe  tgroupe ;
BEGIN
	OPEN C;
	LOOP 
			fetch C into vgroupe ;
			EXIT WHEN C%NOTFOUND ;
			dbms_output.put_line(
                               '- ' || vgroupe.groupe_id
                            || ' : ' || vgroupe.groupe_nom
                            || ' '
                        );
		END LOOP;
		CLOSE C;
END;
/
-- Tests
/*
   set linesize 1400;
   set pagesize 40;
   set serveroutput on; 
   set showmode on;  
exec groupe_not_in_reunion(&rid) ;

*/
