params ["_intelOBJ"];

private _action = ["Search_intel", localize "STR_A3_Showcase_Marksman_BIS_tskIntel_title", "\A3\ui_f\data\igui\cfg\simpleTasks\types\search_ca.paa", {
    [btc_info_fnc_search_for_intel, [_target]] call CBA_fnc_execNextFrame;
}, {true}] call ace_interact_menu_fnc_createAction;

diag_log format ['[CVO](debug)(createIntels_remote) _intelOBJ: %1 - _action: %2', _intelOBJ , _action];

[_intelOBJ, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;