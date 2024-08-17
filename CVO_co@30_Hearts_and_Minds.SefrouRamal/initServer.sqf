// Manages the CSC Source object
{
    // to be executed on server only
    [_x, -1] call ace_cargo_fnc_setSize;
    [_x, -1] call ace_cargo_fnc_setSpace;
    _x setVariable ["ace_cargo_noRename", true, true];
} forEach [cvo_csc_source];

// Add Custom Eventhandler
// Allows the CSC spawned boxes to be deleted by the black tarp
["cvo_csc_Event_crateSpawnedServer", {
    params ["_box", "_name"];
    btc_log_obj_created pushBackUnique _box;
}] call CBA_fnc_addEventHandler;


// Adds Items of the array to each vehicle in the layers of 2. array
private _items = ["ToolKit"];
private _layerNames = ["btc_vehicles", "Player Vehicles"];
{
    private _layerName = _x;
    private _vehicles = getMissionLayerEntities _layerName # 0;
    {
        private _vehicle = _x;
        private _vehicleInventory = itemCargo _vehicle;
        {
            private _desiredItem = _x;
            if (!_desiredItem in _vehicleInventory) then { _vehicle addItemCargoGlobal [_desiredItem, 1]; };
        } forEach _items;
    } forEach _vehicles;
} forEach _layerNames;