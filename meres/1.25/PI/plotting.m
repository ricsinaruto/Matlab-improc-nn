sv_1_jmkpqwe20iinyo45dirb1w3p
sv_2_jmkpqwe20iinyo45dirb1w3p
sv_3_jmkpqwe20iinyo45dirb1w3p
sv_4_jmkpqwe20iinyo45dirb1w3p


 

titlu='Id�k�sleltetett PI szab�lyz�';
time=time/1000;
plot(time,velocity);
set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Velocity [rad/s]');
title(titlu);
% you can adjust your axis
grid
print -djpeg open_vel

titlu='Id�k�sleltetett PI szab�lyz�';
plot(time,torque);
set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Torque [mNm]');
title(titlu);
% you can adjust your axis
grid
print -djpeg open_tor


 
 


