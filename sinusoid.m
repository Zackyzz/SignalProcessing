function[t,s] = sinusoid(A,F,Fs,duration,fi0)
% generate a sinusoid with parameters A,F,Fs,duration,fi0
    t=0:1/Fs:duration;
    s=A*sin(2*pi*F*t+fi0);