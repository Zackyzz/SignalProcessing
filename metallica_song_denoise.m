% This script reads part of a Metallica song with noise
% and applies a band-stop filter to remove noise.

clc
clear all
close all

[y,Fs]=audioread("MetallicaCuZgomot.wav");
durata=length(y)/Fs;

t=0:1/Fs:durata-1/Fs;
axa=linspace(-Fs/2,Fs/2,length(y));
FFTMetallica=fftshift(abs(fft(y)));

N=5001;
n=-(N-1)/2:(N-1)/2;

Ft1=650;Ft2=750;
hOpreste=sinc(n)-2*Ft2/Fs*sinc(2*n*Ft2/Fs)+2*Ft1/Fs*sinc(2*n*Ft1/Fs);
convolutie=conv(y,hOpreste);
XO1=fftshift(abs(fft(convolutie)));
axaO1=linspace(-Fs/2,Fs/2,length(convolutie));

figure();
hold on
    subplot(2,1,1);
    plot(axa,FFTMetallica),title("Frecventele semnalului");
    xlabel("F[Hz]");

    subplot(2,1,2);
    plot(axaO1,XO1),title("Spectrul semnalului filtrat");
    xlabel("F[Hz]");
hold off

soundsc(convolutie,Fs);