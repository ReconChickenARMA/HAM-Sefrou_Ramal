/*
* Author: Zorn
* Function to make an object seem contaminated.
*
* Arguments:
*
*
* Return Value:
* None
*
* Example:
* ['something', player] call cvo_fnc_sth
*
* Public: Yes
*/

params [
    ["_obj",    objNull,    [objNull]   ],
    ["_value",  0.1,        [0]         ],
    ["_below",  true,       [true]      ]
];


private _helper = createVehicle ["Sign_Sphere25cm_F", [0,0,0]];

[ { [_this] call cvo_cbrn_fnc_contaminateObjects;} , _helper, 5] call CBA_fnc_waitAndExecute;

private _distance = switch (_value) do {
    case 0.1: { 30   };
    case 0.2: { 15   };
    case 0.3: { 10   };
    case 0.4: { 7.5  };
    case 0.5: { 6.0  };
    case 0.6: { 5    };
    case 0.7: { 4.2  };
    case 0.8: { 3.75 };
    case 0.9: { 3.3  };
    case 1.0: { 3.0  };
};

if (_below) then { _distance = -1 * _distance; };

_helper attachTo [_obj, [0,0,_distance]];