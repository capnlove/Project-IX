/// @description Insert description here
// You can write your code in this editor
var jumpAction = false;

var curhspeed = 0;
var curvspeed = 0;
var process_Input = false;

//Verify when we reach end of curve
//Handle key release and deceleration
//Maybe FALLING is simply toggling gravity on and off.
//set process_Input to true whenever an input is caught. If false, decelerate and or fall


if(keyboard_check_pressed(ord("A"))){
	process_Input=true
switch(FacingDirection){
	case "FourthWall":
	//Start moving, begin Accel Curve
	curhspeed = animcurve_channel_evaluate(Accel_channel,0) * -MaxHorizSpeed;
	break;
	case "Left":
	//Already moving Left, push through Accel curve
	if(!MaxSpeedReached) curhspeed = animcurve_channel_evaluate(Accel_channel,Accel_Index);
	break;
	case "Right":
	//Changing direction, apply current hspeed and attenuate by a new Accel Curve
	FacingDirection = "Left";
	curhspeed = hspeed - animcurve_channel_evaluate(Accel_channel, 0)
	break;
}
	Accel_Index+=1;

}

if(keyboard_check_pressed(ord("D"))){
	process_Input=true
switch(FacingDirection){
	case "FourthWall":
	//Start moving, begin Accel Curve
	curhspeed = animcurve_channel_evaluate(Accel_channel,0) * MaxHorizSpeed;
	break;
	case "Left":
	FacingDirection = "Right";
	curhspeed = hspeed + animcurve_channel_evaluate(Accel_channel,Accel_Index);
	break;
	case "Right":
	//Changing direction, apply current hspeed and attenuate by a new Accel Curve
	curhspeed = animcurve_channel_evaluate(Accel_channel,Accel_Index);
	break;
}
	Accel_Index+=1;

}

if (keyboard_check_released(ord("A")))
{
	process_Input=true
	switch(FacingDirection){
	case "FourthWall":
	//Shouldn't happen
	break;
	case "Left":
	//Jump to deceleration curve (halfway point)
	curhspeed = animcurve_channel_evaluate(Accel_channel,0.5);
	Accel_Index+=1;
	break;
	case "Right":
	//Changing direction, apply current hspeed and attenuate by a new Accel Curve
	FacingDirection = "Left";
	//Doesn't change a thing
	break;
}

}

if (keyboard_check_released(ord("D")))
{
	process_Input=true
	switch(FacingDirection){
	case "FourthWall":
	//Shouldn't happen
	break;
	case "Right":
	//Jump to deceleration curve (halfway point)
	curhspeed = animcurve_channel_evaluate(Accel_channel,0.5);
	Accel_Index+=1;
	break;
	case "Left":
	//Changing direction, apply current hspeed and attenuate by a new Accel Curve
	FacingDirection = "Left";
	//Doesn't change a thing
	break;
}
}

if(Accel_Index>=TimeToMaxSpd)
{
	//Reached Top Speed!
	MaxSpeedReached = true
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