function[t,s] = sinusoida(A,F,Fs,durata,fi0)
% generare sinusoida cu parametrii A,F,Fs,durata,fi0
    t=0:1/Fs:durata;
    s=A*sin(2*pi*F*t+fi0);