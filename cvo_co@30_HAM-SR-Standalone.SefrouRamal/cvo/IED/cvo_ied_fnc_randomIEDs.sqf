params ["_pos"];



_explosive = (selectRandomWeighted CVO_weightedArrayIED);
//systemChat str _explosive;
sleep 0.1;

_explosive  params [
    ["_classname", 			"", 		        [""]            ],
    ["_needSetDamage", 		false, 		        [false]         ],
    ["_needDirectional", 	false, 	            [false]         ],
    ["_needSetVelocity", 	[false, [0,0,0]],   [false,[]]      ],
    ["_needAltitute", 		false, 		        [false]         ],
    ["_canCookOff", 		false, 		        [false]         ],
    ["_doesBlurry", 		false, 		        [false]         ],
    ["_doesHearing", 		false, 		        [false]         ],
    ["_canDelay",    	    [false, 7], 	    [[false,0]]     ]
];
private "_exo";
private _willDelay = false;

if (_canCookOff)            then {

        [_pos,_classname, 0.01] spawn cvo_ied_fnc_failedIED;

} else {


    if (_canDelay#0)            then { if (random 1 < 0.3) then {
        _willDelay = true; 
        //systemChat "Delay:true"; 
    }};

    if (_willDelay) then {
        _exo = _classname createVehicle _pos;
        _exo enableSimulationGlobal false;
        _exo hideObjectGlobal true;
        [_pos, _canDelay#1] remoteExec ["cvo_ied_fnc_delay_fx", 0];
        
        
        [{_this#0 enableSimulationGlobal true; _this#0 hideObjectGlobal false;}, [_exo], _canDelay#1] call CBA_fnc_waitAndExecute; 


    } else {
        _exo = _classname createVehicle _pos;
    };



    if (_needDirectional)       then { _exo setDir round random 360;                        };
    if (_needSetVelocity#0)     then { _exo setVelocity _needSetVelocity#1;                 };
    if (_needAltitute)          then { _exo setPos (getPos _exo vectorAdd [0,0,1]);         };

    if (_needSetDamage)         then { 
        if (_willDelay)         then {
            [_exo, _canDelay#1]                         spawn cvo_ied_fnc_delay_fx;
            [{_this#0 setDamage 1;}, [_exo], _canDelay#1]  call CBA_fnc_waitAndExecute;
        } else { _exo setDamage 1;};
    };

    if (_doesHearing)   then {
        if (_willDelay) then { 
            [{_this call btc_deaf_fnc_earringing}, [_pos], _canDelay#1] call CBA_fnc_waitAndExecute;   
        } else {
            [_pos] call btc_deaf_fnc_earringing;    
        };   
    };

    if (_doesBlurry)    then {
        if (_willDelay) then { 
            [
                {
                    _this remoteExecCall ["btc_ied_fnc_effects", [0, -2] select isDedicated];
                }, 
                [_pos], 
                _canDelay#1
            ] call CBA_fnc_waitAndExecute;   
        } else {
            [_pos] remoteExecCall ["btc_ied_fnc_effects", [0, -2] select isDedicated];    
        }   
    };
};