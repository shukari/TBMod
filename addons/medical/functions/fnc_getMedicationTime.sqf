#include "\z\ace\addons\medical_treatment\script_component.hpp"

/*

TBMod_medical_fnc_getIVTime
*/
params ["_medic", "_patient", "_bodypart", "_bandage"];

private _inFacility = [_patient] call FUNC(isInMedicalFacility);
private _inVehicle = [_patient] call FUNC(isInMedicalVehicle);
private _isSani = [_medic, 1] call FUNC(isMedic);
private _isArzt = [_medic, 2] call FUNC(isMedic);

private _time = 5;//Default
["Treatmenttime(Medication) ->Take: %1, Sani: %2, Arzt: %3, Vehicle: %4, Facility: %5", _time, _isSani, _isArzt, _inVehicle, _inFacility] call TBMod_main_fnc_debug;

_time;