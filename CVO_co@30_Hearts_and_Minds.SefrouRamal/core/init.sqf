enableSaving [false, false];

[] call compileScript ["core\def\mission.sqf"];
[] call compileScript ["define_mod.sqf"];

if (isServer) then {
    [] call compileScript ["core\init_server.sqf"];
};

[] call compileScript ["core\init_common.sqf"];

if (!isDedicated && hasInterface) then {
    [] call compileScript ["core\init_player.sqf"];
};

if (!isDedicated && !hasInterface) then {
    [] call compileScript ["core\init_headless.sqf"];
};
cam1 = "camera" camCreate [0,0,0];
cam1 cameraEffect ["Internal", "Back", "uavrtt1"];
cam1 attachTo [yabhon1, [0,0,0], "PiP0_pos"];
addMissionEventHandler ["Draw3D", {
    _dir = 
        (uav selectionPosition "laserstart") 
            vectorFromTo 
        (uav selectionPosition "commanderview");
    cam setVectorDirAndUp [
        _dir, 
        _dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
    ];
}];