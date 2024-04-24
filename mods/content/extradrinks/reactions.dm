/decl/chemical_reaction/recipe/jovianwine
	name = "Jovian Wine"
	result = /decl/material/liquid/ethanol/wine/jupiter
	required_reagents = list(/decl/material/liquid/nutriment = 2, /decl/material/liquid/fuel = 1, /decl/material/liquid/cleaner = 1)
	result_amount = 4
	mix_message = "The mixture ferments into a thick, wine-coloured substance."

/decl/chemical_reaction/recipe/skrianhi
	name = "Skrianhi Tea"
	result = /decl/material/liquid/drink/skrianhi
	required_reagents = list(/decl/material/liquid/drink/tea/green = 2, /decl/material/liquid/drink/hrukhza = 1)
	result_amount = 3
	mix_message = "The tea bubbles softly as it mixes."

/decl/chemical_reaction/recipe/eggnog
	name = "Eggnog"
	result = /decl/material/liquid/drink/eggnog
	required_reagents = list(/decl/material/solid/organic/meat/egg = 3, /decl/material/liquid/drink/milk = 5, /decl/material/liquid/nutriment/sugar = 5)
	result_amount = 13
	inhibitors = list(/decl/material/liquid/nutriment/flour)
	mix_message = "The mixture turns a creamy white."

/decl/chemical_reaction/recipe/vanillacola
	name = "Vanilla Cola"
	result = /decl/material/liquid/drink/cola/vanilla
	required_reagents = list(/decl/material/liquid/drink/syrup/vanilla = 1, /decl/material/liquid/drink/cola = 2)
	result_amount = 3

/decl/chemical_reaction/recipe/coffeecola
	name = "Coffee Cola"
	result = /decl/material/liquid/drink/cola/coffee
	required_reagents = list(/decl/material/liquid/drink/coffee = 1, /decl/material/liquid/drink/cola = 2)
	result_amount = 3

/decl/chemical_reaction/recipe/doogh
	name = "Doogh"
	result = /decl/material/liquid/drink/doogh
	required_reagents = list(/decl/material/liquid/drink/milk/cream = 2, /decl/material/liquid/drink/syrup/mint = 1)
	result_amount = 3

/decl/chemical_reaction/recipe/americano
	name = "Americano"
	result = /decl/material/liquid/drink/americano
	required_reagents = list(/decl/material/liquid/drink/espresso = 2, /decl/material/liquid/water = 1)
	result_amount = 3
	mix_message = "The coffee frothes up nicely."