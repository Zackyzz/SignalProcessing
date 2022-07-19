clc
clear all
close all

A=2;
F=2;
Fs=20;
durata=2;
fi0=pi/2;

[t,s]=sinusoida(A,F,Fs,durata,fi0);
figure();
hold on;
plot(t,s,"r");
stem(t,s,"b");
axis([0,durata,-A-1,A+1]),grid;