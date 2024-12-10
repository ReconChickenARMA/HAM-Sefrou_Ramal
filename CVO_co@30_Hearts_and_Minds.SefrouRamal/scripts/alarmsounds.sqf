if !(isServer) exitWith {};

private _positions = [
	[3534.11,5359.82,0],
	[3184.55,5504.82,0],
	[3358.13,5955.01,0]
];

private _startTime = CBA_missionTime;
private _endTime = CBA_missionTime + 300;
private _parameters = [_startTime, _endTime, _positions];
private _condition = { _this#1 > CBA_missionTime };

private _codeToRun = {
	{ [ { playSound3D ["A3\Sounds_F\sfx\alarm_blufor.wss", player, false, _this#0, 1.3, 1, 2000]; } , [_x], random 1 + _forEachIndex * 3 ] call CBA_fnc_waitAndExecute; } forEach (_this#2);
};
private _delay = 10;

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