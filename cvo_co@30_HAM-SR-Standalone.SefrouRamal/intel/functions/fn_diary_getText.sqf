/*
* Author: Zorn
* function that constructs the text within the diary entry.
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

diag_log "[CVO](debug)(fn_diary_getText) Init ";

private _discoveredIntelGroups = missionNamespace getVariable ["IntelDiscovered", []];


private _stringArray = [];

private _header = "<font face='EtelkaMonospacePro' color='#0099ff' size='14'>Intel Found:</font>";

_stringArray pushback _header;

{
    private _groupName = _x;

    [_groupName] call zrn_fnc_checkGroup params ["_remaining","_total"];

    diag_log format ['[CVO](debug)(fn_diary_getText) _remaining: %1 - _total: %2', _remaining , _total];

    private _text = if (_remaining == _total) then {
        format ["<font size=10 face='EtelkaMonospacePro'>%1 / %2 - %3 - Complete!</font>",_remaining, _total, _groupName];
    } else {
        format ["<font size=10 face='EtelkaMonospacePro'>%1 / %2 - %3</font>",_remaining, _total, _groupName];
    };
    _stringArray pushBack _text;
} forEach _discoveredIntelGroups;

_stringArray joinString "<br />"