#include <windows.h>
#include <stdio.h>
#include <rtapi.h>
#include <math.h>
#include <string.h>

#define PI 3.14159265358979323846

typedef struct
{   
	float	 Position;
	float	 Velocity;
	float	 Torque;
	float	 StateVariable_5;
	float	 StateVariable_6;
	float	 StateVariable_7;
	float	 StateVariable_8;
	float	 StateVariable_9;
	float	 StateVariable_10;
} NewControllerData;

NewControllerData CalculateController(
		const float	 CurrentPosition,
		const float	 OldPosition,
		const float	 OldVelocity,
		const float	 CurrentTime,
		const float	 OldTime,
		const float	 Old_StateVariable_5,
		const float	 Old_StateVariable_6,
		const float	 Old_StateVariable_7,
		const float	 Old_StateVariable_8,
		const float	 Old_StateVariable_9,
		const float	 Old_StateVariable_10
		)
{
	NewControllerData ResultData; // result
double P_par = 1.625696969;
double I_par = 0;
double ref_vel = 7;
static double error_vel;
static double error_vel_int=0.0;
double load = 0;

static float T_1=0.0, T_2=0.0, T_3=0.0;
static float T_4=0.0, T_5=0.0, T_6=0.0;
static float T_7=0.0, T_8=0.0, T_9=0.0;

static float z_1=0.0, z_2=0.0, z_3=0.0;
static float ztmp_1=0.0, ztmp_2=0.0;

float ad11 = 0.99591, ad12 = 0.00095987, ad13 = 3.652e-007;

float ad21 = -11.3235, ad22 = 0.88778, ad23 = 0.00061567;
float ad31 = -19089.6748, ad32 = -193.6165, ad33 = 0.30752;
float bd1 = 0.0040906, bd2 = 11.3235, bd3 = 19089.6748;


// Position is saved automatically
ResultData.Position = CurrentPosition;
// Angular velocity is saved automatically
if (CurrentTime != 0.0f){
	ResultData.Velocity = (1000.0f * (float)(CurrentPosition - OldPosition)/(float)(CurrentTime - OldTime));
}
else {
	ResultData.Velocity = 0.0f;
}
	                    
ztmp_1=ad11* z_1+ad12* z_2+ad13* z_3 + bd1* ResultData.Velocity;
ztmp_2=ad21* z_1+ad22* z_2+ad23* z_3 + bd2* ResultData.Velocity;
z_3=ad31* z_1+ad32* z_2+ad33* z_3 + bd3* ResultData.Velocity;
z_1 = ztmp_1;
z_2 = ztmp_2;
ResultData.Velocity =z_1;

error_vel=ref_vel- ResultData.Velocity;
error_vel_int = error_vel_int + error_vel*(CurrentTime - OldTime)/1000;
ResultData.StateVariable_5 = ref_vel;
ResultData.StateVariable_6 = error_vel;
ResultData.StateVariable_7 = error_vel_int;
ResultData.Torque = T_1;
T_1=T_2;
T_2=T_3;
T_3=T_4;
T_4=T_5;
T_5=T_6;
T_6=T_7;
T_7=T_8;
T_8=T_9;
T_9= P_par*error_vel + I_par*error_vel_int - load;
if (T_9 > 5) { T_9 = 5;
error_vel_int = error_vel_int - error_vel*(CurrentTime - OldTime)/1000;}

if (T_9 < -5) { T_9 = -5;
error_vel_int = error_vel_int - error_vel*(CurrentTime - OldTime)/1000;}
	return ResultData;
}
