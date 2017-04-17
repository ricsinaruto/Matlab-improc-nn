sv_1_jmkpqwe20iinyo45dirb1w3p
sv_2_jmkpqwe20iinyo45dirb1w3p
sv_3_jmkpqwe20iinyo45dirb1w3p
sv_4_jmkpqwe20iinyo45dirb1w3p
sv_5_jmkpqwe20iinyo45dirb1w3p
sv_6_jmkpqwe20iinyo45dirb1w3p
sv_7_jmkpqwe20iinyo45dirb1w3p


 

titlu='Stick-slip jelenség PI szabályzónál';
time=time/1000;
plot(time,position);
set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Position [rad]');
title(titlu);
% you can adjust your axis
grid
print -djpeg open_pos


plot(time,velocity);
set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Velocity [rad/s]');
title(titlu);
% you can adjust your axis
grid
print -djpeg open_vel

plot(time,torque);
set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Torque [mNm]');
title(titlu);
% you can adjust your axis
grid
print -djpeg open_tor

plot(time,StateVariable_7);
set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Integral term');
title(titlu);
% you can adjust your axis
grid
print -djpeg open_int


 
 


