sv_1_jmkpqwe20iinyo45dirb1w3p
sv_2_jmkpqwe20iinyo45dirb1w3p
sv_3_jmkpqwe20iinyo45dirb1w3p
sv_4_jmkpqwe20iinyo45dirb1w3p


 

titlu='P szabályozó pozíció ugrás függvényra adott válasza';
time=time/1000;
plot(time,position);
set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Position [rad]');
title(titlu);
% you can adjust your axis
grid
print -djpeg open_vel


plot(time,velocity);
set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Velocity [rad/s]');
title(titlu);
% you can adjust your axis
grid
print -djpeg open_tor


 
 


