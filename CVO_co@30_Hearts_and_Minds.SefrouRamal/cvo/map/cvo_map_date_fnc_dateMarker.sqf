
/*


["INIT", [_startDate]] 		spawn cvo_map_date_fnc_dateMarker;
["INIT", [btc_startDate]] 	spawn cvo_map_date_fnc_dateMarker;


*/


params [
	["_mode", "", [""]],
	["_params",[],[]]
];
if (!isServer) exitWith {};

switch (_mode) do {
	case "INIT": {
		diag_log format["[CVO] [Map] (dateMarker) - %1", "INIT Detected."];
		diag_log format["[CVO] [Map] (dateMarker) - Init Params: %1", _this];
		private _position = [(worldSize * 0.05), (worldSize * 1.05)];
		cvo_dateMarker = createMarkerLocal ["cvo_dateMarker", _position];
		"cvo_dateMarker" setMarkerTypeLocal "EmptyIcon";
		"cvo_dateMarker" setMarkerColorLocal "ColorRed";
		"cvo_dateMarker" setMarkerShapeLocal "ICON";
		"cvo_dateMarker" setMarkerShadow true;
		"cvo_dateMarker" setMarkerText	"placeholder";
		diag_log format["[CVO] [Map] (dateMarker) - %1", "marker placed."];
		cvo_dateMarker_isActive = true;
		[{
			params ["_args", "_handle"];
			if !(missionNamespace getVariable ["cvo_dateMarker_isActive", false]) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

			_args params [["_startDate", missionStart]];
			date params ["_year", "_month", "_day", "_hours", "_minutes"];
			private _pastDays = floor ([_startDate, date, "d"] call BIS_fnc_calculateDateTime);
			private _tickets =  [btc_player_side] call BIS_fnc_respawnTickets;
			date call BIS_fnc_sunriseSunsetTime params ["_sunriseTime", "_sunsetTime"];
			private _dateString = format ["Date: %1-%2-%3 # %4:%5 # Sunrise %8 - Sunset %9  # Day %6 # Remaining Tickets: %7", _year, _month, _day, _hours, _minutes, _pastDays, _tickets, _sunriseTime, _sunsetTime];
			"cvo_dateMarker" setMarkerText _dateString;
		}, 150, _params] call CBA_fnc_addPerFrameHandler;
	};

	default { diag_log format["[CVO] [Map] (dateMarker) - %1", "No Mode Provided."]; };
};