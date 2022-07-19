clc
clear all
close all

% Introduceti numele de familie:Burghelea
% Sa se genereze un semnal dreptunghiular cu frecventa de repetitie: 90Hz
% durata = 1secunda, amplitudine = 1, faza initiala = 0, frecventa de esantionare = 10kHz
% Cerinte:
% a) sa se afiseze primele 50ms ale semnalului dreptunghiular
% b) sa se afiseze spectrul semnalului dreptunghiular
% c) Metoda 1. Calculul coeficientilor folosind TFDI:
% c.1) folosind TFDI sa se calculeze coeficientii filtrului, a.i. in urma filtrarii semnalului dreptunghiular sa treaca doar armonica de ordin 3
% c.2) sa se afiseze caracteristica de amplitudine a filtrului
% c.3) sa se reprezinte spectrul semnalului filtrat
% c.4) sa se reprezinte in domeniul timp primele 50ms ale semnalului filtrat
% d) Metoda 2. Calculul coeficientilor folosind TFTDI:
% d.1) folosind TFTDI sa se calculeze coeficientii filtrului, a.i. in urma filtrarii semnalului dreptunghiular sa treaca doar armonica de ordin 3
% d.2) sa se afiseze caracteristica reala de amplitudine a filtrului
% d.3) sa se reprezinte spectrul semnalului filtrat

A=1;fi0=0;
F=90;
Fs=10000;
durata=1;

t=0:1/Fs:durata;
s=A*square(2*pi*F*t+fi0);

% a)
figure();
plot(t,s);
title("Primele secunde");
axis([0,durata/20,-A-0.5,A+0.5]);

axaX1=linspace(-Fs/2,Fs/2,length(s));
X1=fftshift(abs(fft(s)));

% b)
figure();
plot(axaX1,X1),title("Frecventele semnalului");
xlabel("F[Hz]");

% c)
N=1001;
Ft1=200;
Ft2=350;
interval = -(N-1)/2:(N-1)/2;

H=zeros(1,N);
H(round(-Ft2*N/Fs+(N+1)/2):round(Ft2*N/Fs+(N+1)/2))=1;
H(round(-Ft1*N/Fs+(N+1)/2):round(Ft1*N/Fs+(N+1)/2))=0;

Fq=interval*Fs/N;
figure();
stem(Fq,H);
title("Catacteristica de amplitudine la filtru");

h=zeros(1,N);
for n = -(N-1)/2:(N-1)/2
    h(n+(N+1)/2) = 1/N*dot(H,cos(2*pi*interval*n/N));
end

figure();
stem(interval,h);
title("Coeficientii filtrului:");

sFiltrat = conv(h,s);
axa2=linspace(-Fs/2,Fs/2,length(sFiltrat));
FFT2=fftshift(abs(fft(sFiltrat)));

figure();
stem(axa2,FFT2);
title("spectru semnal filtrat");

newt=0:1/Fs:(length(sFiltrat)-1)/Fs;
figure();
plot(newt,sFiltrat);
title("Primele secunde din semnalul filtrat");
axis([0,durata/20,-A-0.5,A+0.5]);

% TFTDI

n=-(N-1)/2:(N-1)/2;
hBanda=2*Ft2/Fs*sinc(2*n*Ft2/Fs)-2*Ft1/Fs*sinc(2*n*Ft1/Fs);
XBanda=abs(fftshift(fft(hBanda)));
axaBanda=linspace(-Fs/2,Fs/2,length(hBanda));

convolutie2=conv(s,hBanda);
XB1=fftshift(abs(fft(convolutie2)));
axaB1=linspace(-Fs/2,Fs/2,length(convolutie2));

figure();
plot(axaBanda,XBanda);
title("TFTDI. Caracteristica reala de amplitudine");

figure();
stem(axaB1,XB1);
title("TFTDI. Spectru semnal filtrat");
