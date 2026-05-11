clear
clc

a = linspace(0,90,91);
f_gr = 0.07;
fi = 0.45;
m = 80;
g = 9.81;
u_red = 10;
kpd = 0.9;
T_i = 67.2/1000; %зависимость крутящего момента от тока
r = 0.20;
n = 2; %количество моторов для задней оси

alpha = a*pi/180;
f_0 = f_gr*cos(alpha)+sin(alpha)
fi_0 = fi*cos(alpha)
P_min = f_0*m*g;
P_max = fi_0*m*g;
P_sr = (P_min+P_max)/2;

M_kol_min = P_min*r/2;
M_kol_max = P_max*r/2;
M_kol_sr = P_sr*r/2;
M_mot_min = M_kol_min/u_red/kpd;
M_mot_max = M_kol_max/u_red/kpd;
M_mot_sr = M_kol_sr/u_red/kpd;
I_min = M_mot_min/T_i;
I_max = M_mot_max/T_i;
I_sr = M_mot_sr/T_i;

close all
figure('Name','Тяга от угла','NumberTitle','off','color','w')
plot(a,P_min,a,P_max, a,P_sr, 'g')
hold on
grid on
grid minor
box on
title('Тяга от угла');
xlabel('Угол, градусы')
ylabel('Сила тяги, H')
legend('Минимальная', 'Максимальная', 'Оптимальная')

figure('Name','Ток от угла','NumberTitle','off','color','w')
plot(a,I_min,a,I_max, a,I_sr, 'g')
grid on
grid minor
box on
title('Ток от угла');
xlabel('Угол, градусы')
ylabel('Сила тока, А')
legend('Минимальный', 'Максимальный', 'Оптимальный')
