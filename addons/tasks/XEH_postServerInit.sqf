#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call EFUNC(main,isTBMission)) exitWith {};

GVAR(Namespace) = call CBA_fnc_createNamespace;
GVAR(loadedTasks) = [];
GVAR(pause) = false;

[] spawn {
    waitUntil {uiSleep 1; !isNil QGVAR(Tasks);};
    systemChat str GVAR(Tasks);
    {
        [_x] call FUNC(loadTask);
    } forEach GVAR(Tasks);
};


[] spawn FUNC(loop);