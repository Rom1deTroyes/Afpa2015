select id_region, region_label
	from regions
		right join represente_region
		using (id_region)
	where id_groupe = &group
;
