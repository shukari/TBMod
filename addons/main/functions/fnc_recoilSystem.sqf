#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [["_input", false, [false]]];

if (GVAR(recoilCoef) == -1 && _input) then {GVAR(recoilCoef) = 1};
if (GVAR(recoilCoef) == -1 || !GVAR(recoilSystem)) exitWith {};

{
    ace_overheating_cacheSilencerData setVariable _x;
}
forEach [
    ["rhsusf_acc_nt4_black", 4],    //2.4
    ["rhsusf_acc_nt4_tan", 4],      //2.4
    ["rhsusf_acc_rotex5_tan", 4],   //2.4
    ["rhsusf_acc_rotex5_grey", 4],  //2.4
    ["rhsusf_acc_sfmb556", 1.25],   //1.25
    ["rhsusf_acc_sf3p556", 1.25]    //1.25
];

TB_cacheWeaponType = ([currentWeapon player] call BIS_fnc_itemType) select 1;
TB_recoilFreeze = -1;

["weapon", {
    params ["_unit", "_newWeapon"];
    TB_cacheWeaponType = ([_newWeapon] call BIS_fnc_itemType) select 1;
}] call CBA_fnc_addPlayerEventHandler;

GVAR(recoilID) = ["ace_firedPlayer", {
    if (GVAR(recoilCoef) == -1 || !GVAR(recoilSystem)) exitWith {["ace_firedPlayer", GVAR(recoilID)] call CBA_fnc_removePlayerEventHandler};
    params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

    if (toLower _weapon in ["throw", "put"]) exitWith {};
    if (TB_recoilFreeze >= diag_tickTime) exitWith {};
    if (vehicle _unit != _unit) exitWith {_unit setUnitRecoilCoefficient 0.1};

    private _recoil = (getCustomAimCoef _unit) + GVAR(recoilStart);
    private _deploy = isWeaponDeployed _unit;
    private _rested = isWeaponRested _unit;

    // Spezielle WaffenStats
    if (TB_cacheWeaponType == "MachineGun") then {_recoil = _recoil + 1};
    if (TB_cacheWeaponType == "SniperRifle" && {_deploy}) then {_recoil = _recoil - 0.5};

    // Externe Einflüsse
    if (_rested) then {_recoil = _recoil - 0.2};
    if (_deploy) then {_recoil = _recoil - 0.3};

    // Waffen Einflüsse
    if (isClass (configfile >> "CfgPatches" >> "rhsusf_main") && _weapon == primaryWeapon _unit) then // TODO: check ob waffe von RHS, sonst auch nicht
    {
        (primaryWeaponItems _unit) params ["_silencer", "", "", "_bipod"];

        // Silencer
        private _muzzleHider = (toLower _silencer) in ["rhsusf_acc_sf3p556", "rhsusf_acc_sfmb556"];
        if (_mode == "Single" && {_muzzleHider}) then {_recoil = _recoil - 0.2};
        if (_silencer != "" && {!_muzzleHider}) then {_recoil = _recoil - 0.1};

        // Grip
        if (_bipod != "" && !_deploy && _bipod != "rhsusf_acc_harris_bipod") then {_recoil = _recoil - 0.1};
    };

    if (_weapon == handgunWeapon _unit) then
    {
        (handgunItems _unit) params ["_silencer", "", "", "_bipod"];

        if (_silencer != "") then {_recoil = _recoil - 0.1};
    };

    ["Recoil: %1 | Influ: %2 | AimCoef: %3 | Type: %4 | mode: %5 | deploy: %6 | rested: %7",
            (_recoil max 0.5) * GVAR(recoilCoef),
            _recoil max 0.5,
            getCustomAimCoef _unit,
            TB_cacheWeaponType,
            _mode,
            _deploy,
            _rested
        ] call FUNC(debug);
    _unit setUnitRecoilCoefficient ((_recoil max 0.5) * GVAR(recoilCoef));

    TB_recoilFreeze = diag_tickTime + 1;
}] call CBA_fnc_addEventHandler;
