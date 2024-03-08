[compileScript ["cvo\cvo_initPlayerLocal.sqf"]] call CBA_fnc_directCall;

#include "cvo\cbrn\cbrn_init_local.sqf"

if(!hasInterface) exitWith {}; // If headless then exit

[] execVM "HG\Setup\fn_clientInitialization.sqf";