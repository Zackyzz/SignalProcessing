clc
clear all
close all

[y,Fs]=audioread("zgomot.wav");
Y=y(:,1);
durata=length(Y)/Fs;

t=0:1/Fs:durata-1/Fs;
axa=linspace(-Fs/2,Fs/2,length(Y));

FFTzgomot=fftshift(abs(fft(Y)));

plot(axa,FFTzgomot);