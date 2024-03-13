cvo_CSC_fnc_addCSC_old = 		compileScript ["cvo\CSC\cvo_CSC_fnc_addCSC.sqf", 	false, ""];
cvo_CSC_fnc_spawnCSC_old = 		compileScript ["cvo\CSC\cvo_CSC_fnc_spawnCSC.sqf", 	false, ""];

 
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
] call cvo_CSC_fnc_addCSC_old;
*/
// ################

// ################
// GM Ammo Crates
// ################
/*
"gm_ammobox_aluminium_01_empty", 
"gm_ammobox_aluminium_02_empty", 
"gm_ammobox_aluminium_03_empty", 
"gm_ammobox_aluminium_04_empty", 
"gm_ammobox_aluminium_05_empty",
"gm_ammobox_aluminium_06_empty", 
"gm_ammobox_aluminium_07_empty", 
"gm_AmmoBox_wood_01_empty", 
"gm_AmmoBox_wood_02_empty", 
"gm_AmmoBox_wood_03_empty", 
"gm_AmmoBox_wood_04_empty", 
"gm_AmmoBox_wood_05_empty", 
"gm_AmmoBox_wood_06_empty", 

"gm_ammobox_pallet_01_empty", 
*/





_cvo_csc_source = "Land_Cargo10_military_green_F";


[
	_cvo_csc_source, 
	"Basic Ammo Package",
	[
		["35Rnd_556x45_Velko_reload_tracer_red_lxWS",20],
		["1Rnd_HE_Grenade_shell",10],
		["ACE_40mm_Flare_white",10],

		["greenmag_ammo_556x45_basic_60Rnd",10],
		["greenmag_beltlinked_762x51_basic_100",10],
		

		["HandGrenade",10],
		["SmokeShell",10],
		["ACE_HuntIR_M203",5],
		["1Rnd_Smoke_Grenade_shell",10],
		["100Rnd_762x51_S77_Red_lxWS",10],
		["9Rnd_45ACP_Mag",10],
		["greenmag_ammo_45ACP_basic_60Rnd",5],

		["greenmag_item_speedloader", 4]
	],
	"Land_WoodenCrate_01_F"
] call cvo_CSC_fnc_addCSC_old;


[
	_cvo_csc_source, 
	"Medical Package",
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
	"ACE_medicalSupplyCrate_advanced"
] call cvo_CSC_fnc_addCSC_old;


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

		["100Rnd_762x51_S77_Red_lxWS",5],
		["35Rnd_556x45_Velko_reload_tracer_red_lxWS",20],
		["greenmag_ammo_556x45_basic_60Rnd",10],
		["greenmag_beltlinked_762x51_basic_100",10],

		["ACE_bodyBag", 10]

	],
	"Land_WoodenCrate_01_F"
] call cvo_CSC_fnc_addCSC_old;

/*
[
	_cvo_csc_source, 
	"General Purpose Patrol Package",
	[
	
		["ACE_personalAidKit", 5],
		["ACE_salineIV_500", 5],
		["ACE_fieldDressing", 30],
		["ACE_packingBandage", 30],

		["ACE_Humanitarian_Ration", 25],

		["ace_marker_flags_red", 25],
		["ace_marker_flags_green", 25],

		["ACE_EarPlugs", 5],
		["ACE_SpraypaintRed", 2],
		["ACE_CableTie", 20],

		["ACE_HandFlare_White", 10],

		["gm_30Rnd_9x19mm_B_DM51_mp5a3_blk",20],


		["ACE_bodyBag", 5]
	],
	"gm_ammobox_aluminium_01_empty"
] call cvo_CSC_fnc_addCSC_old;
*/


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
	"rhs_7ya37_1_single"
] call cvo_CSC_fnc_addCSC_old;
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
	"Land_WoodenCrate_01_F"							 
] call cvo_CSC_fnc_addCSC_old;
*/


[
	_cvo_csc_source, 
	"CBRN Package (4 Kits)",
	[
		["U_C_CBRN_Suit_01_Blue_F", 4],
		["G_RegulatorMask_F", 4],
		["ChemicalDetector_01_watch_F", 4]
	],
	"Land_PlasticCase_01_large_CBRN_F",									
	[
		["B_SCBA_01_F",4]
	]
] call cvo_CSC_fnc_addCSC_old;
