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
double P_pos = 1,5;
double P_vel = 2.3;
double I_vel = 50;
double ref_pos = 10;
double ref_vel = 0;
double error_pos = 0;
double error_vel = 0;
static double error_vel_int = 0;
static double ini_0 = 0;
static double ini_1 = -10;

static float z_1=0.0, z_2=0.0, z_3=0.0;
static float ztmp_1=0.0, ztmp_2=0.0;

float ad11= 0.9936, ad12= 9.4621e-004, ad13= 3.4524e-007;
float ad21= - 17.5400, ad22= 0.8515, ad23= 5.6261e-004;
float ad31= -2.8584e+004, ad32= -249.0676, ad33= 0.2264;
float bd1= 0.0064, bd2= 17.5400, bd3= 2.8584e+004;

// Position is saved automatically
ResultData.Position = CurrentPosition;
// Angular velocity is saved automatically
if (CurrentTime != 0.0f){
	ResultData.Velocity = (1000.0f * (float)(CurrentPosition - OldPosition)/(float)(CurrentTime - OldTime));
}
else {
	ResultData.Velocity = 0.0f;
}
	                    
if (ini_1 < 0)
{
ini_0 = ResultData.Position;
}
ini_1 = 5;

ztmp_1=ad11* z_1+ad12* z_2+ad13* z_3 + bd1* ResultData.Velocity;
ztmp_2=ad21* z_1+ad22* z_2+ad23* z_3 + bd2* ResultData.Velocity;
z_3=ad31* z_1+ad32* z_2+ad33* z_3 + bd3* ResultData.Velocity;
z_1 = ztmp_1;
z_2 = ztmp_2;
ResultData.Velocity =z_1;

error_pos = ref_pos- ResultData.Position + ini_0;

ref_vel = error_pos*P_pos;
error_vel = ref_vel - ResultData.Velocity;
error_vel_int = error_vel_int + error_vel*(CurrentTime - OldTime)/1000;

ResultData.StateVariable_5 = ref_pos;
ResultData.StateVariable_6 = ref_vel;
ResultData.StateVariable_7 = error_pos;
ResultData.StateVariable_8 = error_vel;
ResultData.StateVariable_9 = error_vel_int;
ResultData.StateVariable_10 = ResultData.Position - ini_0;

ResultData.Torque = P_vel*error_vel + I_vel*error_vel_int;
if (ResultData.Torque > 5)
{
ResultData.Torque = 5;
}
if (ResultData.Torque < -5)
{
ResultData.Torque = -5;
}
	return ResultData;
}
