/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Original by https://github.com/BourbonWarfare/POTATO
    Modified by http://tacticalbacon.de
*/
class Mode_SemiAuto;

class CfgWeapons
{
    class Launcher_Base_F;
    class TB_vz99_carryWeapon : Launcher_Base_F
    {
        author = "PabstMirror";
        scope = 2;
        displayName = "VZ99 60mm Mortar";
        model = QPATHTOF(data\vz99_carry);
        picture = QPATHTOF(ui\weaponSide_ca.paa);
        modes[] = {};
        ace_reloadlaunchers_enabled = 1;

        class WeaponSlotsInfo {
            mass = 66; // 3kg
        };
    };

    class CannonCore;
    class TB_vz99_mortar60mm : CannonCore
    {
        class StandardSound
        {
            SoundSetShot[] = {"Mortar82mm_Shot_SoundSet", "Mortar82mm_Tail_SoundSet"};
            begin1[] = {"A3\Sounds_F\arsenal\weapons_static\Mortar\mortar_01", 1.25893, 1,250};
            begin2[] = {"A3\Sounds_F\arsenal\weapons_static\Mortar\mortar_02", 1.25893, 1,250};
            soundBegin[] = {"begin1", 0.5, "begin2", 0.5};
        };

        modes[] = {"Trigger"};
        class Trigger: Mode_SemiAuto
        {
            class StandardSound
            {
                SoundSetShot[] = {"Mortar82mm_Shot_SoundSet", "Mortar82mm_Tail_SoundSet"};
                begin1[] = {"A3\Sounds_F\arsenal\weapons_static\Mortar\mortar_01", 1.25893, 1, 250};
                begin2[] = {"A3\Sounds_F\arsenal\weapons_static\Mortar\mortar_02", 1.25893, 1, 250};
                soundBegin[] = {"begin1", 0.5, "begin2", 0.5};
            };
            sounds[] = {"StandardSound"};
            reloadSound[] = {"A3\Sounds_F\arsenal\weapons_static\Mortar\reload_mortar", 1, 1, 20};
            soundServo[] = {"", 0.0001, 1};
            reloadTime = 1.8;
            minRange = 0;
            midRange = 0;
            maxRange = 0;
            // artilleryDispersion = 0;
            // artilleryCharge = 1;

            displayName = "Trigger";
            textureType = "semi";
        };
        // class Gravity: Trigger {
        //      textureType = "fullAuto";
        //      displayName = "Gravity";
        // };

        ace_reloadlaunchers_enabled = 1;
        scope = 1;
        displayname = "60 mm Mortar";
        nameSound = "CannonCore";
        cursor = "mortar";
        cursorAim = "EmptyCursor";
        sounds[] = {"StandardSound"};
        reloadSound[] = {"A3\Sounds_F\arsenal\weapons_static\Mortar\reload_mortar", 1, 1, 20};
        reloadMagazineSound[] = {"A3\Sounds_F\arsenal\weapons_static\Mortar\reload_magazine_Mortar", 1, 1, 20};
        soundServo[] = {"", 0.0001, 1};
        minRange = 80;
        minRangeProbab = 0.7;
        midRange = 2000;
        midRangeProbab = 0.7;
        maxRange = 4000;
        maxRangeProbab = 0.1;
        reloadTime = 1.8;
        magazineReloadTime = 3.3; ///xxxxxxxxxxxxxxx
        maxLeadSpeed = 100;
        autoReload = 1;
        canLock = 0;
        magazines[] = {
            "TB_vz99_HE",
            "TB_vz99_HE_charge0",
            "TB_vz99_HE_multi",
            "TB_vz99_HE_multi_charge0",
            "TB_vz99_HE_PRX",
            "TB_vz99_HE_PRX_charge0",
            "TB_vz99_smokeWhite",
            "TB_vz99_smokeWhite_charge0",
            "TB_vz99_smokeRed",
            "TB_vz99_smokeRed_charge0",
            "TB_vz99_flare",
            "TB_vz99_flare_charge0"
        };
        ballisticsComputer = 0;

        class GunParticles
        {
            class FirstEffect
            {
                effectName = "MortarFired";
                positionName = "Usti Hlavne";
                directionName = "Konec Hlavne";
            };
        };

        class WeaponSlotsInfo {
            mass = 66; // 3kg
        };
    };
};
