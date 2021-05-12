/// @description Insert description here
// You can write your code in this editor
var jumpAction = false;

var curhspeed = 0;
var curvspeed = 0;


if(keyboard_check_pressed(ord("A"))){
switch(FacingDirection){
	case "FourthWall":
	//Start moving, begin Accel Curve
	curhspeed = animcurve_channel_evaluate(PlayerXAccel,0) * -MaxHorizSpeed;
	break;
	case "Left":
	//Already moving Left, push through Accel curve
	curhspeed = animcurve_channel_evaluate(PlayerXAccel,Accel_Index);
	break;
	case "Right":
	//Changing direction, apply current hspeed and attenuate by a new Accel Curve
	FacingDirection = "Left";
	curhspeed = hspeed - animcurve_channel_evaluate(PlayerXAccel, 0)
	break;
}
	Accel_Index+=1;

}

if(keyboard_check_pressed(ord("D"))){
switch(FacingDirection){
	case "FourthWall":
	//Start moving, begin Accel Curve
	curhspeed = animcurve_channel_evaluate(PlayerXAccel,0) * MaxHorizSpeed;
	break;
	case "Left":
	FacingDirection = "Right";
	curhspeed = hspeed + animcurve_channel_evaluate(PlayerXAccel,Accel_Index);
	break;
	case "Right":
	//Changing direction, apply current hspeed and attenuate by a new Accel Curve
	curhspeed = animcurve_channel_evaluate(PlayerXAccel,Accel_Index);
	break;
}
	Accel_Index+=1;

}


if( keyboard_check_pressed(ord("W")) && Landed )
{
	jumpAction = true;
	//Start jumping curve, remember 
}

//	// JUMP!
if(jumpAction){
//We now start applying the Curve from  JumpCurve
//Do we change the angle of the desired direction by this curve?
//If we are at a standstill, apply curve to vertical speed only
//If we are moving, modify current angle as well

}

hspeed=curhspeed;