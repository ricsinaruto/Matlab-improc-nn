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
double P = 2.7;
double ref_vel = 7;
static double error_vel= 0;

static float z_1=0.0, z_2=0.0, z_3=0.0;
static float ztmp_1=0.0, ztmp_2=0.0;

float ad11= 0.9989, ad12= 9.8248e-004, ad13= 4.0937e-007;
float ad21= -3.2749, ad22= 0.9497, ad23= 7.3686e-004;
float ad31= -5.8949e+003, ad32= -91.6978, ad33= 0.5076;
float bd1= 0.0011, bd2= 3.2749, bd3= 5.8949e+003;

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
ResultData.StateVariable_5 = ref_vel;
ResultData.StateVariable_6 = error_vel;
ResultData.Torque = P*error_vel;
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
