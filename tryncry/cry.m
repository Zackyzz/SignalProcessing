clc
clear all
close all

%{
Introduceti numele de familie:Burghelea
Sa se genereze un semnal dreptunghiular cu frecventa de repetitie: 90Hz
durata = 1secunda, amplitudine = 1, faza initiala = 0, frecventa de esantionare = 10kHz
Cerinte:
a) sa se afiseze primele 50ms ale semnalului dreptunghiular
b) sa se afiseze spectrul semnalului dreptunghiular
c) Metoda 1. Calculul coeficientilor folosind TFDI:
c.1) folosind TFDI sa se calculeze coeficientii filtrului, a.i. in urma filtrarii semnalului dreptunghiular sa treaca doar armonica de ordin 3
c.2) sa se afiseze caracteristica de amplitudine a filtrului
c.3) sa se reprezinte spectrul semnalului filtrat
c.4) sa se reprezinte in domeniul timp primele 50ms ale semnalului filtrat
d) Metoda 2. Calculul coeficientilor folosind TFTDI:
d.1) folosind TFTDI sa se calculeze coeficientii filtrului, a.i. in urma filtrarii semnalului dreptunghiular sa treaca doar armonica de ordin 3
d.2) sa se afiseze caracteristica reala de amplitudine a filtrului
d.3) sa se reprezinte spectrul semnalului filtrat
%}

A=4; fi0=-5*pi/6;
F=700; Fs=10000;
durata=1;

t = 0:1/Fs:durata;
s = A*sin(2*pi*F*t+fi0);

% a)
figure(1)
plot(t,s)
title("Primele ms ale semnalului dreptunghiular:")
axis([0,0.01,-A-0.5,A+0.5])

% b)
axaX1 = linspace(-Fs/2,Fs/2,length(s));
FFT1 = abs(fftshift(fft(s)));

figure(2)
plot(axaX1,FFT1)
title("Spectrul semnalului dreptunghiular:")
xlabel("F[Hz]")

% c)TFDI

N=1000;
interval=-(N-1)/2:(N-1)/2;
Ft1=220;
Ft2=330;

H=zeros(1,N);
H(round(-Ft2*N/Fs+(N+1)/2):round(Ft2*N/Fs+(N+1)/2))=1;
H(round(-Ft1*N/Fs+(N+1)/2):round(Ft1*N/Fs+(N+1)/2))=0;

% c.1)
% arrayfun mapeaza functia anonima (primul parametru) peste fiecare element
% din doilea parametru (care e un vector) si returneaza un vector nou
h=arrayfun(@(x) 1/N*dot(H,cos(2*pi*interval*x/N)), interval);
% figure();
% plot(interval,h);
% title("Coeficientii filtrului (cu TFDI):");

%% c.2)
Fq=interval*Fs/N;
figure(3)
plot(Fq,H)
title("Caracteristica discreta de amplitudine:")
ylim([0,1.25])
%%

% c.3)
sFiltrat=conv(s,h);
axaX2=linspace(-Fs/2,Fs/2,length(sFiltrat));
FFT2=abs(fftshift(fft(sFiltrat)));

figure(4)
plot(axaX2,FFT2)
title("Spectrul semnalului filtrat (cu TFDI):")
xlabel("F[Hz]")
%%
% c.4)
newt=0:1/Fs:(length(sFiltrat)-1)/Fs;
figure(5)
plot(newt,sFiltrat)
title("Primele 50 ms din semnalul filtrat")
axis([0,0.05,-A-0.5,A+0.5])

% d) TFTDI
n=interval;

% d.1)
hBanda=2*Ft2/Fs*sinc(2*n*Ft2/Fs)-2*Ft1/Fs*sinc(2*n*Ft1/Fs);

% d.2)
axaBanda=linspace(-Fs/2,Fs/2,length(hBanda));
XBanda=abs(fftshift(fft(hBanda)));

figure(6)
plot(axaBanda,XBanda)
title("Caracteristica reala de amplitudine a filtrului:")
xlabel("F[Hz]")

% d.3)
sFiltrat2=conv(hBanda,s);
axa3=linspace(-Fs/2,Fs/2,length(sFiltrat2));
FFT3=abs(fftshift(fft(sFiltrat2)));

figure(7)
plot(axa3,FFT3)
title("Spectrul semnalului filtrat (cu TFTDI):")
xlabel("F[Hz]")
