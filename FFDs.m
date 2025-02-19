% This generates a sinusoidal signal and computes its Fast Fourier Transform.
% It also plots the signal in time domain and its frequency spectrum using the stem plot.

clc
clear all
close all

A=1;
F=200;
Fs=2000;
durata=1;
t=0:1/Fs:durata-1/Fs;
s=A*sin(2*pi*F*t);

X=fftshift(abs(fft(s)));
% axa=linspace(-Fs/2,Fs/2,length(s));
axa2=-Fs/2:Fs/(length(s)-1):Fs/2;

figure();
hold on
    subplot(2,1,1);
    plot(t,s), grid
    axis([0,durata/10,-A-1,A+1]);

    subplot(2,1,2);
    stem(axa2,X);

hold off