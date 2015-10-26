SELECT o.Id_oeuvre, titre_oeuvre AS Titre, oeuvreType_label as de_type, TO_CHAR(DUREE_OEUVRE,'HH24:MI:SS') as Duree
FROM oeuvre_de_type ot , oeuvres o , oeuvreTypes t
WHERE 1=1
AND ot.Id_oeuvre = o.Id_oeuvre
AND ot.Id_oeuvreType = t.Id_oeuvreType
;
