/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Original by https://github.com/BourbonWarfare/POTATO
    Modified by http://tacticalbacon.de
*/
class Extended_PreStart_EventHandlers
{
    class ADDON
    {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers
{
    class ADDON
    {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers
{
    class ADDON
    {
        clientInit = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};

class Extended_FiredBIS_EventHandlers
{
    class TB_vz99_mortar
    {
        class ADDON
        {
            firedBIS = QUOTE(_this call FUNC(handleFired));
        };
    };
};
