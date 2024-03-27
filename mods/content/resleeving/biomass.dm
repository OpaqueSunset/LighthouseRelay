/decl/material/liquid/biomass
	name = "biomass"
	lore_text = "A rich slurry of all the right stuff for growing living tissue."
	uid = "liquid_biomass"
	color = "#df9fbf"
	accelerant_value = 0.1 // taken from /decl/material/solid/organic
	ignition_point = T0C+300
	melting_point = T0C+300
	hardness = MAT_VALUE_SOFT
	weight = MAT_VALUE_NORMAL
	reflectiveness = MAT_VALUE_DULL
	wall_support_value = MAT_VALUE_EXTREMELY_LIGHT
	glass_name = "biomass"

/decl/chemical_reaction/drug/biomass
	name = "Biomass"
	result = /decl/material/liquid/biomass
	required_reagents = list(
		/decl/material/liquid/nutriment/protein = 1,
		/decl/material/liquid/nutriment/sugar = 1,
		/decl/material/solid/phoron = 1
	)
	result_amount = 1 // Roughly 20u per phoron sheet