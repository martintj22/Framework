/*
	File : fn_placestorage.sqf
	Author: NiiRoZz

	Description:
	PLace container were player select with preview

*/
private["_container"];
if(!life_container_active) exitWith {};
if(life_container_activeObj == ObjNull) exitWith {};
if(!((typeOf life_container_activeObj) in ["B_supplyCrate_F","Box_IND_Grenades_F"])) exitWith {};
_container = life_container_activeObj;
_isFloating = if (((getPos _container) select 2) < 0.1) then {false} else {true};
detach _container;
_container setPosATL [getPosATL _container select 0, getPosATL _container select 1, (getPosATL _container select 2) + 0.7];
_container enableSimulationGlobal true;
_container allowDamage false;
if((typeOf _container) == "B_supplyCrate_F") then {
	[false,"storagebig",1] call life_fnc_handleInv;
} else {
	[false,"storagesmall",1] call life_fnc_handleInv;
};
[_container, _isFloating] call life_fnc_placeContainer;
clearWeaponCargoGlobal _container;
clearMagazineCargoGlobal _container;
clearItemCargoGlobal _container;
clearBackpackCargoGlobal _container;
life_container_active = false;
life_container_activeObj = ObjNull;
