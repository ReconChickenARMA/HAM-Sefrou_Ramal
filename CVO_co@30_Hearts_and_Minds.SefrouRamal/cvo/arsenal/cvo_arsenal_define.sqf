/*
	Author: CVO - Mr. Zorn

	Description:
		Defines Equipment


	Returns:
		<>

	Examples:
*/


/*=================================================*
	CVO_ARSENAL_DEFINE
*=================================================*

Here, you define the Available Equipment for the CVO Arsenal
It is seperated in 3 Parts

##################
1. BASE KIT - This is Available for Everyone
##################

Variable Name: CVO_A_BASE = [];

For easier reading it is suggested to compartmentalise
and append the individual Groups to CVO_A_BASE



##################
### 2. ROLE KIT - This is dependent on the Players Role.
##################

Traits like "Medic" or "Engineer" are automatically detected,
meaning manually giving a player the medic or doctor trait isnt necessary.

##################
3. Personal KIT - Add Items to individual players based on their UID(steam64)
##################

This is based on Code blocks to allow for checks.

##################

BASE KIT gets defined once in the beginning, as it will never change during during mission.

ROLE KIT gets updated each time the arsenal opens as Roles and Traits might change mid-mission (Ad-hoc Medic)
PLAYER KIT gets updated each time the arsenal opens as it CAN be dependend on other Roles and Traits as well.


##################


*=================================================*/  


if (!hasInterface) exitWith {};
diag_log ("[CVO] [Arsenal_Define] - start");


// #####################################################
// ###### DEFINE ARSENAL BOXES HERE - objects that give accesss to the CVO Arsenal
// #####################################################
// ###### Ether Define the CVO_Arsenal_Boxes directly via array or by putting all boxes in one layer called "CVO_ARSENAL_BOXES"
// #####################################################

CVO_Arsenal_boxes = [];

/*
CVO_arsenal_boxes append [
	cvo_arsenal_1,
	cvo_arsenal_2,
	cvo_arsenal_3,
	cvo_arsenal_4,
	cvo_arsenal_5,
	cvo_arsenal_6,
	cvo_arsenal_7,
	cvo_arsenal_8,
	cvo_arsenal_9,
	cvo_arsenal_10,
	cvo_arsenal_11
];
*/

private _layerArray = (getMissionLayerEntities "CVO_Arsenal_Boxes")#0 ;
CVO_Arsenal_boxes append _layerArray;


// #####################################################
// ###### DEFINE BASE KIT HERE - AVAILABLE FOR EVERYONE
// #####################################################

CVO_A_BASE = [];

// ###### Baseline Equipment ###### 
// The Following can be mostly left as default

if (CVO_A_modLoaded_GreenMag) then {

		CVO_A_BASE append [
			"greenmag_ammo_556x45_basic_60Rnd",
			"greenmag_ammo_556x45_basic_30Rnd",

			"greenmag_ammo_762x51_basic_60Rnd",
			"greenmag_ammo_762x51_basic_30Rnd",

			"greenmag_ammo_545x39_basic_60Rnd",
			"greenmag_ammo_545x39_basic_30Rnd",

			"greenmag_ammo_762x39_basic_60Rnd",
			"greenmag_ammo_762x39_basic_30Rnd",
			
			"greenmag_ammo_9x19_basic_60Rnd",
			"greenmag_ammo_9x19_basic_30Rnd",
			
			"greenmag_ammo_762x54_basic_60Rnd",
			"greenmag_ammo_762x54_basic_30Rnd",

			"greenmag_item_speedloader"
		];
	diag_log "[CVO] [ARSENAL_DEFINE] - GreenMag added";
};


// Medical 
CVO_A_BASE append [
	"ACE_packingBandage",
	"ACE_fieldDressing",
	"ACE_tourniquet", 
	"ACE_splint",
	"ACE_morphine",
	"ACE_epinephrine", 
	"ACE_salineIV", 
	"ACE_salineIV_500",
	"ACE_salineIV_250",
	"ACE_personalAidKit",
	"ACE_bodyBag"];

// Tools & Equipment
CVO_A_BASE append [
	"ChemicalDetector_01_watch_F",

	"immersion_pops_poppack",
	"murshun_cigs_cigpack",
	"murshun_cigs_lighter",
	"murshun_cigs_matches",
	"immersion_cigs_cigar0",
	"immersion_cigs_cigar0_nv",

	"ACE_Humanitarian_Ration",

	"ACE_MapTools",
	"ace_marker_flags_yellow",
	"ace_marker_flags_red",
	"ace_marker_flags_green",
	"ace_marker_flags_blue",

	"ACE_EntrenchingTool",
	"ACE_EarPlugs",

	"ACE_SpraypaintGreen",
	"ACE_SpraypaintRed",
	"ACE_PlottingBoard",
	"ACE_UAVBattery",

	"ACE_DAGR",
	"ACE_CableTie",
	"ACE_Chemlight_Shield",
	"acex_intelitems_notepad",
	"ACE_Flashlight_KSF1",

	"ACE_WaterBottle",

	"tsp_paperclip",

	"ItemWatch",
	"ItemCompass"];

// Binoculars
CVO_A_BASE append [
	"Hate_Smartphone_HUD", 
	"Hate_Smartphone",
	"Nikon_DSLR_HUD",
	"Nikon_DSLR",
	"Old_Camera_HUD",
	"Old_Camera",
	"Old_Camera_Color_HUD",
	"Old_Camera_Color",
	"Camera_lxWS",
	"Binocular",
	"Laserdesignator",
	"LaserdesignatorGPS_01"];

// NVGs
CVO_A_BASE append [
	"ACE_NVG_Gen4",
	"ACE_NVG_Gen4_WP"
];


// Rappeling Rope 
CVO_A_BASE append [
	"AUR_Rappel_Rope_70",
	"AUR_Rappel_Rope_50",
	"AUR_Rappel_Rope_30",
	"AUR_Rappel_Rope_20",
	"AUR_Rappel_Rope_10",
	"AUR_Rappel_Gear"];

// Radios
CVO_A_BASE append  ["ACRE_PRC343"];

// ###### Wearables ###### 

// Uniforms 
CVO_A_BASE append [
	"AU_lxWS_UN_Camo2",
	"U_lxWS_UN_Camo3"];

// Vests
CVO_A_BASE append [
	"PLP_UNA_V_PlateCarrier1_F",
	"PLP_UNA_V_PlateCarrier2_F",
	"PLP_UNA_V_PlateCarrierIAGL",
	"PLP_UNA_V_PlateCarrierIA1",
	"PLP_UNA_V_CarrierRigKBT_01_heavy_F",
	"PLP_UNA_V_CarrierRigKBT_01_light_F",
	"PLP_UNA_V_CarrierRigKBT_01_F",
	"PLP_UNA_V_TacVestIR",
	"PLP_UNA_V_TacVest"
];

// Backpacks
CVO_A_BASE append [
	"B_AssaultPack_blk",
	"B_AssaultPack_cbr",
	"B_AssaultPack_khk",
	"B_Carryall_blk",
	"B_Carryall_cbr",
	"B_Carryall_khk"
	"B_FieldPack_blk",
	"B_FieldPack_cbr",
	"B_FieldPack_khk",
	"B_Kitbag_cbr",
	"B_Kitbag_tan",
	"B_AssaultPack_desert_lxWS",
	"B_Carryall_desert_lxWS",
	"B_Kitbag_desert_lxWS",
	"B_Kitbag_blk"
	];

// Headgear
CVO_A_BASE append [
	"PLP_UNA_H_HelmetB",
	"PLP_UNA_H_Cap",
	"PLP_UNA_H_MilCap",
	"PLP_UNA_H_Cap_headphones",
	"PLP_UNA_H_HelmetHBK_headset_F",
	"PLP_UNA_H_HelmetHBK_F",
	"PLP_UNA_H_HelmetHBK_ear_F",
	"PLP_UNA_H_HelmetHBK_chops_F",	
	"lxWS_H_turban_04_blue_una",
	"lxWS_H_PASGT_goggles_UN_F",
	"lxWS_H_PASGT_basic_UN_F",
	"lxWS_H_turban_03_blue_una"
	];

// Facewear
CVO_A_BASE append [
	"immersion_pops_pop0",
	"murshun_cigs_cig0",
	"immersion_cigs_cigar0"];

// ###### WEAPONS - MAIN ###### 

// Rifles
CVO_A_BASE append  [
	// R4/5 Vektors
	"arifle_Velko_lxWS",
	"arifle_VelkoR5_lxWS",
	"arifle_VelkoR5_snake_lxWS",
	
	"35Rnd_556x45_Velko_reload_tracer_green_lxWS",
	"35Rnd_556x45_Velko_snake_reload_tracer_green_lxWS",
	//SS-77 Vektor
	"LMG_S77_lxWS",
	"LMG_S77_Desert_lxWS",
	"100Rnd_762x51_S77_Green_lxWS",
	// Shotguns
	"sgun_HunterShotgun_01_F",
	"sgun_HunterShotgun_01_sawedoff_F",
	"ACE_2Rnd_12Gauge_Pellets_No0_Buck",
	"ACE_2Rnd_12Gauge_Pellets_No1_Buck",
	"ACE_2Rnd_12Gauge_Pellets_No2_Buck",
	"ACE_2Rnd_12Gauge_Pellets_No3_Buck",
	"ACE_2Rnd_12Gauge_Pellets_No4_Bird",
	"ACE_2Rnd_12Gauge_Pellets_No4_Buck",
	"2Rnd_12Gauge_Pellets",
	"2Rnd_12Gauge_Slug",
	"2rnd_HE_Mag_lxWS",
	"2rnd_Smoke_Mag_lxWS"
	
	];

// Pistols
CVO_A_BASE append ["hgun_Rook40_F",
"16Rnd_9x21_Mag"];

// Handgrenades and Throwables
CVO_A_BASE append   [

	"ACE_CTS9",
	"HandGrenade",
	"SmokeShell",
	"SmokeShellBlue",
	"SmokeShellGreen",
	"SmokeShellOrange",
	"SmokeShellPurple",
	"SmokeShellRed",
	"SmokeShellYellow",
	"MiniGrenade",
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Yellow",
	"ACE_HandFlare_Red",
	"ACE_HandFlare_White",

	"Chemlight_yellow",
	"Chemlight_red",
	"Chemlight_blue",
	"Chemlight_green",
	"ACE_Chemlight_Orange",
	"ACE_Chemlight_White",
	"ACE_Chemlight_HiWhite",
	"ACE_Chemlight_UltraHiOrange"];

// Explosives
CVO_A_BASE append [
	"tsp_popperCharge_auto_mag",
	"tsp_popperCharge_mag"];

// CBRN KIT
CVO_A_BASE append [
	"U_C_CBRN_Suit_01_Blue_F", 
	"G_AirPurifyingRespirator_01_F",
	"G_RegulatorMask_F", 
	"B_SCBA_01_F"];


// #####################################################
// ###### DEFINE ROLE KIT HERE - AVAILABLE FOR SPECIFIC ROLES
// #####################################################

// CUSTOM ROLES
// Formatting Template: [  "KEY/ROLENAME",	[  ["ARRAY OF CLASSNAMES"],{"Optional CODEBLOCK"}  ]  ]

// #####################################################
// ## HOW TO DEFINE A UNIT AS A SPECIFIC ROLE:
// ## UNIT INIT FIELD IN THE EDITOR:
// this setVariable ["CVO_A_Roles",["Officer"]];
// ## Further Notes: 
// -- "Medic" and "Engineer" are autoDetected based on ACE Skill Level  
// #####################################################


CVO_A_HASH_RoleKit = createHashMapFromArray [
	["Medic", [[
		"ACE_quikclot", 
		"ACE_elasticBandage", 
		"ACE_adenosine", 
		"ACE_plasmaIV",
		"ACE_plasmaIV_500",
		"ACE_plasmaIV_250",
		"ACE_bloodIV",
		"ACE_bloodIV_500",
		"ACE_bloodIV_250",
		"ACE_surgicalKit",
		"ACE_suture"],
	{}]],
	["Engineer", [[
		// Tools and Detectors
		"ACE_VMM3","ACE_VMH3", 
		"ACE_wirecutter", "ToolKit", 
		"ACE_Fortify", "ACE_DefusalKit",
		
		// Explosives
		"DemoCharge_Remote_Mag",	"ACE_DemoCharge_Remote_Mag_Throwable",
		"SatchelCharge_Remote_Mag",	"ACE_SatchelCharge_Remote_Mag_Throwable",

		"tsp_frameCharge_mag",
		"tsp_stickCharge_mag",
		"tsp_stickCharge_auto_mag"

], 
		{}]],
	["Officer", [
		["arifle_VelkoR5_GL_lxWS",
		"arifle_VelkoR5_GL_snake_lxWS",
		"1Rnd_HE_Grenade_shell",
		"ACE_HuntIR_M203",
		"ACE_40mm_Flare_white",
		"U_lxWS_UN_Camo1",
		"H_Beret_blk",
		"ACRE_PRC148"
		],
		{}]]
];

// #####################################################
// ###### DEFINE PLAYER KIT HERE - Based on STEAM64 ID
// #####################################################

// Formatting Template: [  "STEAM64",	["PlayerName", "["ARRAY OF CLASSNAMES"],{"Optional CODEBLOCK"}  ]  ]


CVO_A_HASH_PlayerKit = createHashMapFromArray [
	["_SP_PLAYER_", 		["Editor Debug", 	["ACE_Banana"],		{systemChat "CVO_A_Playerkit test Successful - Banana Given"; 	["ACE_Banana"]}		]	],	
	["76561197970306509", 	["Zorn", 			[	"G_Spectacles_Tinted", "G_Balaclava_blk", "H_Beret_blk"],	{[]}	]],
	["76561198090236234", 	["Recon", 			[],	{[]}	]],
	["76561198147307775", 	["Clone", 			[],	{[]}	]] 	
];

diag_log ("[CVO] [Arsenal_Define] - completed");
