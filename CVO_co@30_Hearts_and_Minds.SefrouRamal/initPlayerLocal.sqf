[compileScript ["cvo\cvo_initPlayerLocal.sqf"]] call CBA_fnc_directCall;


#include "cvo\cbrn\cbrn_init_local.sqf"

// Manages ACE_Spectator white/blacklist
[allPlayers, [player, coy_qm, coy_co]] call ace_spectator_fnc_updateUnits;