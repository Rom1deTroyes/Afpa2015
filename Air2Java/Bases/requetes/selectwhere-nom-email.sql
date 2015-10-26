SELECT nom, prenom,  email_label
FROM emails, individus, a_pour_email
WHERE 1=1
AND a_pour_email.id_email = emails.Id_email
AND a_pour_email.id_individu = individus.Id_individu
;
