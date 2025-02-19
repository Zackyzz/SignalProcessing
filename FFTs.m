% This script generates two sinusoidal signals which are combined into a signled signal.
% Afterwards, some analysis using the Fast Fourier Transform (FFT) is performed.
% The signals are visualized in time and frequency domains.

clc
clear all
close all

A1=2;
F1=100;

A2=1;
F2=300;

Fs=5000;
durata=1;

t=0:1/Fs:durata-1/Fs;

s1=1/2+A1*sin(2*pi*F1*t);

s2=A2*cos(2*pi*F2*t);
s3=s1+s2;

X1=abs(fftshift(fft(s1)));
axa1=linspace(-Fs/2,Fs/2,length(s1));
plot(axa1,X1)
xlabel("F[Hz]");
axa2=-Fs/2:Fs/(length(s)-1):Fs/2;

X2=fftshift(abs(fft(s2)));
axa2=linspace(-Fs/2,Fs/2,length(s2));

X3=fftshift(abs(fft(s3)));
axa3=linspace(-Fs/2,Fs/2,length(s3));

figure();
hold on
    subplot(3,2,1);
    titlu=['F = ', num2str(F1), 'Hz'];
    plot(t,s1), grid
    axis([0,durata/100,-A1-1,A1+1]),title(titlu)
    xlabel("timp(s)");

    subplot(3,2,2);
    titlu2=['Spectrul sinusoidei cu F = ', num2str(F1), 'Hz'];
    plot(axa1,X1),title(titlu2);
    xlabel("F[Hz]");

    subplot(3,2,3);
    titlu3=['F = ', num2str(F2), 'Hz'];
    plot(t,s2), grid
    axis([0,durata/100,-A2-1,A2+1]),title(titlu3),
    xlabel("timp(s)");

    subplot(3,2,4);
    titlu4=['Spectrul sinusoidei cu F = ', num2str(F2), 'Hz'];
    plot(axa2,X2),title(titlu4);
    xlabel("F[Hz]");

    subplot(3,2,5);
    plot(t,s3), grid
    axis([0,durata/100,-A1-1,A1+1]),title("s=s1+s2")
    xlabel("timp(s)");

    subplot(3,2,6);
    plot(axa3,X3),title("Spectrul lui s");
    axis([-Fs/2-1,Fs/2+1,0,Fs/2*A1+Fs/10]);
    xlabel("F[Hz]");
hold off