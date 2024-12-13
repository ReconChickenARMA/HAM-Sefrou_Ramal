params ["_oldUnit", "_killer", "_respawn", "_respawnDelay"];

// Manages ACE_Spectator white/blacklist
[
    allPlayers, 
    [
        player,
        missionNamespace getVariable ["coy_co", objNull],
        missionNamespace getVariable ["coy_qm", objNull]
    ]
] call ace_spectator_fnc_updateUnits;