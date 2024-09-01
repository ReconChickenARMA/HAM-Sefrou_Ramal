
/*


["INIT", [_startDate]] 		call cvo_map_date_fnc_dateMarker;
["INIT", [btc_startDate]] 	call cvo_map_date_fnc_dateMarker;


*/


params [
	["_mode", "", [""]],
	["_params",[],[]]
];
if (!isServer) exitWith {};

switch (_mode) do {
	case "INIT": {
		diag_log format["[CVO] [Map] (dateMarker) - Init Params: %1", _this];
		
		{
			cvo_dateMarker = createMarkerLocal [_x, [(worldSize * 1.05), (worldSize - 100 * _foreachindex)];];
			_x setMarkerTypeLocal   "EmptyIcon";
			_x setMarkerColorLocal  "ColorBlack";
			_x setMarkerShapeLocal  "ICON";
			_x setMarkerShadow      true;
			_x setMarkerText        "placeholder";

		} forEach ["cvo_dateMarker_1", "cvo_dateMarker_2","cvo_dateMarker_3"];
		
		diag_log format["[CVO] [Map] (dateMarker) - %1", "marker placed."];

		cvo_dateMarker_isActive = true;

		[{
			params ["_args", "_handle"];
			if !(missionNamespace getVariable ["cvo_dateMarker_isActive", false]) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

			_args params [["_startDate", missionStart]];
			date params ["_year", "_month", "_day", "_hours", "_minutes"];

			private _pastDays = floor ([_startDate, date, "d"] call BIS_fnc_calculateDateTime);
			
            private _tickets =  [btc_player_side] call BIS_fnc_respawnTickets;
			
			
            _daytime = [daytime, "HH:MM"] call BIS_fnc_timeToString;
			
            date call BIS_fnc_sunriseSunsetTime params ["_sunriseTime", "_sunsetTime"];
            _sunriseTime = [_sunriseTime, "HH:MM"] call BIS_fnc_timeToString;
            _sunsetTime = [_sunsetTime, "HH:MM"] call BIS_fnc_timeToString;
			

			"cvo_dateMarker_1" setMarkerText format ["Date: %1-%2-%3 - %4 Days since Campaign Start", _year, _month, _day, _pastDays];
			"cvo_dateMarker_2" setMarkerText format ["Time: %1 - Sunrise %2 - Sunset %3", _daytime,_sunriseTime, _sunsetTime];
			"cvo_dateMarker_3" setMarkerText format ["Remaining Tickets: %7",_tickets];


		}, 60, _params] call CBA_fnc_addPerFrameHandler;
	};

	default { diag_log format["[CVO] [Map] (dateMarker) - %1", "No Mode Provided."]; };
};