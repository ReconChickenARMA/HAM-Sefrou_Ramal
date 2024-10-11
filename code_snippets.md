Unhide Layer Action Crate
```sqf

[this, ["FOB-NW"], 50, 2, true, false] call cvo_ula_fnc_register;
["FOB-NW", "FOB-NW-MarkerFlags"] call cvo_ula_fnc_register_cleanup;


[this, true] call ace_dragging_fnc_setCarryable;
[this, true] call ace_dragging_fnc_setDraggable;

[this] call CVO_LOGISTICS_fnc_initCreatedObject;
```
