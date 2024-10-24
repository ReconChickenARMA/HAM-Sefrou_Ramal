/*
* Author: Zorn
* This function is to identify and shedule the muezzin calls on WS terrains
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* [] call cvo_misc_fnc_init_muezzin.sqf
*
* Public: Yes
*/

if !(isServer) exitWith {};


date call BIS_fnc_sunriseSunsetTime params ["_sunriseTime", "_sunsetTime"]; // [5.28382,18.7162]

// [<NUMBER> Amount of calls, <NUMBER> Type of Call (1 or 2, default is 1) ] call lxWS_fnc_StartMuezzin;

private _statement = { [3 + ceil random 7, selectRandom [1,2]] call lxWS_fnc_StartMuezzin; };
private _currentDaytime = dayTime;

private _middayTime = _sunriseTime + (_sunsetTime -_sunriseTime) / 2;
private _midAfternoon = _middayTime + (_sunsetTime - _middayTime) / 2;

// 1. Prayer: Sunrise
private _timeToCall = _sunriseTime;
if (_currentDaytime < _timeToCall) then { _condition = { daytime > _this }; [_condition, _statement, _timeToCall] call CBA_fnc_waitUntilAndExecute; };


// 2. Prayer: Midpoint between sunrise and sunset
private _timeToCall = _middayTime;
if (_currentDaytime < _timeToCall) then { _condition = { daytime > _this }; [_condition, _statement, _timeToCall] call CBA_fnc_waitUntilAndExecute; };


// 3. Prayer: Midpoint between Midday and Sunset
private _timeToCall = _midAfternoon;
if (_currentDaytime < _timeToCall) then { _condition = { daytime > _this }; [_condition, _statement, _timeToCall] call CBA_fnc_waitUntilAndExecute; };

// 4. Prayer: Sunset
private _timeToCall = _sunsetTime;
if (_currentDaytime < _timeToCall) then { _condition = { daytime > _this }; [_condition, _statement, _timeToCall] call CBA_fnc_waitUntilAndExecute; };


// 5. Prayer: After sun has been fully set. ( lets just do 1.5 hours later)
private _timeToCall = _sunsetTime + 1.5;
if (_currentDaytime < _timeToCall) then { _condition = { daytime > _this }; [_condition, _statement, _timeToCall] call CBA_fnc_waitUntilAndExecute; };