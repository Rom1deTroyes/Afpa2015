SELECT nom, prenom, specialite_label, instrument_label
FROM individus i
 LEFT OUTER JOIN joue_en_tant_que j
  ON j.Id_individu = i.Id_individu
 LEFT OUTER JOIN specialites s
  ON j.Id_specialite = s.Id_specialite
 LEFT OUTER JOIN instruments i
  ON j.Id_instrument = i.Id_instrument
ORDER BY nom, prenom
;
