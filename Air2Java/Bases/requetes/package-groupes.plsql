-- Package Groupes
-- Pour tout ce qui touche aux Groupes
CREATE OR REPLACE PACKAGE Pack_Groupes IS
	-- Déclaration de types globaux
	TYPE tgroupe IS RECORD (
                groupe_id      groupes.id_groupe%TYPE
              , groupe_nom     groupes.denomination%TYPE
	);
	PROCEDURE groupe_not_in_rencontre(r_Id rencontres.id_rencontre%TYPE) ;
	FUNCTION groupe_not_in_rencontre(r_Id rencontres.id_rencontre%TYPE)
		RETURN Pack_Groupes.tgroupe ;
	FUNCTION get_id_last_rencontre
		RETURN rencontres.id_rencontre%TYPE ;
END Pack_Groupes ;
/
CREATE OR REPLACE PACKAGE BODY Pack_Groupes IS
-- Procédure groupe_not_in_rencontre
-- Affiche les groupes @TODO Refaconner en Fonction !
	PROCEDURE groupe_not_in_rencontre(r_Id rencontres.id_rencontre%TYPE) IS
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
	END groupe_not_in_rencontre ;
	FUNCTION groupe_not_in_reunion(r_Id rencontres.id_rencontre%TYPE)
	RETURN tgroupe IS
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
	RETURN(vgroupe);
	END;


-- Fonction get_id_last_rencontre
-- Retourne l'Id de la dernière rencontre
	FUNCTION get_id_last_rencontre
	RETURN rencontres.id_rencontre%TYPE IS
		id_      rencontres.id_rencontre%TYPE       ;
		CURSOR C IS 
			SELECT max(Id_rencontre) FROM rencontres
		;
	BEGIN
		OPEN C;
		LOOP 
				fetch C into id_ ;
				EXIT WHEN C%NOTFOUND ;
	/*			dbms_output.put_line(
				       '- ' || id_
				);
	*/
			END LOOP;
		CLOSE C;
	RETURN (id_);
	END get_id_last_rencontre;
END Pack_Groupes ;
/


-- Tests
/*
   set linesize 1400;
   set pagesize 40;
   set serveroutput on; 
   set showmode on;  
exec Pack_Groupes.groupe_not_in_rencontre(&rid) ;
-- Tests id_last_rencontre
select Pack_Groupes.get_id_last_rencontre() from dual ;
select * from rencontres where id_rencontre = Pack_Groupes.get_id_last_rencontre() ;

*/
