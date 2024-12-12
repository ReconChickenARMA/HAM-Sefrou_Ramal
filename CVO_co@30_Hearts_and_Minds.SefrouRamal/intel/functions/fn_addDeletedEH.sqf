/*
* Author: Zorn
* function to add an event handler to the object
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params ["_obj"];

diag_log format ['[CVO](debug)(fn_addDeletedEH) INIT _obj: %1', _obj];

private _return = _obj addEventHandler ["Deleted", {
	params ["_entity"];

    private _groupName = _entity getVariable ["Intel Group", "404"];

    systemChat format ["Deleted: %1 - %2", _entity, _groupName];

    private _array = missionNamespace getVariable ["IntelDiscovered", []];
    _array pushBackUnique _groupName;
    missionNamespace setVariable ["IntelDiscovered", _array, true];
    systemChat format ["Updated: %1 - %2", "IntelDiscovered", IntelDiscovered];
 
    [ { ["ZRN_INTEL_EH_UPDATE", [], "ZRN_INTEL_EH_UPDATE"] call CBA_fnc_globalEventJIP; } , [], 1] call CBA_fnc_waitAndExecute;
}];

diag_log format ['[CVO](debug)(fn_addDeletedEH) _return: %1', _return];

// I need to register the event which will cause the update on each client and i need to raise this event