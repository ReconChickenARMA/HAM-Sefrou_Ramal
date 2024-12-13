/*
* Author: Zorn
* This function is to schedule the muezzin calls on WS terrains
* Simply execute on mission start.
*
* using SkipTime or sth along these lines might fuck shit up - use brain advised.
*
* Arguments:
* none
*
* Return Value:
* array - when the calls will be scheduled for that day.
*
*/


if !(isServer) exitWith {};

date call BIS_fnc_sunriseSunsetTime params ["_sunriseTime", "_sunsetTime"]; // [5.28382,18.7162]

// [<NUMBER> Amount of calls, <NUMBER> Type of Call (1 or 2, default is 1) ] call lxWS_fnc_StartMuezzin;

private _statement = { [1, 1] call lxWS_fnc_StartMuezzin; };
private _currentDaytime = dayTime;

private _return = [];
private _prayerTimes = [];

// 1. Prayer: Sunrise
_prayerTimes pushBack _sunriseTime;

// 2. Prayer: Midpoint between sunrise and sunset
private _middayTime = _sunriseTime + (_sunsetTime -_sunriseTime) / 2;
_prayerTimes pushBack _middayTime;

// 3. Prayer: Midpoint between Midday and Sunset
private _midAfternoon = _middayTime + (_sunsetTime - _middayTime) / 2;
_prayerTimes pushBack _midAfternoon;

// 4. Prayer: Sunset
_prayerTimes pushBack _sunsetTime;

// 5. Prayer: After sun has been fully set.  // 5% of daylength so far seem to be the best ratio
_prayerTimes pushBack ( _sunsetTime + ( _sunsetTime - _sunriseTime ) * 0.05 );

{
    if (_currentDaytime < _x) then { _condition = { daytime > _this }; [_condition, _statement, _x] call CBA_fnc_waitUntilAndExecute; _return pushBack _x} else { _return pushBack false};
} forEach _prayerTimes;

_return