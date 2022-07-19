clc
clear all
close all

A=220*sqrt(2);
F=50;
Fs=1000;
durata=1;

t=0:1/Fs:durata;
semnal = A* sin(2*pi*F*t);
figure();
plot(t,semnal);
axis([0,durata/10,-A-30,A+30]),grid
title("Graficul tensiunii de la priza in functie de faza:");

xticks((0 : 1/(2*F) : 10/(2*F)));
xticklabels({'0','\pi','2\pi','3\pi','3\pi','4\pi','5\pi','6\pi','7\pi','8\pi','9\pi'});

% sinusoide defazate

t1=-5/40000:1/100000:0.002;
t2=0:1/100000:0.002;
s1=sin(2*pi*1000*t1+pi/4);
s2=sin(2*pi*1000*t2);

figure();
hold on;
    plot(t1,s1,"r");
    plot(t2,s2,"b");
    axis([-5/40000,0.002,-1.25,1.25]);
    grid,title("Sinusoida rosie defazata cu \pi/4 fata de cea albastra la f=1000Hz:");
hold off;

