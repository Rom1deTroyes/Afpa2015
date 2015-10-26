SELECT nom, prenom, num_telephone AS Tel, telType_label as tpye
FROM a_pour_tel a , individus i , telephones t , telephoneTypes tt
WHERE 1=1
AND a.Id_Individu = i.Id_individu
AND a.Id_telephone = t.Id_telephone
AND a.Id_telType = tt.Id_telType
;
