/*
* Author: Zorn
* function to provide an 
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



if !(player diarySubjectExists"intelSummary") then {
    player createDiarySubject ["intelSummary", "Intel Summary", "\A3\ui_f\data\igui\cfg\simpleTasks\types\search_ca.paa"];
    player createDiaryRecord ["intelSummary", ["Intel Summary", ""], taskNull, "NONE", false];
    diag_log "[CVO](debug)(fn_diary_createSubject) Subject and Record Created";
};