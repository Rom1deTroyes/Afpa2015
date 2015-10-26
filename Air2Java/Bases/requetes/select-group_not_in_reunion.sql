SELECT Id_groupe, groupe_label
FROM groupes
WHERE Id_groupe NOT IN
        SELECT Id_groupe
        FROM programme
        LEFT OUTER JOIN rencontres
        ON programme.Id_renconte = rencontre.id_rencontre 
ORDER BY groupe_label
;



/* @TODO C'est quoi, ça ?

DECLARE
        group_nom       groupes.label%TYPE      ;
        group_id        groupes.Id_groupe       ;
        CURSOR C IS 




DECLARE
	nFourn fournis.numfou%TYPE := 120 ;
	CURSOR C is select numfou, nomfou, satisf from fournis where numfou = nFourn ;
	-- Type RECORD
	TYPE tFourn IS RECORD ( numfou fournis.numfou%type,  nom fournis.nomfou%type,
                          satisf  fournis.satisf%type  );
	vFourn  tFourn;                                   

BEGIN

	OPEN C;
	LOOP 
			fetch C into vFourn ;
			EXIT WHEN C%NOTFOUND ;
			dbms_output.put_line('Fournisseur ' || vFourn.nom ||  
				' Indice de Satisfaction ' || vFourn.satisf   ) ;	 		
		END LOOP;
		CLOSE C;       
    
END;
/

--  Requête SELECT avec CASE
SELECT nomfou, CASE WHEN satisf IS NULL   THEN 'INCONNU'
                      WHEN satisf IN (1,2)  THEN 'MAUVAIS'
                      WHEN satisf IN (3,4)  THEN 'PASSABLE'
                      WHEN satisf IN (5,6)  THEN 'MOYEN'
                      WHEN satisf IN (7,8)  THEN 'BON'
                      WHEN satisf >=9       THEN 'EXCELLENT'
                 END
FROM FOURNIS WHERE numfou  = &in ;

*/
