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
	{cvo_zeus_debug_map_markers_available},     //  * 4: Condition <CODE>
	{},                          //  * 5: Insert children code <CODE> (Optional)
	[],                          //  * 6: Action parameters <ANY> (Optional)
	[0,0,0],         				//  * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
	20,                            //  * 8: Distance <NUMBER> (Optional)
	[],                            //  * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
	{}                            //  * 10: Modifier function <CODE> (Optional)
] call ace_interact_menu_fnc_createAction;

[
	["ACE_ZeusActions"],        	// * 2: Parent path of the new action <ARRAY> (Example: `["ACE_SelfActions", "ACE_Equipment"]`)
	_aceAction	         			// * 3: Action <ARRAY>    
] call ace_interact_menu_fnc_addActionToZeus;




