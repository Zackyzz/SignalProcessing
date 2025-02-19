% This script generates and visualizes different signals (sine, sawtooth, square)
% Then plots the effects of different sampling frequencies on those signals.

clc
clear all
close all

A=4;
F=2;
Fs=100;
Fs2=20;
durata=2;
fi=0;

t=0:1/Fs:durata;
s=A*sin(2*pi*F*t+fi);

t2=0:1/Fs2:durata;
s2=A*sin(2*pi*F*t2+fi);

t3=1/(4*F):1/F:durata-1/(4*F);
s3=A*sin(2*pi*F*t3+fi);

sawtooth1=A*sawtooth(2*pi*F*t+fi,0.5);
sawtooth2=A*sawtooth(2*pi*F*t2+fi,0.5);

rekt=A*square(2*pi*F*t+fi);

figure();
hold on;

    subplot(2,3,1);
    plot(t,s);
    axis([0,durata,-A-1,A+1]),grid;

    subplot(2,3,2);
    hold on;
    plot(t,s);
    stem(t2,s2);
    axis([0,durata,-A-1,A+1]),grid;
    hold off;
    
    subplot(2,3,3);
    plot(t,sawtooth1);
    axis([0,durata,-A-1,A+1]),grid;
    
    subplot(2,3,4)
    plot(t,rekt);
    axis([0,durata-1/Fs,-A-1,A+1]),grid;
    
    subplot(2,3,5);
    hold on;
    plot(t,sawtooth1);
    stem(t2,sawtooth2);
    axis([0,durata-1/Fs,-A-1,A+1]),grid;
    hold off;
    
    subplot(2,3,6);
    hold on;
    plot(t,s);
    stem(t3,s3);
    axis([0,durata,-A-1,A+1]),grid;
    title("ceva misto"), xlabel("x-axis");
    ylabel("y-axis"), yticks([-5:5]);
    hold off;

hold off;
