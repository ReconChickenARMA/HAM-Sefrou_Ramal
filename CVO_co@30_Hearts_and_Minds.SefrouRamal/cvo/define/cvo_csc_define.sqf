//// DEFINE DEFAULTS

[
    createHashMapFromArray [

        ["normal_mode", "POS"], 
        ["spawn_pos", btc_create_object_point],

        ["box_empty", true],
        ["box_class", "Box_NATO_Equip_F"],

        ["airframe_class", "PLP_UNA_Heli_light_03_unarmed_F"],

        ["airdrop_pos_start", [10250,10250,100]],
        ["airdrop_pos_end", "RETURN"],


		["ace_cargo_setSize", 1]
    ]
] call cvo_csc_fnc_defaultEntry;

//// DEFINE CRATES

// NIGHT FIGHT

[
    "Night Fight Kit",
	[
		["glaunch_GLX_lxWS", 1],
		["3Rnd_UGL_FlareYellow_F", 20],

		["ACE_HandFlare_Yellow",10],
		["ACE_HandFlare_Red",40],
		
		["Chemlight_yellow", 25],
		["ACE_Chemlight_Shield", 10],
		
		["ACE_Flashlight_KSF1", 10],
		["ACE_Flashlight_Maglite_ML300L", 5],
		["acc_esd_01_flashlight", 5]
	]
] call cvo_csc_fnc_register;

// GENERAL AMMO
[
    "General Ammo Package",
	[

		["ace_30rnd_556x45_stanag_mk262_mag", 10],
		["30Rnd_556x45_Stanag_red", 10],
		["greenmag_ammo_556x45_basic_60Rnd",15],
		["greenmag_beltlinked_338_basic_100",5],


		//["Aegis_20Rnd_762x51_slr_reload_tracer_red_lxWS",10],
		//["greenmag_ammo_762x51_basic_60Rnd",10],

		["1Rnd_50mm_Smoke_lxWS",5],
		["1Rnd_58mm_AT_lxWS",5],

		["1Rnd_RC40_HE_shell_RF", 3],
		["1Rnd_RC40_shell_RF", 3],

		//["greenmag_beltlinked_762x51_basic_100",5],
		//["greenmag_ammo_127x108_basic_60Rnd",2],

		["ACE_HandFlare_Yellow",10],
		["ACE_HandFlare_Red",10],
        //		["Aegis_HandFlare_Green",10],
        //		["Aegis_HandFlare_Red",10],
		
		["HandGrenade",10],
		["SmokeShell",5],
		["1Rnd_Smoke_Grenade_shell",5],
		//["100Rnd_762x51_S77_Red_lxWS",5],
		["17Rnd_9x21_Mag",10],
		["ACE_SpareBarrel", 2],
		["greenmag_ammo_9x21_basic_60Rnd",5],

		["greenmag_item_speedloader", 4]
	]
] call cvo_csc_fnc_register;


// MEDICAL

[
    "Medical Resupply Package",
	[
		["ACE_surgicalKit", 1],
		// ["ACE_suture", 100],

		["ACE_painkillers", 5],

		["ACE_bodyBag", 25],
		["ACE_personalAidKit", 15],
		
		["ACE_salineIV", 10],
		["ACE_salineIV_500", 20],

		["ACE_fieldDressing",  40],
		["ACE_packingBandage", 40],
		["ACE_elasticBandage", 50],

        ["ACE_Morphine",5],
        ["ACE_Epinephrine",10]

	],
    [],
    createHashMapFromArray [
        ["box_class", "ACE_medicalSupplyCrate_advanced"],
        ["ace_medical_facility", true]
    ]
] call cvo_csc_fnc_register;

// Combat Patrol

[
    "Combat Patrol Package",
	[
		["ACE_personalAidKit", 5],
		["ACE_salineIV_500", 5],
		["ACE_Humanitarian_Ration", 25],
		["ACE_WaterBottle", 25],

		["ACE_fieldDressing", 30],
		["ACE_packingBandage", 30],
		["ACE_elasticBandage", 10],

		["ace_marker_flags_red", 25],
		["ace_marker_flags_green", 25],

		["ACE_EarPlugs", 10],
		["ACE_SpraypaintRed", 2],
		["ACE_CableTie", 20],

		["ACE_HandFlare_White", 20],
		
		["greenmag_ammo_556x45_basic_60Rnd", 10],

		["greenmag_beltlinked_338_basic_100",5],

		//["100Rnd_762x51_S77_Red_lxWS",3],
		//["greenmag_beltlinked_762x51_basic_100",10],

		//["Aegis_20Rnd_762x51_slr_reload_tracer_red_lxWS",10],
		//["greenmag_ammo_762x51_basic_60Rnd",10],

		["ACE_bodyBag", 10],
		["greenmag_item_speedloader", 1]

	]
] call cvo_csc_fnc_register;


// CBRN 

[
    "CBRN Package (4 Kits)",
	[
		["U_C_CBRN_Suit_01_Blue_F", 4],
		["G_RegulatorMask_F", 4],
		["ChemicalDetector_01_watch_F", 4]
	],
	[
		["B_SCBA_01_F",4]
	],
    createHashMapFromArray [
        ["box_class", "Box_NATO_Uniforms_F"]
    ]
] call cvo_csc_fnc_register;


// UAV

[
    "UAV Operator Package",
	[
		["ACE_UAVBattery", 10],
		["ACRE_VHF30108SPIKE", 1],
		["ACRE_VHF30108", 1],
		["ACRE_VHF30108MAST", 1]
	],
    [
		["ION_UAV_01_backpack_lxWS", 4]
	]
] call cvo_csc_fnc_register;


// Vehicle Kits

[
	"Small Vehicle Ammo Package",			// Name String
	[],										// Array
	[],										// Array of Backpacks
	createHashMapFromArray [
        ["box_class", "Land_Proxy_UsBasicAmmoBoxBig_F"],

		["ace_rearm_source", true],
		["ace_rearm_source_value", 20],

		["ace_carry_canCarry", true]
	]
] call cvo_csc_fnc_register;


[
	"Vehicle Ammo Package",			// Name String
	[],								// Array
	[],								// Array of Backpacks
	createHashMapFromArray [
        ["box_class", "VirtualReammoBox_small_F"],
		["ace_carry_canCarry", false],

		["ace_rearm_source", true],
		["ace_rearm_source_value", 50]
	]
] call cvo_csc_fnc_register;


[
	"Vehicle Maintainance Package",	// Name String
	[["ToolKit", 1]],				// Array
	[],								// Array of Backpacks
	createHashMapFromArray [
        ["box_class", "metalcrate"],

		["ace_repair_facility", true],

		["ace_carry_canCarry", false],
		["ace_cargo_add_jerrycans", 1],
		["ace_cargo_add_spareWheels",2]
	]
] call cvo_csc_fnc_register;


// SOF - Nightraid


[
	"SOF - Night Raid Kit",	            // Name String
	[
		["ACE_IR_Strobe_Item", 15],

		["ACE_NVGoggles_OPFOR_WP", 15],

		["muzzle_snds_L", 10],

		["suppressor_h_lxWS", 10],
		["suppressor_l_lxWS", 10],

		["acc_flashlight_IR_pistol_RF", 15],
		["acc_pointer_IR_pistol_RF", 15],
		["ACE_DBAL_A3_Red", 15],
		["ACE_40mm_Flare_ir", 15],
		["optic_Hamr", 5],

		["Laserdesignator",1],
		["Laserbatteries",2],
		["DemoCharge_Remote_Mag",5]
    ],				                // Array
	[],								// Array of Backpacks
	createHashMapFromArray [
        ["box_class", "Land_PlasticCase_01_medium_F"],

		["ace_carry_canCarry", true],
        ["ace_carry_ignoreWeight", true]
	]
] call cvo_csc_fnc_register;


//////////// LINKING 



{ [cvo_csc_source, _x] call cvo_csc_fnc_link; } forEach [
    "General Ammo Package"
/*    ,"Combat Patrol Package"
    ,"Night Fight Kit"

    ,"UAV Operator Package"
    ,"Medical Resupply Package"
    ,"CBRN Package (4 Kits)"

    ,"Small Vehicle Ammo Package"
    ,"Vehicle Ammo Package"
    ,"Vehicle Maintainance Package"
*/
];
