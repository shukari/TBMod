#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgPatches
{
    class ADDON
    {
        name = "TBMod poppy";

        units[] = {
        };

        requiredAddons[] = {"TBMod_main"};
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "configs\CfgVehicles.hpp"
#include "configs\ExtendedEventHandlers.hpp"
#include "configs\CfgEditorSubcategories.hpp"
#include "configs\CfgLoadouts.hpp"
