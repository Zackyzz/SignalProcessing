clc
clear all
close all

%%
A=2;
F=2; %HZ
Fs=50; %Hz
durata = 2; % seconde
fi0=0; % faza initiala

t=0:1/Fs:durata;
s=A*sin(2*pi*F*t+fi0);
c=(7-A)+A*cos(2*pi*F*t+fi0);
figure()
hold on
plot(t,c,"b");
stem(t,c,"BaseValue",5);
axis([0,durata,-A+4,A+6]);
xlabel("nTs"),ylabel("x[n]"),title("cosinusoida")
grid;
hold off

%%
%--------- square

A2=2;
F2=2; %HZ
Fs2=50; %Hz
durata2 = 2-1/Fs2; % seconde
fi02=0; % faza initiala

t2=0:1/Fs2:durata2;
sq=A*square(2*pi*F2*t2+fi02);
figure();
% plot(t2,sq),axis([0,durata,-A-1,A+1]);

%--------- fierastrau
A3=1;
F3=2; %HZ
Fs3=50; %Hz
durata3 = 2-1/Fs3; % seconde
fi03=0; % faza initiala

t3=0:1/Fs3:durata3;
sw=A3*sawtooth(2*pi*F3*t3+fi03,0.5);
figure();
subplot(2,3,1);
plot(t,s,"b");
axis([0,durata,-A-1,A+1]);
title("semnal triunghiular");
subplot(2,3,2);
plot(t2,sq,"g"),axis([0,durata,-A-1,A+1]);
axis([0,durata,-A2-1,A2+1]);
title("semnal triunghiular");
subplot(2,3,3);
plot(t3,sw,"r"),axis([0,durata,-A3-1,A3+1]),grid,
title("semnal triunghiular");

subplot(2,3,4);
hold on
plot(t,s,"b");
stem(t,s,"b");
axis([0,durata,-A-1,A+1]);
title("semnal triunghiular");
hold off
subplot(2,3,5);
plot(t2,sq,"g"),
stem(t2,sq,"g"),
axis([0,durata,-A-1,A+1]);

axis([0,durata,-A2-1,A2+1]);
title("semnal triunghiular");
subplot(2,3,6);
plot(t3,sw,"r"),
stem(t3,sw,"r"),axis([0,durata,-A3-1,A3+1]),grid,
title("semnal triunghiular");

