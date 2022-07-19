clc
clear all

A=2;
F=1;
durata=1;
Fs=20;

t=0:1/Fs:durata;
s=A*sin(2*pi*F*t);

ffted = abs(fft(s));

plot(t,ffted);