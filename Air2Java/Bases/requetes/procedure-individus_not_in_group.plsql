/*
   set linesize 1400;
   set pagesize 40;
   set serveroutput on; 
   set showmode on;  
*/
CREATE OR REPLACE PROCEDURE indiv_not_in_group(groupId groupes.id_groupe%TYPE) IS
        individ_id      individus.id_individu%TYPE       ;
        individ_nom     individus.nom%TYPE      ;
        individ_prenom  individus.prenom%TYPE   ;
        CURSOR C IS 
SELECT Id_individu, individus.nom, prenom
FROM individus
WHERE Id_individu NOT IN (
        SELECT Id_individu
        FROM groupes
)
ORDER BY individus.nom
;

	TYPE tIndiv IS RECORD (
                individ_id      individus.id_individu%TYPE
              , individ_nom     individus.nom%TYPE
              , individ_prenom  individus.prenom%TYPE
        );
	vIndiv  tIndiv ;
BEGIN
	OPEN C;
	LOOP 
			fetch C into vIndiv ;
			EXIT WHEN C%NOTFOUND ;
			dbms_output.put_line(
                               '- ' || vIndiv.individ_id
                            || ' : ' || vIndiv.individ_nom
                            || ' ' || vIndiv.individ_prenom
                        );
		END LOOP;
		CLOSE C;
END;
/


-- Tests
exec indiv_not_in_group(&groupe) ;
