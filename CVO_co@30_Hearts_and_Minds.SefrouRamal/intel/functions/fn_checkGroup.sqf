/*
* Author: Zorn
* function to check the amount of objects within a group.
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

diag_log "[CVO](debug)(fn_checkGroup) init ";

params [
    ["_groupName",  "", [""]]
];

private _array = intel_database get _groupName;

diag_log format ['[CVO](debug)(fn_checkGroup) _array: %1', _array];

private _amountTotal = count _array;
private _found = { _x } count (_array apply {missionNamespace getvariable _x} apply { isNull _x});

diag_log format ['[CVO](debug)(fn_checkGroup) _array: %1', _array];
diag_log format ['[CVO](debug)(fn_checkGroup) _found: %1 - _amountTotal: %2', _found , _amountTotal];

[_found,_amountTotal]

// intel_database get "Ion Base" apply {missionNamespace getvariable _x} apply { isNull _x}