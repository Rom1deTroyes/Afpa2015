SELECT o.Id_oeuvre, titre_oeuvre AS Titre, oeuvreType_label as de_type, TO_CHAR(DUREE_OEUVRE,'HH24:MI:SS') as Duree
FROM oeuvres o 
 JOIN oeuvre_de_type ot
  ON ot.Id_oeuvre = o.Id_oeuvre
 JOIN oeuvreTypes t
  ON ot.Id_oeuvreType = t.Id_oeuvreType
;
