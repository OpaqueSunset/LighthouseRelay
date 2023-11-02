#if !defined(USING_MAP_DATUM)

	#include "../random_ruins/exoplanet_ruins/playablecolony/playablecolony.dm"

	#include "../../mods/content/mundane.dm"
	#include "../../mods/content/bigpharma/_bigpharma.dme"
	#include "../../mods/content/baychems/_baychems.dme"
	#include "../../mods/content/corporate/_corporate.dme"
	#include "../../mods/content/dungeon_loot/_dungeon_loot.dme"
	#include "../../mods/content/genemodding/_genemodding.dme"
	#include "../../mods/content/government/_government.dme"
	#include "../../mods/content/modern_earth/_modern_earth.dme"
	#include "../../mods/content/mouse_highlights/_mouse_highlight.dme"
	#include "../../mods/content/psionics/_psionics.dme"
	#include "../../mods/content/scaling_descriptors.dm"
	#include "../../mods/content/xenobiology/_xenobiology.dme"
	#include "../../mods/content/matchmaking/_matchmaking.dme"
	#include "../../mods/content/neural_interface/_neural_interface.dme"

	#include "../../mods/content/fov_module/_fov_module.dme"

	#include "../../mods/utility/centcomdb/_centcomdb.dme"
	#include "../../mods/verbs/antighost/_subtle_antighost.dme"

	#include "../../mods/mobs/dionaea/_dionaea.dme"
	#include "../../mods/mobs/borers/_borers.dme"

	#include "../../mods/species/ascent/_ascent.dme"
	#include "../../mods/species/serpentid/_serpentid.dme"
	#include "../../mods/species/utility_frames/_utility_frames.dme"
	#include "../../mods/species/neoavians/_neoavians.dme"
	#include "../../mods/species/bayliens/_bayliens.dme"
	#include "../../mods/species/vox/_vox.dme"

	#include "../away/bearcat/bearcat.dm"
	#include "../away/casino/casino.dm"
	#include "../away/derelict/derelict.dm"
	#include "../away/errant_pisces/errant_pisces.dm"
	#include "../away/lost_supply_base/lost_supply_base.dm"
	#include "../away/magshield/magshield.dm"
	#include "../away/mining/mining.dm"
	#include "../away/mobius_rift/mobius_rift.dm"
	#include "../away/smugglers/smugglers.dm"
	#include "../away/slavers/slavers_base.dm"
	#include "../away/unishi/unishi.dm"
	#include "../away/yacht/yacht.dm"
	#include "../away/liberia/liberia.dm"

	// Loaded after other modpacks to override everything where needed.
	#include "../../mods/content/lighthouse/_lighthouse.dme"

	#include "tether_leveldata.dm"
	#include "tether_unit_testing.dm"

	#include "atoms/areas.dm"
	#include "atoms/clothing.dm"
	#include "atoms/decals.dm"
	#include "atoms/effects.dm"
	#include "atoms/flora.dm"
	#include "atoms/fence.dm"
	#include "atoms/kink.dm"
	#include "atoms/permits.dm"
	#include "atoms/props.dm"
	#include "atoms/random.dm"
	#include "atoms/reagents.dm"
	#include "atoms/stacks.dm"
	#include "atoms/turfs.dm"
	#include "atoms/tether_presets.dm"
	#include "atoms/weapons.dm"
	#include "atoms/unimplemented/stubs.dm"
	#include "atoms/unimplemented/books.dm"
	#include "atoms/unimplemented/benches.dm"
	#include "atoms/unimplemented/clothing.dm"
	#include "atoms/unimplemented/decals.dm"
	#include "atoms/unimplemented/signs.dm"
	#include "atoms/unimplemented/turfs.dm"
	#include "atoms/unimplemented/weapons.dm"
	#include "datums/tether_access.dm"
	#include "datums/tether_departments.dm"
	#include "datums/tether_spawnpoints.dm"

	#include "submaps/engine/engine_areas.dm"
	#include "submaps/engine/engine.dm"

	#include "main_dmms/tether-01-surface1.dmm"
	#include "main_dmms/tether-02-surface2.dmm"
	#include "main_dmms/tether-03-surface3.dmm"
	#include "main_dmms/tether-04-transit.dmm"
	#include "main_dmms/tether-05-station1.dmm"
	#include "main_dmms/tether-06-station2.dmm"
	#include "main_dmms/tether-07-station3.dmm"
	#include "main_dmms/tether-08-mining.dmm"
	#include "main_dmms/tether-09-solars.dmm"
	#include "main_dmms/tether-10-colony.dmm"
	#include "submaps/tether_misc.dmm"
	#include "submaps/tether_ships.dmm"

	#define USING_MAP_DATUM /datum/map/tether

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Tradeship

#endif
