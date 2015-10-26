SELECT nom, prenom, adr_label AS Adresse, adr_cp, adr_ville, adresseType_usage as de_type
FROM individus i
   LEFT OUTER JOIN a_pour_adresse a
        ON a.Id_Individu = i.Id_individu
   LEFT OUTER JOIN adresses adr 
        ON a.Id_adresse = adr.Id_adresse
   LEFT OUTER JOIN adresseTypes at
        ON a.Id_adresseType = at.Id_adresseType
ORDER BY nom, prenom
;
