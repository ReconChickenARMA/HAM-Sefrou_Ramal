/*
* Author: Zorn
* 

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

intel_database = createHashMapFromArray [
    ["SFIA Base", [
        "intel_laptop_sfia_regionalCommand",
        "intel_laptop_sfia_science",
        "intel_cellphone_sfia",
        "intel_cellphone_prisoner"

    ]],
    ["Prisoner", [
        "intel_sfia_cellphone_prisoner_guards"
    
    ]],
    ["Ion Escapee",[
        "intel_cellphone_ion_survivor"
    
    ]],
    ["Ion Base",[
        "intel_photo_ion_a10",
        "intel_laptop_ion",
        "intel_note_elder",
        "intel_photo_map",
        "intel_photo_boys"
    
    ]],
    ["Daltgreen Office", [
        "intel_laptop_daltgreen_manager",
        "intel_laptop_daltgreen_finance",
        "intel_note_weapons",
        "intel_cellphone_daltgreen_toilet"
    
    ]],
    ["Daltgreen Quaters", [
        "intel_cellphone_daltgreen_unknown",
        "intel_cellphone_daltgreen_shiftCaptain"
    ]],
    ["Daltgreen Pumphouse", [
        "intel_note_dump",
        "intel_whiteboard_map",
        "intel_whiteboard_science"
    ]]
];


["ZRN_INTEL_EH_UPDATE", ZRN_FNC_diary_updateRecord] call CBA_fnc_addEventHandler;


if !(isServer) exitWith {};

{
    private _groupName = _x;
    private _items = intel_database get _x;
    
    diag_log format ['[CVO](debug)(fn_init_database) _groupName: %1', _groupName];
    diag_log format ['[CVO](debug)(fn_init_database) _items: %1', _items];

    {
        diag_log format ['[CVO](debug)(fn_init_database) Loop Item: %1', _x];
        private _obj = missionNamespace getVariable [_x, ""];
        if (_obj isEqualTo "") then { diag_log format ['[CVO](debug)(fn_init_database) obj not found_x: %1', _x]; continue};
        _obj setVariable ["Intel Group", _groupName];
        [_obj] call zrn_fnc_addDeletedEH;

    } forEach _items;

} forEach (keys intel_database);

