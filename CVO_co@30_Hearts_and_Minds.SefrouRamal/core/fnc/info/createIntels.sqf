
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
    // diag_log format ['[CVO](createIntel) _intelObj: %1', _intelObj];
    
};

_city setVariable ["btc_city_intels", _intels];



    // diag_log format ['[CVO](debug)(createIntels) BTC_info_fnc_createIntels_remote: %1', BTC_info_fnc_createIntels_remote];
    // [_intelOBJ] remoteExecCall ["btc_info_fnc_createIntels_remote", _intelObj];
    
