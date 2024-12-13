[compileScript ["cvo\cvo_initPlayerLocal.sqf"]] call CBA_fnc_directCall;


#include "cvo\cbrn\cbrn_init_local.sqf"



// TO-DO: Cleanup after mission
if !(isNil "texture_01") then {
    private _texture = switch (player getVariable ["interpreter", false]) do { 
        case true: { '#(rgb,512,512,3)text(0,0,"shaffilastri",0.3,"#00000000","#690000","they poisioned us")' }; 
        case false: { '#(rgb,512,512,3)text(0,0,"shaffilastri",0.3,"#00000000","#690000","dsenyto us pihoie")' }; 
    }; 

    texture_01 setObjectTexture [0, _texture]; 
};

// Function to control overwrite ace_weather_temperatureShift to simulate heat wave
_condition = { ! isNil "ACE_weather_temperatureShift" && { ! isNil "ACE_weather_temperatureShift" } };                // condition - Needs to return bool
_statement = { [ { ACE_weather_temperatureShift = ACE_weather_temperatureShift + CVO_temperatureShift; } , [], 10] call CBA_fnc_waitAndExecute; };                // Code to be executed once condition true
[_condition, _statement, [], 120, _statement] call CBA_fnc_waitUntilAndExecute;
