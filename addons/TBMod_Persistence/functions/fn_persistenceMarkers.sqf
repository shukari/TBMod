/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_save", false, [false]],
        ["_storagearray", [], []]
    ];

if (_save) then
{
    {
        _storagearray pushBack [
            _x,
            markerPos _x,
            markerColor _x,
            markerSize _x,
            markerType _x,
            markerAlpha _x,
            markerBrush _x,
            markerDir _x,
            markerShape _x,
            markerText _x
        ];
    }
    forEach allMapMarkers;
}
else // load
{
    {
        _x params ["_marker", "_pos", "_color", "_size", "_type", "_alpha", "_brush", "_dir", "_shape", "_text"];
        if (((_marker select [0, 13]) == "_USER_DEFINED") || (_marker select [0, 17]) == "curatorInterface_") then {
            private _newMarker = createMarker [_marker, _pos];
            _newMarker setMarkerColor _color;
            _newMarker setMarkerSize _size;
            _newMarker setMarkerType _type;
            _newMarker setMarkerAlpha _alpha;
            _newMarker setMarkerBrush _brush;
            _newMarker setMarkerDir _dir;
            _newMarker setMarkerShape _shape;
            _newMarker setMarkerText _text;
        }
    }
    forEach _storagearray;
};

(format ["[TBMod_persistence] Marker wurden ge%1.", ["laden", "speichert"] select _save]) remoteExecCall ["systemChat"];
_storagearray;
