
 
titlu='PI hibatoleráció';
time=time/1000;

plot(time(1:1000),velocity_a(1:1000),'b',time(1:1000),velocity_b(1:1000),'g',time(1:1000),velocity_c(1:1000),'r',time(1:1000),velocity_d(1:1000),'m');

set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Velocity [rad/s]');
legend('a','b','c','d');
title(titlu);
% you can adjust your axis
grid
print -djpeg open_vel

plot(time(1:1000),torque_a(1:1000),'b',time(1:1000),torque_b(1:1000),'g',time(1:1000),torque_c(1:1000),'r',time(1:1000),torque_d(1:1000),'m');

set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Torque [mNm]');
legend('a','b','c','d');
title(titlu);
% you can adjust your axis
grid
print -djpeg open_tor

plot(time(1:1000),integ_a(1:1000),'b',time(1:1000),integ_b(1:1000),'g',time(1:1000),integ_c(1:1000),'r',time(1:1000),integ_d(1:1000),'m');

set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Integral term');
legend('a','b','c','d');
title(titlu);
% you can adjust your axis
grid
print -djpeg open_int


 
 


