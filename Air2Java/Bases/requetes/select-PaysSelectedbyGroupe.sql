select id_pays, pays_label
	from pays
		right join represente_pays
		using (id_pays)
	where id_groupe = &group
;
