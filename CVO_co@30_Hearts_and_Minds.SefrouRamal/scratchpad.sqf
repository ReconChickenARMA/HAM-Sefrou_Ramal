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

_condition = {
    true
};
_statement = {
    params ["_target", "_player", "_params"];
    diag_log format ["_statement [%1, %2, %3]", _target, _player, _params];

    // Run on hover:
    ["ace_common_displayTextStructured", ["someone is thinking of giving you items", 1.5, _target], [_target]] call CBA_fnc_targetEvent;
};
_insertChildren = {
    params ["_target", "_player", "_params"];
    diag_log format ["_insertChildren [%1, %2, %3]", _target, _player, _params];

    // Add children to this action
    private _actions = [];
    {
        private _childStatement = {diag_log format ["givingItem %1", _this]; _target addItem (_this select 2);};
        private _action = [format ["item:%1",_x], _x, "", _childStatement, {true}, {}, _x] call ace_interact_menu_fnc_createAction;
        _actions pushBack [_action, [], _target]; // New action, it's children, and the action's target
    } forEach (items _player);

    _actions
};

_action = ["GiveItems", "?","",_statement,_condition,_insertChildren,[123],"",4,[false, false, false, true, false], _modifierFunc] call ace_interact_menu_fnc_createAction;
[q3, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
