sv_1_jmkpqwe20iinyo45dirb1w3p
sv_2_jmkpqwe20iinyo45dirb1w3p
sv_3_jmkpqwe20iinyo45dirb1w3p
sv_4_jmkpqwe20iinyo45dirb1w3p
 
time=time/1000;
plot(time,position);
set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Position [rad]');
title('Konstans nyomaték');
% you can adjust your axis
grid
print -djpeg open_poz
 
 
plot(time,velocity);
set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Velocity [rad/s]');
title('Konstans nyomaték');
% you can adjust your axis
grid
print -djpeg open_vel
 
plot(time,torque)
set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Torque [Nm]');
title('Konstans nyomaték');
% you can adjust your axis
grid
print -djpeg open_torque
 

