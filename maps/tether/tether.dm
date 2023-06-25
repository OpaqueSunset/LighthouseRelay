#if !defined(USING_MAP_DATUM)

	#include "tether_defines.dm"
	#include "tether_turfs.dm"
	#include "tether_things.dm"
	#include "tether_areas.dm"
	#include "tether_areas2.dm"
	#include "tether_shuttle_defs.dm"
	#include "tether_shuttles.dm"
	#include "tether_telecomms.dm"

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

	#include "submaps/_tether_submaps.dm"

	#define USING_MAP_DATUM /datum/map/tether

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Tether

#endif
