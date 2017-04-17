sv_1_jmkpqwe20iinyo45dirb1w3p
sv_2_jmkpqwe20iinyo45dirb1w3p
sv_3_jmkpqwe20iinyo45dirb1w3p
sv_4_jmkpqwe20iinyo45dirb1w3p
sv_5_jmkpqwe20iinyo45dirb1w3p
sv_6_jmkpqwe20iinyo45dirb1w3p
sv_7_jmkpqwe20iinyo45dirb1w3p
 

titlu='Fordulatszám szurok, nyomaték sinperiod=0.5 [s]';
time=time/1000;
plot(time,velocity);
set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Velocity [rad/s]');
title(titlu);
% you can adjust your axis
grid
print -djpeg open_poz
 
 
plot(time,StateVariable_6);
set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Velocity (filtered) [rad/s]');
title(titlu);
% you can adjust your axis
grid
print -djpeg open_vel
 
plot(time,StateVariable_7)
set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Velocity (bessel filtered) [rad/s]');
title(titlu);
% you can adjust your axis
grid
print -djpeg open_torque
 

