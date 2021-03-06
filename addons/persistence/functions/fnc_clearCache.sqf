#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/

// Persistence
{
    profileNamespace setVariable [format ["TBMod_persistence_buildings_%1", _x], nil];
    profileNamespace setVariable [format ["TBMod_persistence_%1", _x], nil];
    //Delete old. Backcomp 2
    profileNamespace setVariable [format ["TB_persistent_buildings_%1", _x], nil];
    profileNamespace setVariable [format ["TB_persistence_%1", _x], nil];
}
forEach (profileNamespace getVariable [QGVAR(savedNames), []]);
profileNamespace setVariable [QGVAR(savedNames), nil];

// Delete old. Backcomp
for "_i" from 1 to 5 do
{
    profileNamespace setVariable [format ["TBMod_persistent_buildings_%1", _i], nil];
    profileNamespace setVariable [format ["TBMod_persistence_%1", _i], nil];
};

// Inkognitiosystem
profileNamespace setVariable ["TB_umziehen", nil];

saveProfileNamespace;

systemChat "[Persistence] ProfileNamespace wurde aufgeräumt!";
