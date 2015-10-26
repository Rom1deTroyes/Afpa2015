SELECT nom, prenom, email_label AS email, emailType_usage as de_type
FROM individus i
   LEFT OUTER JOIN a_pour_email a
        ON a.Id_Individu = i.Id_individu
   LEFT OUTER JOIN emails e
        ON a.Id_email = e.Id_email
   LEFT OUTER JOIN emailTypes et 
        ON a.Id_emailType = et.Id_emailType
ORDER BY nom, prenom
;
