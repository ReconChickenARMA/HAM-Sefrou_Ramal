private _centerPos = [worldSize/2,worldSize/2];
private _radius = worldsize * 2;

private _locationArray = nearestLocations [_centerPos, [], _radius];

{
    private _string = format ["%1: Classname: %2 - Type: %3", _forEachIndex, className _x, type _x];
   
    private _marker = createMarker [className _x, getPos _x, -1];
    _marker setMarkerType "hd_dot";
    _marker setMarkerText _string;

    
} forEach _locationArray;




[
    "Airfield_1",
    "solar_2",
    "comms_1",
    "service",
    "Military_1",
    "Military_4",
    "wasteland",
    "construction_1",
    "datte_1"
]


############

_arrayMags = ["bla_magazine_lxWS"];
_result = [];
{
    private _cfg = (configFile >> "CfgMagazines" >> _x );
    _str = getText _cfg >> "ammo";
    _result pushBackUnique _str;
    
} forEach _arrayMags;

diag_log _result;
_result


### 


_condition = { daytime >= 5};                // condition - Needs to return bool
_statement = {setTimeMultiplier 1};                // Code to be executed once condition true
_timeout = -1;                  // if condition isnt true within this time in S, _timecode will be executed.
[_condition, _statement, _parameter, _timeout] call CBA_fnc_waitUntilAndExecute;


###

private _helipad = createVehicle ["Land_HelipadCivil_F", [0,0,0]];
_helipad attachTo [cursorObject, [0,0,1]];
_helipad setVariable ["ace_isRepairFacility", 1, true];

// if object gets deleted/destroyed i need to deletevehicle all attached objects of the "crate object"