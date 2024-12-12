/*
* Author: Zorn
* this function will hide surface_mine_before and will unhide surface_mine_after
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

if !(isServer) exitWith {};

(getMissionLayerEntities "surface_mine_after") params ["_objects","","_groups"];

{ _x hideObjectGlobal true; _x enableSimulationGlobal false; } forEach _objects;



// Sets up the WUAE on the server
[
    {
        missionNameSpace getVariable ["trigger_switch_layers", false]
    },{
        (getMissionLayerEntities "surface_mine_before") params ["_objects","","_groups"];
        { if (local _group) then { _group deleteGroupWhenEmpty true; } else { [_group, true] remoteExec ["deleteGroupWhenEmpty", groupOwner _group] }; } forEach _groups;
        { deleteVehicleCrew _x; deleteVehicle _x; } forEach _objects;


        (getMissionLayerEntities "surface_mine_after") params ["_objects","","_groups"];
        { _x hideObjectGlobal false; _x enableSimulationGlobal true; } forEach _objects;
    }
] call CBA_fnc_waitUntilAndExecute;



intel_cellphone_ion_survivor addEventHandler ["Deleted", {
    params ["_entities"];
    missionNamespace setVariable ["trigger_switch_layers", true, true];
}];