/*
* Author: Zorn
* function to trigger the alarm sound and the helicopter and the vehicle driving away
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


_statement = {

    _code = {
        private _positions = [
            [3534.11,5359.82,20],
            [3184.55,5504.82,20],
            [3358.13,5955.01,20],
            [3435.02,5416.44,20]
        ];

        private _startTime = CBA_missionTime;
        private _endTime = CBA_missionTime + 300;
        private _parameters = [_startTime, _endTime, _positions];
        private _condition = { _this#1 > CBA_missionTime && !(missionNamespace getVariable ["trigger_switch_layers", false]) }; 

        private _codeToRun = {
            { [ { playSound3D ["A3\Sounds_F\sfx\alarm_blufor.wss", player, false, _this#0, 1.3, 1, 2000]; } , [_x], random 1 + _forEachIndex * 3 ] call CBA_fnc_waitAndExecute; } forEach (_this#2);
        };
        private _delay = 15;

        [{
            params ["_args", "_handle"];
            _args params ["_codeToRun", "_parameters", "_exitCode", "_condition"];

            if (_parameters call _condition) then {
                _parameters call _codeToRun;
            } else {
                _handle call CBA_fnc_removePerFrameHandler;
                _parameters call _exitCode;
            };
        }, _delay, [_codeToRun, _parameters, _exitCode, _condition]] call CBA_fnc_addPerFrameHandler;


        [ { missionNamespace setVariable ["trigger_alarm_heli", true, true]; } , [], 60] call CBA_fnc_waitAndExecute;
        [ { missionNamespace setVariable ["trigger_alarm_quad", true, true]; } , [], 15] call CBA_fnc_waitAndExecute;
        [ { missionNamespace setVariable ["trigger_alarm_offroad", true, true]; } , [], 90] call CBA_fnc_waitAndExecute;
    };
    
    [_code, [], 30] call CBA_fnc_waitAndExecute;

};                // Code to be executed once condition true
[{ missionNamespace getVariable ["trigger_alarm", false] }, _statement, []] call CBA_fnc_waitUntilAndExecute;
