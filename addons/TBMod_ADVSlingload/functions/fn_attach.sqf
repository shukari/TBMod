/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: Eric Ruhland
    Befestigt ein Object
    
    Arguments:
    0: Target <OBJECT>
    1: Helper <OBJECT>
    Return Value:
    None
*/
params ["_target", "_helper"]; 

private _rope = _helper getVariable ['TB_Rope_rope', objNull];
private _source = _rope getVariable ['TB_Rope_Source', objNull];
private _helpergravity = _helper getVariable ['TB_Rope_helpergravity', objNull];

// Sanity Checks
if (isNull _source || isNull _target || isNull _helper || isNull _helpergravity) exitWith {systemChat format ["ERROR(attach): _source %1  _target %2 _helper %3 _helpergravity %4", _source, _target, _helper, _helpergravity]};
if (!alive _source || !alive _target) exitWith {hint "Was zerstört ist sollte nicht benutzt werden"};

private _ray = vectorNormalized ((positionCameraToWorld [0, 0, 0.6]) vectorDiff (positionCameraToWorld [0, 0, 0]));

private _objectfound = lineIntersects [eyepos player, (eyePos player) vectorAdd (_ray vectorMultiply 4), player];
if (!_objectfound) exitWith {systemChat format ["ERROR(attach):no Hitbox _source %1  _target %2 _helper %3 _helpergravity %4", _source, _target, _helper, _helpergravity]};
if (_source == _target) exitWith {hint "Warum versuchst du das?"};

private _attachedVehicle = _source getVariable ['TB_Rope_attachedVehicle', objNull];
if (!isNull _attachedVehicle && _attachedVehicle != _target) exitWith {hint "Es kann nur ein Fahrzeug verbunden werden"};

private _selection = getText (configfile >> "CfgVehicles" >> typeOf _source >> "slingLoadMemoryPoint");
if (_selection == "") exitWith {systemChat format ["ERROR(attach): no Slingloadposition found on _source %1   ", _source]};

private _posToAttach = [player, _ray] call TB_fnc_calculateAttachPoint; 
private _sourcepos = ATLtoASL (_source modelToWorld (_source selectionPosition _selection));

// Sanity Check
if ((_posToAttach distance _sourcepos) > 20) exitWith {hint "Seil ist zu kurz"};

systemChat format ["DEBUG(attach): _source %1  _selection %2 _target %3 _attachoffset %4", _source, _selection, _target, (_target worldToModel ASLtoATL _posToAttach)];

detach _helpergravity;
deleteVehicle _helpergravity;
detach _helper;
deleteVehicle _helper;

["TB_Rope_attachto", [_target, _target worldToModel ASLtoATL _posToAttach, _rope], _rope] call CBA_fnc_targetEvent;
//[_target,  _target worldToModel ASLtoATL _posToAttach, [0, 0, -1]] ropeAttachTo _rope;


_rope setVariable ['TB_Rope_helper', nil, true];
player setVariable ['TB_Rope_helper', nil];
_source setVariable ['TB_Rope_attachedVehicle', _target, true];
_target setVariable ['TB_Rope_original_Mass', getMass _target, true];

if (getMass _target > 12000) then {_target setMass 12000};
player setVariable ["TB_Rope_source", nil];
