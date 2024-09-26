/*
 * Author: Mike
 * Switches ACRE spoken language on unconsciousness
 * Call from initPlayerLocal.sqf.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call FUNC(unconscious);
 */

params ["_player"];

diag_log "[CVO] [ACRE] (Acre Unconcious) - Init Start";

if (!hasInterface) exitWith {};


//// ################# DEFINE #################

cvo_babel_allLanguages = [
    ["arab", "Arabic"],
    ["en", "English"]
];

cvo_babel_sideLanguages = createHashMapFromArray [
    ["WEST", ["en"]],
    ["EAST", ["arab"]],
    ["GUER", ["arab"]],
    ["CIV", ["arab"]]
];


cvo_babel_playerDefault = "en";
cvo_babel_localLanguage = "arab";


//// ############## DEFINE END #################

//// ################# CODE #################
//// ################# DONT #################
//// ################# EDIT #################
//// ################# BELOW ################
//// ################# HERE #################

cvo_babel_zeusLanguages = cvo_babel_allLanguages apply {_x select 0};
{ _x   call acre_api_fnc_babelAddLanguageType } forEach cvo_babel_allLanguages + [["un", "Unconscious"]];

// Local Language
cvo_babel_localPlayerLanguages = [];


// Player Languages
//    _cvo_babel_player getVariable ["CVO_Player_Languages", []];

// Default Language for everyone
    cvo_babel_localPlayerLanguages pushBackUnique cvo_babel_playerDefault;

// Local Languages via Translator
    if (player getVariable ["interpreter", false]) then {
        cvo_babel_localPlayerLanguages pushBackUnique cvo_babel_localLanguage;
    };

//// APPLY
// Set spoken
cvo_babel_localPlayerLanguages call acre_api_fnc_babelSetSpokenLanguages;

// Switch language on unconscious toggle
["ace_unconscious", {
    params ["_unit", "_state"];

    if (_unit != ACE_player) exitWith {}; // Ignore if remote unit

    if (_state) then {
        ["un"] call acre_api_fnc_babelSetSpokenLanguages;
    } else {
        cvo_babel_localPlayerLanguages call acre_api_fnc_babelSetSpokenLanguages;
    };
}] call CBA_fnc_addEventHandler;

// Handle unit change (including death)
["unit", {
    params ["_newUnit", "_oldUnit"];

    if (call CBA_fnc_getActiveFeatureCamera != "") exitWith {}; // Ignore if feature camera active (eg. Zeus)

    if (_newUnit getVariable ["ACE_isUnconscious", false]) then {
        ["un"] call acre_api_fnc_babelSetSpokenLanguages;
    } else {
        cvo_babel_localPlayerLanguages call acre_api_fnc_babelSetSpokenLanguages;
    };
}, false] call CBA_fnc_addPlayerEventHandler;

// Handle feature camera (eg. Zeus)
["featureCamera", {
    params ["_unit", "_newCamera"];

    switch (true) do {
        case (_newCamera == "" && {ACE_player getVariable ["ACE_isUnconscious", false]}): { ["un"] call acre_api_fnc_babelSetSpokenLanguages; }; // Uncon
        case (player != ace_player): {

            private _sideStr = str side ace_player;
            private _array = cvo_babel_sideLanguages getOrDefault [_sideStr,[]];

            //failback to default player lanugage
            if (count _array == 0) then {_array pushBack cvo_babel_playerDefault };
            _array call acre_api_fnc_babelSetSpokenLanguages;
            systemChat format ["CVO Babel - Given Langauge: %1", _array apply {[_x] call acre_api_fnc_babelGetLanguageName;}];
        };

        default { cvo_babel_localPlayerLanguages call acre_api_fnc_babelSetSpokenLanguages; };
    };
}, false] call CBA_fnc_addPlayerEventHandler;

//add action to remote controlled unit to change languages


// Example: Add radio self-action to all civilian cars
["ace_interact_menu_newControllableObject", {
    params ["_type"]; // string of the object's classname

    private _aceAction = [
        "cvo_babel_setLangauge",            // * 0: Action name <STRING>
        "Babel - Set Language:",            //  * 1: Name of the action shown in the menu <STRING>
        "",                                 //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
        {""},                               //  * 3: Statement <CODE>
        {player isNotEqualTo ace_player},   //  * 4: Condition <CODE>
        {                                   //  * 5: Insert children code <CODE> (Optional)
            params ["_target", "_player", "_params"];

            private _actions = [];
            {
                private ["_languageName", "_languageArray"];
                if (_x == "ALL") then {
                    _languageName = "All Languages";
                    _languageArray = cvo_babel_zeusLanguages;
                } else {
                    _languageName = [_x] call acre_api_fnc_babelGetLanguageName;
                    _languageArray = [_x];
                };

                private _actionID = (["cvo","babel","setLangauge"] + _languageArray) joinString "_";
                private _actionTitle = format ["%1", _languageName];
                private _icon = "";
                private _statement = {
                    params ["_target", "_player", "_params"];
                    _params params ["_languageName", "_languageArray"];

                    _languageArray call acre_api_fnc_babelSetSpokenLanguages;
                    systemChat format ["CVO Babel - Given Langauge: %1", _languageArray apply {[_x] call acre_api_fnc_babelGetLanguageName;}];

                };
                private _condition = {
                        params ["_target", "_player", "_params"];
                        _params params ["_languageName", "_languageArray"];
                        private _currentlySpoken = [] call acre_sys_core_fnc_getSpokenLanguages;
                        //(_this#2#1 call BIS_fnc_sortAlphabetically)  isNotEqualTo ([] call acre_sys_core_fnc_getSpokenLanguages call BIS_fnc_sortAlphabetically)
                        //(_languageArray call BIS_fnc_sortAlphabetically) isNotEqualTo (_currentlySpoken call BIS_fnc_sortAlphabetically)
                        (_languageArray) isNotEqualTo (_currentlySpoken)
                };
                private _params = [_languageName,_languageArray];
                
                private _action = [_actionID, _actionTitle, _icon, _statement, _condition, {}, _params] call ace_interact_menu_fnc_createAction;
                _actions pushBack [_action, [], _target]; // New action, it's children, and the action's target
            } forEach ["ALL"] + (acre_sys_core_languages apply {_x select 0}) - ["un"];
            _actions
        }
    ] call ace_interact_menu_fnc_createAction;

    ["_type", 1, ["ACE_SelfActions"], _aceAction, true] call ace_interact_menu_fnc_addActionToClass;

}] call CBA_fnc_addEventHandler;

diag_log "[CVO] [ACRE] (Acre Unconcious) - Init End";
