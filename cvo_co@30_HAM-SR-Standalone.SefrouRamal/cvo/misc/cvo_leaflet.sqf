/*
* Author: Zorn
* function for a quick and dirty leaflet script
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: Yes
*/

params [["_obj", objNull,[objNull]]];

[ {     
    _scrambled = [ 
        "Stprupo eht AIFS", 
        "eW igbrn aeepc", 
        "eW ingrb ltiytisba", 
        "", 
        "ejectR UAN", 
        "ltasiatpiC gpis" 
    ]; 

    _text = [ 
        "Support the SFIA", 
        "We bring peace", 
        "We bring stability", 
        "", 
        "Reject UNA", 
        "Capitalist pigs" 
    ]; 

    _isTerp = player getVariable ["interpreter", false];

    _selectedText = switch (_isTerp) do {
        case true:  { _text };
        case false: { _scrambled };
    };

    _prodText = format ['#(rgb,512,512,3)text(1,1,"VTKSSMASH",0.1,"#ffcc5f","#690000",%1)', _selectedText  joinString "\n"]; 

    [_this#0, _prodText, _selectedText select { _x != "" } joinString " - " ] call BIS_fnc_initInspectable; 

 } , [this], 10] call CBA_fnc_waitAndExecute;

 /* "cvo_mapboard" */