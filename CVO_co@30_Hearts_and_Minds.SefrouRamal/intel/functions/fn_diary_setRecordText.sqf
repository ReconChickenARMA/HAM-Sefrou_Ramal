/*
* Author: Zorn
* function to set the text based on the already discovered intel groups
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

diag_log "[CVO](debug)(fn_diary_setRecordText) Init ";


private _text =  [] call zrn_fnc_diary_getText;

diag_log format ['[CVO](debug)(fn_diary_setRecordText) _text: %1', _text];

player setDiaryRecordText [
    [
        "intelSummary",
        player allDiaryRecords "intelSummary" select 0 select -1
    ],
    [
        "Intel Summary",
        _text,
        "\A3\ui_f\data\igui\cfg\simpleTasks\types\search_ca.paa"
    ]
];