#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
GVAR(transmitters) = true call CBA_fnc_createNamespace;
publicVariable QGVAR(transmitters);

{
    [_x, "InitPost", LINKFUNC(initUavs), true, [], true] call CBA_fnc_addClassEventHandler;
}
forEach ["UAV", "UAV_01_base_F", "UAV_03_base_F", "UAV_06_base_F", "UGV_01_base_F", "UGV_02_Base_F"];
