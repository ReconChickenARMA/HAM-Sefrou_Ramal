// Manages the CSC Source object
{
    [_x, -1] call ace_cargo_fnc_setSize;
    [_x, -1] call ace_cargo_fnc_setSpace;
    _x setVariable ["ace_cargo_noRename", true, true];
} forEach [cvo_csc_source];
