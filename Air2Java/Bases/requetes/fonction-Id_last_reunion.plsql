CREATE OR REPLACE FUNCTION get_id_last_reunion RETURN rencontres.id_rencontre%TYPE IS
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
END;
/


-- Tests
/*
   set linesize 1400;
   set pagesize 40;
   set serveroutput on; 
   set showmode on;  

select get_id_last_reunion() from dual ;
select * from rencontres where id_rencontre = get_id_last_reunion() ;

*/
