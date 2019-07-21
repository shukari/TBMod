/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgAmmo
{
    class BWA3_B_127x99_Ball;
    class BWA3_B_127x99_Ball_AP : BWA3_B_127x99_Ball // 50.cal Long-Range Sniper BW
    {
        ACE_ballisticCoefficients[] = {2}; // {0.67}
        ACE_muzzleVelocityVariationSD = 0.01; // 0.35
        caliber = 1.02533; // 5.2
        deflecting = 0; // 15
        explosive = 0.1; // 0
        hit = 25.3075; // 31.5
        tracerEndTime = 8; // 3
        tracerStartTime = 0.85; // 0.05
    };

    class BWA3_B_127x99_Ball_AP_HEIAP_T : BWA3_B_127x99_Ball_AP // 50.cal HEIAP-T BW
    {
        ACE_ballisticCoefficients[] = {2}; // {0.67}
        ACE_muzzleVelocityVariationSD = 0.01; // 0.4
        caliber = 12.3; // 5.2
        hit = 39.7; // 31.5
        indirectHit = 24.8; // 0
        indirectHitRange = 0.9; // 0
    };
};