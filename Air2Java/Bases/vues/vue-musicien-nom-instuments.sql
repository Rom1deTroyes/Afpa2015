CREATE OR REPLACE VIEW Air2Java.MusiciensNomInstruments AS
SELECT nom, prenom, specialite_label AS Specialite, instrument_label AS Instrument
FROM joue_en_tant_que j
 LEFT OUTER JOIN individus i
  ON j.Id_individu = i.Id_individu
 LEFT OUTER JOIN specialites s
  ON j.Id_specialite = s.Id_specialite
 LEFT OUTER JOIN instruments i
  ON j.Id_instrument = i.Id_instrument
;
