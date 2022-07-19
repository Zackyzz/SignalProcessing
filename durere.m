clc
clear all
close all

x=[1,2,3,4,5]; %impar
y=[1,2,3,4,5,0]; %Par

fprintf("x= ")
fprintf("%f ",abs(fft(x)));
fprintf("\ny= ")
fprintf("%f ",abs(fft(y)));
fprintf("\nx shiftat= ")
fprintf("%f ",fftshift(abs(fft(x))));
fprintf("\ny shiftat= ")
fprintf("%f ",fftshift(abs(fft(y))));
