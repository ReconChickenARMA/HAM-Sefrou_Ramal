cvo_fnc_airlift = {

	/*
	* Author: Zorn
	* Creates Waypoints to Slingload slingloadable cargo to an destination and then returns to a waiting point.
	*
	* Arguments:
	* 0: _heliCrew	 <Group>			 - Group of Heli Crew
	* 1: _cargoObj	 <Object>			- Object to be slung - needs to be slingloadable!
	* 2: _dropOffPos   <Object or Pos>	 - Destination of the Cargo Object. Ether Pos or Object, like empty Helipad.
	* 3: _returnPos	<Object or Pos>	 - Point of return for the helicopter once the cargo has been delivered. Ether Pos or Object, like empty Helipad.
	* 4: _direction	<Number>			- Azimuth / Direction of Ingress / Egress - Default: "AUTO"
	* 5: _protected	<Boolean>		   - If true, Disable Damage for helicopter and Crew        <Default: true>
	* 5: _unlock	<Boolean>		   - If true, unlocks vehicle once it has been delivered    <Default: false>
	*
	* Return Value:
	* none
	*
	* Example:
	* [_heliCrewGroup, _CargoObj, _DZ, _home, _ingress] call cvo_fnc_airlift
	*
	* Public: [Yes/No]
	*/



	params [
		[ "_heliCrew",		grpNull,	   [grpNull]			   ],
		[ "_cargoObj",		objNull,	   [objNull]			   ],
		[ "_dropOffPos","UNDEFINED",	   [objNull,[]],	  [2,3]],
		[ "_returnPos",	"UNDEFINED",	   [objNull,[]],	  [2,3]],
		[ "_direction",      "AUTO",	   [0]					 ],
		[ "_protected",		   true,	   [false]				 ],
		[ "_unlock",		  false,	   [false]				 ]
	];

	// Input Sanitization
	if (_heliCrew isEqualTo grpNull) exitWith {};
	if (_cargoObj isEqualTo objNull) exitWith {};
	if (_dropOffPos isEqualTo "UNDEFINED") exitWith {};



	//Check if target can be airlifted
    private _helperNeeded = false;
	if (count getArray (configOf cursorTarget >> "slingLoadCargoMemoryPoints") == 0) then {
        _helperNeeded = true;

    };

	// turn off damage if _protected
	if (_protected) then {
		{ _x allowDamage false; } forEach units _heliCrew + [vehicle leader _heliCrew];
	};

	// Create Helper Object for The Drop Off Point and Landing Point
	private ["_dropOffPosObj", "_returnPosObj"];
	If (_dropOffPos isEqualType []) then {
		_dropOffPosObj = createVehicle ["Land_HelipadEmpty_F", _dropOffPos];
	} else {	_dropOffPosObj = _dropOffPos; _dropOffPos = getPos _dropOffPosObj;  };


	if (_returnPos isEqualTo "UNDEFINED") then {	_returnPos = getPos leader _heliCrew;  };

	If (_returnPos isEqualType []) then {
		_returnPosObj = createVehicle ["Land_HelipadEmpty_F", _returnPos];
	} else {	_returnPosObj = _returnPos; _returnPos = getPos _returnPosObj;  };



	private _heliObj = vehicle leader _heliCrew;
	private _heliPos = getPos leader _heliCrew;
	private _cargoPos = getPos _cargoObj;

    private _dis = _heliObj distance _cargoObj;
    private _far = 750;
    private _mid = 200;
    private _near = 50;

    if  (_direction isEqualto "AUTO" && _dis < 750) then {
        _mid = _dis / _far * 200;
        _far = _dis;
    };


	// Adjust Direction in case of "AUTO"
	if (_direction isEqualto "AUTO") then {
		_direction = _cargoObj getDir _heliObj;
	};





	// Empty the cargo vehicle and locks it + setMass for Airlift
	private _code = {
		{	moveOut _x;	} forEach crew (_this # 1);
		_this # 1 lockCargo true;
		_this # 1 lockDriver true;
		{ _this # 1 lockTurret [_x, true]; } forEach allTurrets [_this # 1, true];
        _this # 1 setVariable ["CVO_Original_Mass", getMass (_this # 1) ];
		_this # 1 setMass 1000;
	};
	[ { (_this # 0 distance _this # 1) < 100 }, _code, [_heliObj, _cargoObj], 600, _code ] call CBA_fnc_waitUntilAndExecute;


   	private _code = {
        if _unlock then {
    		_this # 1 lockCargo false;
    		_this # 1 lockDriver false;
    		{ _this # 1 lockTurret [_x, false]; } forEach allTurrets [_this # 1, true];
        };
		_this # 1 setMass (_this # 1 getVariable ["CVO_Original_Mass", 1000] );
	};
	[ { (_this # 0 distance _this # 1) < 3 }, _code, [_dropOffPosObj, _cargoObj], 600, _code ] call CBA_fnc_waitUntilAndExecute;


	_heliObj setFuel 1;
	_heliObj limitSpeed 200;

	private _wpPos1 = _cargoPos getPos [_far,  _direction];
	private _wpPos2 = _cargoPos getPos [_mid,  _direction];
	private _wpPos3 = _cargoPos getPos [_near, _direction];
	private _wpPos4 = + _cargoPos;
	private _wpPos5 = _cargoPos getPos [_far, _direction];

	private _wp1 = _heliCrew addWaypoint [_wpPos1, -1];
	_wp1 setWaypointBehaviour "CARELESS";
	_wp1 setWaypointStatements ["true", "vehicle this flyInHeight [50, true]; vehicle this limitSpeed 100;"];
	_wp1 setWaypointSpeed "FULL";


	private _wp2 = _heliCrew addWaypoint [_wpPos2, -1];
	_wp2 setWaypointStatements ["true", "vehicle this flyInHeight [30, true]; vehicle this limitSpeed 50;"];
	_wp2 setWaypointSpeed "LIMITED";

	private _wp3 = _heliCrew addWaypoint [_wpPos3, -1];
	_wp3 setWaypointStatements ["true", "vehicle this flyInHeight [30, false]; vehicle this limitSpeed 25;" ];



	private _wp4 = _heliCrew addWaypoint [_cargoObj, -1];
	_wp4 waypointAttachVehicle _cargoObj;
	_wp4 setWaypointType "HOOK";
	_wp4 setWaypointStatements ["true", "vehicle this flyInHeight [15, false]; vehicle this limitSpeed 75;"];


	private _wp5 = _heliCrew addWaypoint [_wpPos5, -1];
	_wp5 setWaypointStatements ["true", "vehicle this flyInHeight [75, true]; vehicle this limitSpeed 200;"];



	private _wp6 = _heliCrew addWaypoint [_dropOffPos, -1];
	private _wp7 = _heliCrew addWaypoint [_dropOffPos, -1];
	_wp7 waypointAttachVehicle _dropOffPosObj;
	_wp7 setWaypointType "UNHOOK";
	_wp7 setWaypointStatements ["true", "vehicle this flyInHeight [50, false]; vehicle this limitSpeed 200;"];


	private _wp8 = _heliCrew addWaypoint [_returnPos, -1];
	_wp8 setWaypointSpeed "FULL";
	_wp8 setWaypointStatements ["true", "vehicle this land 'LAND'"];
	_wp8 waypointAttachVehicle _returnPosObj;

};


/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
// adds the action to every client and JIP, but also adds it when it was already removed. E.g., Laptop has already been hacked by a player

{
	[
		_x#0,																	// Object the action is attached to
		"<t color='#ff0000'>Request Airlift for this Vehicle</t>",				// Title of the action
		"\a3\ui_f\data\igui\cfg\simpleTasks\types\container_ca.paa",			// Idle icon shown on screen
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",			// Progress icon shown on screen
		"_this distance _target < 10",											// Condition for the action to be shown
		"_caller distance _target < 10",										// Condition for the action to progress
		{},																		// Code executed when action starts
		{},																		// Code executed on every progress tick
		{ [_this#3#2, _this#0 , _this#3#0, _this#3#1] call cvo_fnc_airlift; },			// Code executed on completion
		{},																		// Code executed on interrupted
		[_x#1,_x#2, _x#3],															// Arguments passed to the scripts as _this # 3
		6,																		// Action duration in seconds
		0,																		// Priority
		true,																	// Remove on completion
		false																	// Show in unconscious state
	] remoteExec ["BIS_fnc_holdActionAdd", 0, _x#0];							// MP-compatible implementation
   
} forEach [ [missile_launcher_1, DZ_1, LZ, airlift_heli_1_grp], [missile_launcher_2, DZ_2, LZ, airlift_heli_1_grp] ];




/*
_cargoObj = cursorObject;
_helperObj = createVehicle ["Land_CargoBox_V1_F", [0,0,0]];
_helperObj allowDamage false;
//_helperObj hideObjectGlobal true;
_helperObj disableCollisionWith _cargoObj;

_offset = getCenterOfMass _cargoObj;

_helperObj setPos getPos _cargoObj;

_offset = _cargoObj get
_cargoObj attachTo [_helperObj, _offset];
*/