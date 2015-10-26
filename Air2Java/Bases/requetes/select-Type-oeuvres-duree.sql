SELECT oeuvreType_label as de_type, titre_oeuvre AS Titre, TO_CHAR(DUREE_OEUVRE,'HH24:MI:SS') as Duree
FROM oeuvre_de_type ot 
 RIGHT OUTER JOIN oeuvreTypes t
  ON ot.Id_oeuvreType = t.Id_oeuvreType
 LEFT OUTER JOIN oeuvres o
  ON ot.Id_oeuvre = o.Id_oeuvre
ORDER BY t.Id_oeuvreType 
;
