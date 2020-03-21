#include "\z\ace\addons\medical_treatment\script_component.hpp"

/*
 * Author: mharis001
 * Calculates the Surgical Kit treatment time based on the amount of stitchable wounds.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * Treatment Time <NUMBER>
 *
 * Example:
 * [player, cursorObject] call TBMod_medical_fnc_getStitchTime
 *
 * Public: No
 */

params ["", "_patient"];

private _inFacility = [ACE_player] call FUNC(isInMedicalFacility);
private _inVehicle = [ACE_player] call FUNC(isInMedicalVehicle);
private _isSani = [_medic, 1] call FUNC(isMedic);
private _isArzt = [_medic, 2] call FUNC(isMedic);

if (isInMedicalFacility) then {
    _bandageTime = _bandageTime * 0.25;
};
if (isInMedicalVehicle) then {
    _bandageTime = _bandageTime * 0.75;
};

private _time = count (_patient call FUNC(getStitchableWounds)) * 0.9 * WOUND_STITCH_TIME;
["Treatmenttime(Stitch) ->Take: %1, Sani: %2, Arzt: %3, Vehicle: %4, Facility: %5", _time, _isSani, _isArzt, _inVehicle, _inFacility] call TBMod_main_fnc_debug;

_time;
