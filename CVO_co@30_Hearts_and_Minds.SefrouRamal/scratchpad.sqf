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

