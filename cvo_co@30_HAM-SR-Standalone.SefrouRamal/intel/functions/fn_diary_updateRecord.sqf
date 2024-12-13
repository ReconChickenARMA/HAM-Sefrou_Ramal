/*
* Author: Zorn
* Function to be executed locally - will update/create the Intel Summary Record
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


diag_log "[CVO](debug)(fn_diary_updateRecord) init";

[] call zrn_fnc_diary_createSubject;
[] call zrn_fnc_diary_setRecordText;
