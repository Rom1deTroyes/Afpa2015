SELECT nom, prenom, specialite_label, instrument_label
FROM   individus, specialites, instruments, joue_en_tant_que
WHERE 1=1
AND joue_en_tant_que.id_individu = individus.Id_individu
AND joue_en_tant_que.id_specialite = specialites.Id_specialite
AND joue_en_tant_que.id_instrument = instruments.id_instrument
;
