SELECT i.id_individu, email_label, nom, prenom, adr_label , adr_cp, adr_ville, num_telephone
FROM individus i
   LEFT OUTER JOIN a_pour_email ae
        ON i.Id_Individu = ae.Id_individu
	JOIN emails e
	USING(id_email)
   LEFT OUTER JOIN a_pour_adresse aa
	ON i.Id_Individu = aa.Id_individu
	JOIN adresses adr 
	USING(Id_adresse)
   LEFT OUTER JOIN a_pour_tel at
        ON i.Id_Individu = at.Id_individu
        JOIN telephones t
	USING(Id_telephone)
;




SELECT nom, prenom, email_label AS email, emailType_usage as de_type
FROM a_pour_email a
   LEFT OUTER JOIN individus i
        ON a.Id_Individu = i.Id_individu
   LEFT OUTER JOIN emails e
        ON a.Id_email = e.Id_email
   LEFT OUTER JOIN emailTypes et 
        ON a.Id_emailType = et.Id_emailType
;
