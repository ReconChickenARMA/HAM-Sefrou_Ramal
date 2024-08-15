// ################
// EXAMPLE USAGE
// 
/*
[
	btc_create_object, 
	"Monkey Care Package",
	[
		["Ace_banana", 100],
		["Ace_banana", 100]
	],
	"Land_WoodenCrate_01_F"
] call CVO_CSC_fnc_addCSC;
*/
// ################

// ################
// Vanilla Ammo Crates
// ################
/*
"Box_NATO_Ammo_F", 
"Box_NATO_Wps_F", 
"Box_NATO_AmmoOrd_F", 
"Box_NATO_Equip_F", 
"Box_NATO_WpsSpecial_F", 
"Box_NATO_WpsLaunch_F", 
"Box_NATO_Uniforms_F", 
"Box_NATO_Support_F", 
"Box_NATO_AmmoVeh_F", 
"B_CargoNet_01_ammo_F",
"ACE_medicalSupplyCrate"
*/


private _cvo_csc_source = cvo_csc_source;


[
	_cvo_csc_source, 		// source obj/class
	"General Ammo Package",	// Name String
	[
		["Aegis_20Rnd_762x51_slr_reload_tracer_red_lxWS",10],
		["1Rnd_40mm_HE_lxWS",10],
		//["3Rnd_UGL_FlareWhite_F",5], // <- not part of the arsenal as of now?
		["1Rnd_50mm_Smoke_lxWS",5],
		//["3Rnd_HE_Grenade_shell",5], // <- not part of the arsenal as of now?

		["1Rnd_RC40_HE_shell_RF", 3],
		["1Rnd_RC40_shell_RF", 3],

		["greenmag_ammo_762x51_basic_60Rnd",10],
		["greenmag_beltlinked_762x51_basic_100",5],
		//["greenmag_ammo_556x45_basic_60Rnd",5],
		//["greenmag_ammo_127x108_basic_60Rnd",5],

		["HandGrenade",10],
		["SmokeShell",5],
		["1Rnd_Smoke_Grenade_shell",5],
		["100Rnd_762x51_S77_Red_lxWS",5],
		["17Rnd_9x21_Mag",10],
		["ACE_SpareBarrel", 2],
		["greenmag_ammo_9x21_basic_60Rnd",5],

		["greenmag_item_speedloader", 4]
	],						// Array
	"Box_NATO_Ammo_F",		// Class of Crate
	[],						// Array of Backpacks
	btc_create_object_point
] call CVO_CSC_fnc_addCSC;


[
	_cvo_csc_source, 
	"Medical Resupply Package",
	[
		["ACE_surgicalKit", 1],
		["ACE_suture", 100],

		["ACE_bodyBag", 25],
		["ACE_personalAidKit", 15],
		
		["ACE_salineIV", 10],
		["ACE_salineIV_500", 20],

		["ACE_fieldDressing",  40],
		["ACE_packingBandage", 40],
		["ACE_elasticBandage", 50]

	],
	"ACE_medicalSupplyCrate_advanced",		// Class of Crate
	[],						// Array of Backpacks
	btc_create_object_point
] call CVO_CSC_fnc_addCSC;


[
	_cvo_csc_source, 
	"Combat Patrol Package",
	[
		["ACE_personalAidKit", 5],
		["ACE_salineIV_500", 5],
		["ACE_Humanitarian_Ration", 25],
		["ACE_fieldDressing", 30],
		["ACE_packingBandage", 30],
		["ACE_elasticBandage", 10],

		["ace_marker_flags_red", 25],
		["ace_marker_flags_green", 25],

		["ACE_EarPlugs", 10],
		["ACE_SpraypaintRed", 2],
		["ACE_CableTie", 20],

		["ACE_HandFlare_White", 20],
		
		//["greenmag_ammo_127x108_basic_60Rnd",5],
		//["greenmag_ammo_556x45_basic_60Rnd",10],
		["100Rnd_762x51_S77_Red_lxWS",5],
		["Aegis_20Rnd_762x51_slr_reload_tracer_red_lxWS",20],
		["greenmag_ammo_762x51_basic_60Rnd",10],
		["greenmag_beltlinked_762x51_basic_100",10],

		["ACE_bodyBag", 10]

	],
	"Box_NATO_Equip_F",		// Class of Crate
	[],						// Array of Backpacks
	btc_create_object_point
] call CVO_CSC_fnc_addCSC;

/*
[
	_cvo_csc_source, 
	"PKM Package",
	[
		["rhs_weap_pkm",1],
		["rhs_100Rnd_762x54mmR", 5],
		["rhs_100Rnd_762x54mmR_green", 5],
		["greenmag_beltlinked_762x54_basic_100",20],
		["greenmag_item_speedloader",1]
	],
	"Box_NATO_WpsSpecial_F",		// Class of Crate
	[],						// Array of Backpacks
	btc_create_object_point
] call CVO_CSC_fnc_addCSC;
*/

/*
[
	_cvo_csc_source, 
	"Metis HAT Package",
	[
		["ACE_EntrenchingTool",1],
		["ace_compat_rhs_afrf3_metis_carry", 1],
		["ace_compat_rhs_afrf3_mag_9M131F", 3],
		["ace_compat_rhs_afrf3_mag_9M131M", 7]
	],
	"Box_NATO_WpsSpecial_F",		// Class of Crate
	[],						// Array of Backpacks
	btc_create_object_point						 
] call CVO_CSC_fnc_addCSC;
*/


[
	_cvo_csc_source, 
	"CBRN Package (4 Kits)",
	[
		["U_C_CBRN_Suit_01_Blue_F", 4],
		["G_RegulatorMask_F", 4],
		["ChemicalDetector_01_watch_F", 4]
	],
	"Box_NATO_Uniforms_F",									
	[
		["B_SCBA_01_F",4]
	],	
	btc_create_object_point
] call CVO_CSC_fnc_addCSC;


[
	_cvo_csc_source, 		// source obj/class
	"Vehicle Ammo Package",	// Name String
	[],						// Array
	"VirtualReammoBox_small_F",		// Class of Crate
	[],						// Array of Backpacks
	btc_create_object_point,
	createHashMapFromArray [
		["ace_rearm_source", true],
		["ace_rearm_source_value", 50],

		["ace_cargo_setSize", 2],
		["ace_carry_canCarry", false]
	]
] call CVO_CSC_fnc_addCSC;

[
	_cvo_csc_source, 						// source obj/class
	"Small Vehicle Ammo Package",			// Name String
	[],										// Array
	"Land_Proxy_UsBasicAmmoBoxBig_F",		// Class of Crate
	[],										// Array of Backpacks
	btc_create_object_point,
	createHashMapFromArray [
		["ace_rearm_source", true],
		["ace_rearm_source_value", 20],

		["ace_cargo_setSize", 1],
		["ace_carry_canCarry", true]
	]
] call CVO_CSC_fnc_addCSC;


[
	_cvo_csc_source, 		// source obj/class
	"Vehicle Maintainance Package",	// Name String
	[
		["ToolKit", 1]
	],								// Array
	"Land_WoodenCrate_01_F",		// Class of Crate
	[],								// Array of Backpacks
	btc_create_object_point,
	createHashMapFromArray [
		["ace_repair_vehicle", true],

		["ace_refuel_source", true],
		["ace_refuel_source_value", 20],

		["ace_cargo_setSize", 2],
		["ace_carry_canCarry", false]
	]
] call CVO_CSC_fnc_addCSC;