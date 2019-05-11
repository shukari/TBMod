/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
#define ADD_PRECISE_SMOKE(TYPE) class TYPE; \
    class TYPE##_precise : TYPE \
    { \
        simulation = "shotSmoke"; \
        deflecting = 0; \
        deflectionSlowDown = 0.1; \
        deflectionDirDistribution = 0; \
        timeToLive = 120; \
    }

class CfgAmmo
{
    // RHS
    ADD_PRECISE_SMOKE(rhs_40mm_smoke_green);
    ADD_PRECISE_SMOKE(rhs_40mm_smoke_red);
    ADD_PRECISE_SMOKE(rhs_40mm_smoke_white);
    ADD_PRECISE_SMOKE(rhs_40mm_smoke_yellow);

    class rhs_g_vog25;
    class rhs_g_vg40sz : rhs_g_vog25 // Unterlauf-Stungrenade
    {
        deflection = 0;
        fuseDistance = 10;
        ExplosionEffects = "RHS_flashbang_20"; // RHS_flashbang_10
    };

    class rhsusf_40mm_HE;
    class TB_rhsusf_40mm_HET : rhsusf_40mm_HE // Unterlauf-HE
    {
        caliber = 0.15; // 2
        deflecting = 0; // 5 - 100 = HET Wert
        fuseDistance = 10; // 15
        hit = 9; // 20
        indirectHit = 8.5; // 5
        indirectHitRange = 10.5; // 10.7

        class HitEffects
        {
            hitMetal = "RHS_m397_hit";
            hitMetalPlate = "RHS_m397_hit";
            hitBuilding = "RHS_m397_hit";
            hitConcrete = "RHS_m397_hit";
            hitGroundSoft = "RHS_m397_hit";
            hitGroundHard = "RHS_m397_hit";
            default_mat = "RHS_m397_hit";
            hitFoliage = "RHS_m397_hit";
            hitGlass = "RHS_m397_hit";
            hitGlassArmored = "RHS_m397_hit";
            hitWood = "RHS_m397_hit";
            hitPlastic = "RHS_m397_hit";
            hitRubber = "RHS_m397_hit";
            hitMan = "RHS_m397_hit";
            hitWater = "RHS_m397_hit";
            hitVirtual = "RHS_m397_hit";
        };
    };
    class TB_rhs_40mm_Delay : rhsusf_40mm_HE // Unterlauf-Delay Grenade
    {
        deflecting = 0; // 5
        explosionAngle = 360; // 60
        explosionTime = 4; // 0
        fuseDistance = 9; // 15
        hit = 0; // 20
        indirectHit = 6; // 5
        indirectHitRange = 6.5; // 3.6
        model = "\A3\Weapons_f\Data\bullettracer\tracer_yellow"; // \A3\weapons_f\ammo\UGL_slug
        tracerColor[] = {0.9,0.9,0.1,1}; // {0.7,0.7,0.5,0.04}
        tracerColorR[] = {0.9,0.9,0.1,1}; // {0.7,0.7,0.5,0.04}
        visibleFire = 0.3; // 1
        visibleFireTime = 1; // 3

        // in Reference und Original nicht vorhanden - https://community.bistudio.com/wiki/Weapons_settings
        tracerEndTime = 3.98;
        tracerScale= 1.2;
        tracerStartTime = 0.04;
    };

    class rhsusf_40mm_HEDP;
    class TB_rhs_40mm_HEDP : rhsusf_40mm_HEDP // Unterlauf-HEDP - hat gewollt kaum Wirkung gegen KPz
    {
        ace_frag_enabled = 0;
        ace_frag_force = 0;
        deflecting = 0; // 5
        hit = 70; // 20
        indirectHit = 65; // 5
        indirectHitRange = 0.9; // 3.6
    };

    class rhs_ammo_12g_slug;
    class TB_rhs_ammo_40mm_Slugshot : rhs_ammo_12g_slug // Unterlauf-Slug
    {
        caliber = 2; // 0.3048;
        deflecting = 0; // 30
        hit = 25; // 34.51
    };

    // Flare Time2Life
    #define CHANGETIMETOLIFE(NAME) class NAME; class TB_##NAME : NAME {timeToLive = 180;}
    CHANGETIMETOLIFE(rhsusf_40mm_white);
    CHANGETIMETOLIFE(rhsusf_40mm_green);
    CHANGETIMETOLIFE(rhsusf_40mm_red);
};
