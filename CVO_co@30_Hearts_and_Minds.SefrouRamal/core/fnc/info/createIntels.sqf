
/* ----------------------------------------------------------------------------
Function: btc_info_fnc_createIntels

Description:
    Create intels in a city.

Parameters:
    _city - City to create intels. [Object]

Returns:

Examples:
    (begin example)
        [] call btc_info_fnc_createIntels;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_city", objNull, [objNull]]
];

private _houses = +(_city getVariable ["btc_city_housesEntrerable", []]);

private _numberOfHouses = count _houses;
_houses = _houses select [0, round (_numberOfHouses * btc_p_info_houseDensity / 100)];

private _intels = _houses apply {

    private _intelObj = createVehicle [selectRandom btc_info_intels, ASLToATL AGLToASL selectRandom (_x buildingPos -1), [], 0, "CAN_COLLIDE"];
    
    private _action = ["Search_intel", localize "STR_A3_Showcase_Marksman_BIS_tskIntel_title", "\A3\ui_f\data\igui\cfg\simpleTasks\types\search_ca.paa", {
        [btc_info_fnc_search_for_intel, [_target]] call CBA_fnc_execNextFrame;
    }, {true}] call ace_interact_menu_fnc_createAction;
    
    [_intelOBJ, 0, ["ACE_MainActions"], _action] remoteExec ["ace_interact_menu_fnc_addActionToObject", [0,-2] select isDedicated, _intelObj];
};

_city setVariable ["btc_city_intels", _intels];
