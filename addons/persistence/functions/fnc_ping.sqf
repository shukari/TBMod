#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/

if (!canSuspend) exitwith {"[TBMod_persistence] Ping muss mit spawn aufgerufen werden" remoteExecCall ["systemChat"]; false};
if (isDedicated) exitwith {"[TBMod_persistence] Ping kann nicht vom Server aufgerufen werden" remoteExecCall ["systemChat"]; false};
//if (!isDedicated && isServer) exitwith {false}; // lokal Server

//systemChat "Ping started";
GVAR(ping) = false;
private _pingStart = CBA_missiontime;

[
    [],
    {
        GVAR(ping) = true;
        remoteExecutedOwner publicVariableClient QGVAR(ping);
    }
] remoteExecCall ["call", 2];

waitUntil {GVAR(ping) || (CBA_missiontime - _pingStart) >= 1};
private _rtt = CBA_missiontime - _pingStart;

if (_rtt > 1) exitwith
{
    systemChat "Ping timed out after 1s";
    false;
};

systemChat format ["Ping was %1 ms", _rtt * 1000];
true;
