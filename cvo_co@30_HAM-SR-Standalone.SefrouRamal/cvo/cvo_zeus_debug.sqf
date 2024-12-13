cvo_zeus_debug_map_markers_available = true;


_code = {

    cvo_zeus_debug_map_markers_available = false;

	///////////////////////////////////////////////////////////////////////
	/////////////////////////////////// IED's /////////////////////////



    {  
      _markerName = ("ied_" + str _forEachIndex + " - " + str (typeOf _x)); 
      _markerPos = getPos _x; 
      _marker = createMarkerLocal [_markerName, getPos _x, 0 ]; 
      _marker setMarkerShapeLocal "ICON"; 
      _marker setMarkerSizeLocal [1,1]; 
      _marker setMarkerTextLocal _markerName; 
      _marker setMarkerColorLocal "ColorCIV"; 
      _marker setMarkerTypeLocal "Minefield"; 


     _code = {
        params ["_marker"];
        deleteMarker _marker;
     };
    
     [_code, [_marker], 120] call CBA_fnc_waitAndExecute;
    
    } forEach allMines;



	///////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Hideout s /////////////////////////

	{ 
		_markerName = ("hideout_" + str _forEachIndex);
		_markerPos = getPos _x;
		_marker = createMarkerLocal [_markerName, getPos _x, 0 ];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerSizeLocal [1,1];
		_marker setMarkerTextLocal _markerName;
		_marker setMarkerColorLocal "ColorWhite";
		_marker setMarkerTypeLocal "Minefield";

        _code = {        params ["_marker"];        deleteMarker _marker;     };
        [_code, [_marker], 120] call CBA_fnc_waitAndExecute;

	} forEach ((allMissionObjects "all") select {"Flag_Red_F" == typeOf _x});


	////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Weapons Cache /////////////////////////
	// Creates Marker for Cache
	
	["btc_cache_obj"] remoteExec ["publicVariable", 2];

	private _isCBRN = false;

	if ( count ((getPos btc_cache_obj) nearObjects 10 select {"CBRN" in (typeOf _x)}) > 0 ) then 
		{    _isCBRN = true;   };

	if (isNil "btc_cache_obj") exitWith {};
	if (isNull btc_cache_obj) exitWith {};
	
	_markerName = ("Weapon Cache");  
	_markerPos = getPos btc_cache_obj;  
	_markerCache = createMarkerLocal [_markerName, _markerPos, 0 ];  
	_markerCache setMarkerShapeLocal "ICON";  
	_markerCache setMarkerSizeLocal [1,1];
	if (_isCBRN) then {
		_markerCache setMarkerTextLocal (_markerName + " !CBRN!") ;  
		_markerCache setMarkerColorLocal "ColorRED";  
		_markerCache setMarkerTypeLocal "MinefieldAP"; 
	} else {
		_markerCache setMarkerTextLocal _markerName;  
		_markerCache setMarkerColorLocal "ColorOrange";  
		_markerCache setMarkerTypeLocal "Minefield"; 
	};

     _code = {        params ["_marker"];        deleteMarker _marker;     };
    [_code, [_markerCache], 120] call CBA_fnc_waitAndExecute;

    [{cvo_zeus_debug_map_markers_available = true}, [],120] call cba_fnc_waitAndExecute;


};

_aceAction = [
	"cvo_zeus_show_hideout",         // * 0: Action name <STRING>
	"Show Hideouts, Caches and IEDs for 120s (clientside only)",            //  * 1: Name of the action shown in the menu <STRING>
	"",                          //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
	_code,                            //  * 3: Statement <CODE>
	{cvo_zeus_debug_map_markers_available}
	
] call ace_interact_menu_fnc_createAction;

[
	["ACE_ZeusActions"],        	// * 2: Parent path of the new action <ARRAY> (Example: `["ACE_SelfActions", "ACE_Equipment"]`)
	_aceAction	         			// * 3: Action <ARRAY>    
] call ace_interact_menu_fnc_addActionToZeus;




//////////////////////////////////////////////////
///////////// ZEUS ACTION - REP CHANGE /////////////
//////////////////////////////////////////////////


private _steps = [ 100, 50, 25, 10, 5, -5, -10, -25, -50, -100 ];
private _aceAction = [
	"btc_zeus_reputation",         // * 0: Action name <STRING>
	"Change Reputation",            //  * 1: Name of the action shown in the menu <STRING>
	"",                          //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
	{
		"btc_global_reputation" remoteExec ["publicVariable",2];
		[systemChat format ["Current Reputation: %1", missionNameSpace getVariable ["btc_global_reputation", "not found"]]] call CBA_fnc_execNextFrame;
	},                            //  * 3: Statement <CODE>
	{true},                      //  * 4: Condition <CODE>
	{
		params ["_target", "_player", "_params"];
		private _actions = [];
		{
			private _action = [
				["CVO_REP_ADJ",_x] joinString "_",
				format ["%1 %2", ["-", "+"] select (_x > 0), -1 * _x max _x ],
				"",
				{
                    private _value = missionNamespace getVariable ["btc_global_reputation", "404"];
                    if (_value isEqualTo "404") exitWith {};
                    private _valueNew = _value + _this#2;
                    private _str = format ["GLOBAL REPUTATION ADJUSTED: %1 + %2 = %3", _value, _this#2, _valueNew];
					systemChat _str;
					diag_log _str;
                    missionNamespace setVariable ["btc_global_reputation", _valueNew,true];
			    },
				{true},
				{},
				_x
			] call ace_interact_menu_fnc_createAction;
			_actions pushBack [_action, [], _target];
		} forEach _params;
		_actions
	},                          //  * 5: Insert children code <CODE> (Optional)
	_steps,
	[0,0,0],
	20,
	[false,false,false,true,false]/*,
	{
		params ["_target", "_player", "_params", "_actionData"];
	    // Modify the action - index 1 is the display name, 2 is the icon...
    	_actionData set [1, format ["Current REP: %1", missionNamespace getVariable ["btc_global_reputation", "404"]]];
	}*/
] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions"], _aceAction] call ace_interact_menu_fnc_addActionToZeus;

//////////////////////////////////////////////////
