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


diag_log ("[CVO] [Arsenal_Define] - start");


// #####################################################
// ###### DEFINE ARSENAL BOXES HERE - objects that give accesss to the CVO Arsenal
// #####################################################
// ######  Define the Editor Layername here
// #####################################################

#define EDITOR_LAYER_NAME "CVO_Arsenal_Boxes"

// #####################################################
// ###### CODE - DONT CHANGE
// #####################################################

if (isServer) then {
	_array = (getMissionLayerEntities EDITOR_LAYER_NAME)#0;
	[_array] remoteExecCall ["CVO_ARSENAL_fnc_addArsenalInteraction", [0,-2] select isDedicated, true];
};

if (!hasInterface) exitWith {};

// #####################################################
// ###### DEFINE BASE KIT HERE - AVAILABLE FOR EVERYONE
// #####################################################

CVO_A_BASE = [];

// ###### Baseline Equipment ###### 
// The Following can be mostly left as default



if (isClass (configfile >> "CfgPatches" >> "greenmag_main")) then {

		CVO_A_BASE append [
			//"greenmag_ammo_556x45_basic_60Rnd",
			//"greenmag_ammo_556x45_basic_30Rnd",

			"greenmag_ammo_762x51_basic_60Rnd",
			"greenmag_ammo_762x51_basic_30Rnd",

			//"greenmag_ammo_545x39_basic_60Rnd",
			//"greenmag_ammo_545x39_basic_30Rnd",

			//"greenmag_ammo_762x39_basic_60Rnd",
			//"greenmag_ammo_762x39_basic_30Rnd",
			
			"greenmag_ammo_9x21_basic_60Rnd",
			"greenmag_ammo_9x21_basic_30Rnd",

			//"greenmag_ammo_45ACP_basic_30Rnd",
			//"greenmag_ammo_45ACP_basic_60Rnd",
		
			//"greenmag_ammo_762x54_basic_60Rnd",
			//"greenmag_ammo_762x54_basic_30Rnd",

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

private _rations = [
	"ACE_MRE_BeefStew",
	"ACE_MRE_ChickenTikkaMasala",
	"ACE_MRE_ChickenHerbDumplings",
	"ACE_MRE_CreamChickenSoup",
	"ACE_MRE_CreamTomatoSoup",
	"ACE_MRE_LambCurry",
	"ACE_MRE_MeatballsPasta",
	"ACE_MRE_SteakVegetables"
];
CVO_A_BASE append _rations;

CVO_A_BASE append [
	"ChemicalDetector_01_watch_F",
	"ItemAndroid",
	"ItemcTabHCam",

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
	"ACE_Canteen",	

	"tsp_paperclip",

	"ItemMap",
	"ItemWatch",
	"ItemCompass"];

// Binoculars
CVO_A_BASE append [
	"Nikon_DSLR_HUD",
	"Nikon_DSLR",
	"Binocular"
	];

// NVGs
CVO_A_BASE append [	
	//actual nvgs
	//"ACE_NVG_Gen4",
	"ACE_NVG_Gen3_WP",
	//armbands
	"Aegis_NV_G_Armband_Blu_Alt_F",
	"Aegis_NV_G_Armband_Blu_F",
	//cigs and lollipop
	"immersion_cigs_cigar0_nv",
	"murshun_cigs_cig0_nv"
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
	//mgp g3 uniforms 
	/*"milgp_u_g3_field_set_3cd",
	"milgp_u_g3_field_set_aor1",
	"milgp_u_g3_field_set_atacsau",
	"milgp_u_g3_field_set_khk",
	"milgp_u_g3_field_set_rolled_3cd",
	"milgp_u_g3_field_set_rolled_aor1",
	"milgp_u_g3_field_set_rolled_atacsau",
	"milgp_u_g3_field_set_rolled_khk",
	"milgp_u_g3_field_set_rolled_mcarid",
	"milgp_u_tshirt_g3_field_pants_3CD",
	"milgp_u_tshirt_g3_field_pants_aor1",
	"milgp_u_tshirt_g3_field_pants_atacsau",
	"milgp_u_tshirt_g3_field_pants_khk",
	"milgp_u_tshirt_g3_field_pants_mcarid",
	*/
	//Low Vis Clothing
	"WSLV_Black_gn_black_Camo",
	"WSLV_Black_black_Camo",
	"WSLV_Black_blue_stripes_Camo",
	"WSLV_Black_blue_Camo",
	"WSLV_Black_brown_Camo",
	"WSLV_Black_gn_green_Camo",
	"WSLV_Black_green_Camo",
	"WSLV_Black_grey_Camo",
	"WSLV_Black_sand_Camo",
	"WSLV_Black_white_Camo",
	"WSLV_Black_gn_wine_Camo",
	"WSLV_Black_yellow_Camo",
	"WSLV_Brown_gn_black_Camo",
	"WSLV_Brown_black_Camo",
	"WSLV_Brown_blue_stripes_Camo",
	"WSLV_Brown_blue_Camo",
	"WSLV_Brown_brown_Camo",
	"WSLV_Brown_gn_green_Camo",
	"WSLV_Brown_green_Camo",
	"WSLV_Brown_grey_Camo",
	"WSLV_Brown_sand_Camo",
	"WSLV_Brown_white_Camo",
	"WSLV_Brown_gn_wine_Camo",
	"WSLV_Brown_yellow_Camo",
	//UNA uniforms
	"U_lxWS_UN_Camo3",
	"U_lxWS_UN_Camo2"];

// Vests
CVO_A_BASE append [
	"Aegis_V_OCarrierLuchnik_Lite_blk_F",
	"PLP_UNA_V_TacVestIR",
	"PLP_UNA_V_TacVest",
	"PLP_UNA_V_CarrierRigKBT_01_light_F"
];

// Backpacks
CVO_A_BASE append [
	"B_LegStrapBag_coyote_F",
	"B_AssaultPack_cbr",
	"B_AssaultPackSpec_cbr",
	"B_Carryall_cbr",
	"B_FieldPack_cbr",
	"B_Kitbag_cbr",
	"Aegis_B_patrolBackpack_cbr_F"
	];

// Headgear
CVO_A_BASE append [
	"PLP_UNA_H_HelmetB",
	"Aegis_H_Booniehat_UNO_hs_F",
	"Aegis_H_Booniehat_UNO_F",
	"PLP_UNA_H_Cap",
	"PLP_UNA_H_MilCap",
	"PLP_UNA_H_Cap_headphones",
	//UNA Turbans
	"lxWS_H_turban_04_blue_una",
	"lxWS_H_turban_02_blue_una",
	"lxWS_H_turban_01_blue_una",
	"lxWS_H_turban_03_blue_una",
	"lxWS_H_PASGT_goggles_UN_F",
	"lxWS_H_PASGT_basic_UN_F"
	];

// Facewear
CVO_A_BASE append [
	//vanilla+ glasses
	"G_Aviator",
	"G_Glasses_black_RF",
	"G_Glasses_white_RF",
	"G_Spectacles",
	"G_Tactical_Clear",
	"G_Tactical_Yellow",
	"G_Lady_Blue",
	"G_Shades_Black",
	"G_Shades_Blue",
	"G_Shades_Green",
	"G_Shades_Red",
	"G_Tactical_Black",
	"G_Shades_Yellowred",
	"G_Shemag_shades",
	"G_Tactical_Camo",
	"G_Squares_Tinted",
	"G_Shemag_tactical",
	//milgear glasses
	"milgp_f_tactical_khk",
	"milgp_f_face_shield_shades_BLK",
	"milgp_f_face_shield_shades_CB",
	"milgp_f_face_shield_shades_khk",
	"milgp_f_face_shield_shades_RGR",
	"milgp_f_face_shield_shades_shemagh_BLK",
	"milgp_f_face_shield_shades_shemagh_CB",
	"milgp_f_face_shield_shades_shemagh_khk",
	"milgp_f_face_shield_shades_shemagh_RGR",
	//vanilla goggles
	"G_Balaclava_combat",
	"G_Balaclava_lowprofile",
	"G_Combat",
	"G_Combat_Goggles_blk_F",
	"G_Combat_lxWS",
	"G_Balaclava_light_G_blk_F",
	"G_Lowprofile",
	//milgear goggles
	"milgp_f_face_shield_goggles_BLK",
	"milgp_f_face_shield_goggles_CB",
	"milgp_f_face_shield_goggles_khk",
	"milgp_f_face_shield_goggles_RGR",
	"milgp_f_face_shield_goggles_shemagh_BLK",
	"milgp_f_face_shield_goggles_shemagh_CB",
	"milgp_f_face_shield_goggles_shemagh_khk",
	"milgp_f_face_shield_goggles_shemagh_RGR",
	"milgp_f_goggles_khk",
	//vanilla+ misc 
	"G_Headset_light",
	"G_Shemag_khk",
	"G_Shemag_oli",
	"G_Shemag_red",
	"G_Shemag_tan",
	"G_Shemag_white",
	"Aegis_G_Condor_EyePro_F",
	"G_Headset_Tactical",
	"G_Headset_Tactical_khk",
	"G_Headset_Tactical_grn",
	"G_Balaclava_blk_lxWS",
	"G_Balaclava_snd_lxWS",
	"G_Headset_lxWS",
	//milgear misc 
	"milgp_f_face_shield_BLK",
	"milgp_f_face_shield_CB",
	"milgp_f_face_shield_khk",
	"milgp_f_face_shield_RGR",
	"milgp_f_face_shield_shemagh_BLK",
	"milgp_f_face_shield_shemagh_CB",
	"milgp_f_face_shield_shemagh_khk",
	"milgp_f_face_shield_shemagh_RGR",
	//vanilla+ armbands
	"Aegis_G_Armband_BLU_F",
	"Aegis_G_Armband_BLU_alt_F",
	//cigs and lollipop
	"immersion_pops_pop0",
	"murshun_cigs_cig0",
	"immersion_cigs_cigar0"];

// ###### WEAPONS - MAIN ###### 

// Rifles
CVO_A_BASE append  [
	// FALs
	"arifle_SLR_lxWS",
	"arifle_SLR_D_lxWS",
	"arifle_SLR_V_lxWS",	
	//20rnd magazines
	"Aegis_20Rnd_762x51_slr_tracer_red_lxWS",
	"20Rnd_762x51_slr_lxWS",
	"20Rnd_762x51_slr_desert_lxWS",
	"20Rnd_762x51_slr_Snake_tracer_Red_lxWS",
	//flashlight 
	"acc_flashlight",
	//suppressors
	"muzzle_snds_B",
	"muzzle_snds_B_arid_F",
	"muzzle_snds_B_snd_F",
	"suppressor_h_lxWS",
	"suppressor_h_arid_lxWS",
	"suppressor_h_sand_lxWS",
	"suppressor_h_snake_lxWS",
	//basic optics
	"optic_ACO_grn_desert_RF",
	"optic_ACO_desert_RF",
	"optic_ACO_grn",
	"optic_Aco",
	"optic_Holosight",
	"optic_Holosight_blk_F",
	"optic_Holosight_arid_F",
	"optic_Holosight_snake_lxWS",
	"Aegis_optic_ICO",
	"Aegis_optic_ICO_sand",
	"Aegis_optic_ROS",
	"optic_r1_high_black_sand_lxWS",
	"optic_r1_high_sand_lxWS",
	"optic_r1_high_snake_lxWS",
	"optic_r1_high_lxWS",
	"optic_r1_low_lxWS",
	"optic_r1_low_sand_lxWS",
	"optic_r1_low_snake_lxWS",
	"saber_light_lxWS"
	];

// Pistols
CVO_A_BASE append [
	"acc_flashlight_pistol",
	"hgun_Rook40_F",
	"hgun_P07_F",
	"hgun_G17_F",
	"16Rnd_9x21_Mag_v2",
	"hgun_Rook40_F",
	"17Rnd_9x21_Mag"
	];

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
	
	];

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
		"arifle_SLR_Para_lxWS",
		"arifle_SLR_Para_snake_lxWS",
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
		"arifle_SLR_Para_lxWS",
		"arifle_SLR_Para_snake_lxWS",
		//Helmets and armor 
		"Aegis_V_OCarrierLuchnik_CQB_blk_F",
		"H_HelmetHeavy_White_RF",
		"H_HelmetHeavy_Simple_White_RF",
		"H_HelmetHeavy_VisorUp_White_RF",
		"PLP_UNA_V_CarrierRigKBT_01_heavy_F",
		// Tools and Detectors
		"ACE_VMM3","ACE_VMH3", 
		"ACE_wirecutter", "ToolKit", 
		"ACE_Fortify", "ACE_DefusalKit",

		//aa12
		"sgun_aa40_lxWS",
		"sgun_aa40_tan_lxWS",
		"sgun_aa40_snake_lxWS",
		"8Rnd_12Gauge_AA40_Slug_lxWS",
		"8Rnd_12Gauge_AA40_Slug_Snake_lxWS",
		"8Rnd_12Gauge_AA40_Slug_Tan_lxWS",
		"8Rnd_12Gauge_AA40_Pellets_lxWS",
		"8Rnd_12Gauge_AA40_Pellets_Snake_lxWS",
		"8Rnd_12Gauge_AA40_Pellets_Tan_lxWS",
		
		//M4 Shotgun
		"sgun_M4_F",
		"8Rnd_12Gauge_Slug",
		"8Rnd_12Gauge_Pellets",
		
		// Explosives
		"tsp_breach_popper_mag",
		"tsp_breach_popper_auto_mag",
		//"tsp_breach_silhouette_mag",
		//"tsp_breach_stick_mag",
		"ACE_Clacker",
		"DemoCharge_Remote_Mag",	"ACE_DemoCharge_Remote_Mag_Throwable",
		"SatchelCharge_Remote_Mag",	"ACE_SatchelCharge_Remote_Mag_Throwable"

		
		], 
		{}]],
	["Machinegunner", [[
		//SS-77 Vektor
		"LMG_S77_Desert_lxWS",
		"LMG_S77_lxWS",
		"LMG_S77_Compact_lxWS",
		"LMG_S77_Compact_Snakeskin_lxWS",
		//100 rnd belts
		"100Rnd_762x51_S77_Red_lxWS",
		"100Rnd_762x51_S77_lxWS",
		//30rnd FAL mags
		"Aegis_30Rnd_762x51_slr_tracer_red_lxWS",
		"30Rnd_762x51_slr_Snake_tracer_Red_lxWS",
		"30Rnd_762x51_slr_lxWS",
		// Greenmag
		"greenmag_beltlinked_762x51_basic_100",

		"ACE_SpareBarrel"

		], 
	{}]],
	["Anti-Tank", [[		
		//RPG-32
		//"launch_RPG32_tan_lxWS",
		//"RPG32_F",
		//"RPG32_HE_F",
		//MPRL Compact
		//"launch_B_Titan_short_F",
		//"Titan_AT",
		//GM6 Lynx
		"srifle_GM6_F",
		"srifle_GM6_snake_lxWS",
		"optic_VRCO_RF",
		"optic_VRCO_tan_RF",
		"optic_Hamr",
		"optic_Hamr_snake_lxWS",
		"optic_Hamr_sand_lxWS",
		"greenmag_ammo_127x108_basic_30Rnd",
		"5Rnd_127x108_APDS_Mag",
		"ACE_Tripod",
		//FAL GL and ammo
		"arifle_SLR_GL_lxWS",
		"arifle_SLR_V_GL_lxWS",
		"1Rnd_50mm_Smoke_lxWS",
		"1Rnd_58mm_AT_lxWS"
		], 
	{}]],
	["Marksman", [[
		//Mk 14 EBR
		"srifle_EBR_blk_lxWS",
		"srifle_EBR_snake_lxWS",
		"20Rnd_762x51_Mag_blk_lxWS",
		"20Rnd_762x51_Mag_snake_lxWS",
		"ace_20rnd_762x51_mag_tracer",
		//HADES H6 rifle
		"srifle_h6_blk_rf",
		"srifle_h6_tan_rf",		
		"suppressor_l_lxWS",
		"suppressor_l_sand_lxWS",		
		"bipod_02_F_arid",
		"bipod_01_F_snd",
		"bipod_02_F_tan",
		"bipod_03_F_blk",
		"bipod_02_F_blk",
		"bipod_01_F_blk",
		//ammo
		"greenmag_ammo_556x45_basic_60Rnd",
		"greenmag_ammo_556x45_basic_30Rnd",
		"10Rnd_556x45_AP_Stanag_red_RF",
		"10Rnd_556x45_AP_Stanag_red_Tan_RF",
		//accessories
		"optic_DMS",
		"optic_DMS_snake_lxWS",
		"suppressor_h_lxWS",
		"suppressor_h_sand_lxWS",
		"suppressor_h_snake_lxWS",
		"ACE_Tripod",
		"ACE_RangeCard"
		], 
	{}]],
	["Drone Operator", [
		[
		//gunbag
		"ace_gunbag_Tan",
		//AR-2 Darter 
		"ION_UAV_01_backpack_lxWS",
		//GLX grenade launcher and ammo
		"glaunch_GLX_snake_lxWS",
		"glaunch_GLX_lxWS",
		"glaunch_GLX_tan_lxWS",
		"1Rnd_RC40_HE_shell_RF",
		"1Rnd_RC40_shell_RF",
		"1Rnd_RC40_SmokeBlue_shell_RF",
		"1Rnd_RC40_SmokeGreen_shell_RF",
		"1Rnd_RC40_SmokeOrange_shell_RF",
		"1Rnd_RC40_SmokeRed_shell_RF",
		"1Rnd_RC40_SmokeWhite_shell_RF",
		//spectrum device
		"hgun_esd_01_F",
		"acc_esd_01_flashlight",
		"muzzle_antenna_01_f",
		"muzzle_antenna_03_f",
		"muzzle_antenna_02_f",
		//drone terminal
		"B_UavTerminal",
		
		//LR radio
		"ACRE_PRC148"],
	{}]],
	["Interpreter", [[
		"arifle_SLR_Para_lxWS",
		"arifle_SLR_Para_snake_lxWS"		
		],
	{}]],
	["Officer", [
		[
		//GLX grenade launcher and ammo
		"glaunch_GLX_snake_lxWS",
		"glaunch_GLX_lxWS",
		"glaunch_GLX_tan_lxWS",
		"3Rnd_UGL_FlareGreen_F",
		"3Rnd_UGL_FlareRed_F",
		"3Rnd_UGL_FlareWhite_F",
		"3Rnd_UGL_FlareYellow_F",
		"3Rnd_SmokeBlue_Grenade_shell",
		"3Rnd_SmokeGreen_Grenade_shell",
		"3Rnd_SmokeOrange_Grenade_shell",
		"3Rnd_SmokePurple_Grenade_shell",
		"3Rnd_SmokeRed_Grenade_shell",
		"3Rnd_Smoke_Grenade_shell",
		"3Rnd_SmokeYellow_Grenade_shell",
		"3Rnd_Pellets_Grenade_shell",

		//FAL para 
		"arifle_SLR_Para_lxWS",
		"arifle_SLR_Para_snake_lxWS",

		//FAL GL and ammo
		"arifle_SLR_GL_lxWS",
		"arifle_SLR_V_GL_lxWS",
		"1Rnd_40mm_HE_lxWS",
		"1Rnd_50mm_Smoke_lxWS",
		"1Rnd_58mm_AT_lxWS",
		//officer uniform
		"U_lxWS_UN_Camo1",
		"lxWS_H_Beret_Colonel",

		//officer tech
		"optic_VRCO_RF",
		"optic_VRCO_tan_RF",
		"optic_Hamr",
		"optic_Hamr_snake_lxWS",
		"optic_Hamr_sand_lxWS",
		"ItemcTab",

		//Laser Designator
		"Laserdesignator",
		"LaserdesignatorGPS_01",
		"Laserbatteries",

		"ACRE_PRC148"
		],
		{}]]
];

// #####################################################
// ###### DEFINE PLAYER KIT HERE - Based on STEAM64 ID
// #####################################################

// Formatting Template: [  "STEAM64",	["PlayerName", "["ARRAY OF CLASSNAMES"],{"Optional CODEBLOCK"}  ]  ]


CVO_A_HASH_PlayerKit = createHashMapFromArray [
	["_SP_PLAYER_", 		["Editor Debug", 	["ACE_Banana"],		{systemChat "CVO_A_Playerkit test Successful - ACE_Sandbag_empty Given"; 	["ACE_Sandbag_empty"]}		]	],	
	["76561197970306509", 	["Zorn", 			["G_Spectacles_Tinted", "G_Balaclava_blk", "H_Beret_blk", "B_LegStrapBag_black_F", "WSLV_Brown_gn_black_Camo", "ACE_SpraypaintBlack"],	{[]}	]],
	["76561198090236234", 	["Recon", 			[],	{[]}	]],
	["76561198147307775", 	["Clone", 			[],	{[]}	]] 	
];


////////////////////////////////////////////
///////////// Default Loadouts /////////////
////////////////////////////////////////////


[
	"Rifleman - Empty",
	[[[],[],[],["U_lxWS_UN_Camo3",[["ACE_packingBandage",10],["ACE_fieldDressing",10],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_tourniquet",2],["ACE_splint",1],["ACE_CableTie",2],["ACE_EarPlugs",2],["ACE_MapTools",1],["ACE_Chemlight_Shield",1],["ACE_bodyBag",2],["acex_intelitems_notepad",1,1],["ACE_Chemlight_Orange",2,1]]],["PLP_UNA_V_CarrierRigKBT_01_light_F",[["ACRE_PRC343",1],["ACE_SpraypaintRed",1],["SmokeShell",2,1],["HandGrenade",2,1]]],["B_LegStrapBag_coyote_F",[["ACE_WaterBottle",2],[selectRandom _rations,1],["ACE_bodyBag",1],["ACE_personalAidKit",1],["ACE_salineIV_250",1],["greenmag_item_speedloader",1],["SmokeShell",2,1]]],"PLP_UNA_H_Cap","",["Binocular","","","",[],[],""],["ItemMap","ItemAndroid","","ItemCompass","ItemWatch",""]],[["ace_arsenal_insignia","CVO_insignia_11_PVT"],["grad_slingHelmet","PLP_UNA_H_HelmetB"]]]
] call ace_arsenal_fnc_addDefaultLoadout;

[
	"Rifleman - Basic",
	[[["arifle_SLR_V_lxWS","","","optic_r1_high_lxWS",["20Rnd_762x51_slr_lxWS",20],[],""],[],[],["U_lxWS_UN_Camo3",[["ACE_packingBandage",10],["ACE_fieldDressing",10],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_tourniquet",2],["ACE_splint",1],["ACE_CableTie",2],["ACE_EarPlugs",2],["ACE_MapTools",1],["ACE_Chemlight_Shield",1],["ACE_bodyBag",2],["acex_intelitems_notepad",1,1],["ACE_Chemlight_Orange",2,1]]],["PLP_UNA_V_CarrierRigKBT_01_light_F",[["ACRE_PRC343",1],["ACE_SpraypaintRed",1],["SmokeShell",2,1],["HandGrenade",2,1],["Aegis_20Rnd_762x51_slr_reload_tracer_red_lxWS",7,20]]],["B_AssaultPackSpec_cbr",[["greenmag_item_speedloader",1],["greenmag_ammo_762x51_basic_60Rnd",5],["ACE_bodyBag",2],["ACE_personalAidKit",1],["ACE_EntrenchingTool",1],["ACE_Humanitarian_Ration",2],["ACE_WaterBottle",2],[selectRandom _rations,1],["ACE_salineIV_500",2],["ace_marker_flags_red",5],["ACE_EarPlugs",2],["Aegis_20Rnd_762x51_slr_reload_tracer_red_lxWS",3,20],["SmokeShell",2,1]]],"PLP_UNA_H_Cap","",["Binocular","","","",[],[],""],["ItemMap","ItemAndroid","","ItemCompass","ItemWatch",""]],[["ace_arsenal_insignia","CVO_insignia_11_PVT"],["grad_slingHelmet","PLP_UNA_H_HelmetB"]]]
] call ace_arsenal_fnc_addDefaultLoadout;


diag_log ("[CVO] [Arsenal_Define] - completed");
