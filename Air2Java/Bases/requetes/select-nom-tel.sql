SELECT nom, prenom, num_telephone AS Tel, telType_usage as de_type
FROM individus i
   LEFT OUTER JOIN a_pour_tel a
        ON a.Id_Individu = i.Id_individu
   LEFT OUTER JOIN telephones t 
        ON a.Id_telephone = t.Id_telephone
   LEFT OUTER JOIN telephoneTypes tt 
        ON a.Id_telType = tt.Id_telType
ORDER BY nom, prenom, tt.Id_telType
;
