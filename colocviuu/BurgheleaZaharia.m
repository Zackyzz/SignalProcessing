clc
clear all
close all

%{
Introduceti numele de familie:Burghelea
Introduceti prenumele:Zaharia
Introduceti codul primit:12
In Figura1 aveti reprezentate 2 semnale: semnal s1 si semnal s2
ATENTIE! ambele semnale au durata de 1s, dar s-au reprezentat grafic doar primele 10ms. Fs = 10kHz
Cerinte: 
1. (1p)Identificati parametrii semnalului s1 si reprezentati in Figura 2, semnalul s1
2. (1p)Identificati parametrii semnalului s2 si reprezentati in Figura 3, semnalul s2
3. (1p)Fie semnalul s3 obtinut din suma semnalelor s1 si s2. Reprezentati grafic in Figura 4, semnalul s3
4. (2p)Reprezentati in Figura 5, spectrul semnalului s3
5. Filtrati semnalul s3 astfel incat sa treaca doar sinusoida de frecventa mai joasa.Reprezentati grafic:
(2p) In Figura6, caracteristica reala  de amplitudine a filtrului folosit
(2p) In Figura7, spectrul semnalului obtinut in urma filtrarii
%}

% parametrii comuni
Fs=10000;
durata=1;
t=0:1/Fs:durata;

% 1)
A1=1;
fi1=-pi/2;
F1=200;

s1 = A1*sin(2*pi*F1*t+fi1);

figure(2)
plot(t,s1,"r")
title("Semnal s1")
grid,xlabel("timp(s)"),ylabel("Amplitudine")
axis([0,0.01,-A1-0.25,A1+0.25])

% 2)
A2=4;
fi2=0;
F2=100;

s2 = A2*sin(2*pi*F2*t+fi2);

figure(3)
plot(t,s2,"g")
title("Semnal s2")
grid,xlabel("timp(s)"),ylabel("Amplitudine")
axis([0,0.01,-A2-0.25,A2+0.25])

% 3)
s3=s1+s2;

figure(4)
plot(t,s3)
title("Semnal s3")
grid,xlabel("timp(s)"),ylabel("Amplitudine")
axis([0,0.01,-A2-A1,A2+A1])

% 4)
axaX1 = linspace(-Fs/2,Fs/2,length(s3));
FFT1 = abs(fftshift(fft(s3)));

figure(5)
plot(axaX1,FFT1)
title("Spectrul semnalului s3:")
xlabel("F[Hz]")

% 5) (folosind TFDI)

N=1000;
interval=-(N-1)/2:(N-1)/2;
Ft=260;

H=zeros(1,N);
H(round(-Ft*N/Fs+(N+1)/2):round(Ft*N/Fs+(N+1)/2))=1;

Fq=interval*Fs/N;
figure(6)
plot(Fq,H)
title("Caracteristica reala de amplitudine:")
ylim([0,1.1])

% arrayfun mapeaza functia anonima (primul parametru) peste fiecare element
% din doilea parametru (care e un vector) si returneaza un vector nou
h=arrayfun(@(x) 1/N*dot(H,cos(2*pi*interval*x/N)), interval);

sFiltrat=conv(s3,h);
axaX2=linspace(-Fs/2,Fs/2,length(sFiltrat));
FFT2=abs(fftshift(fft(sFiltrat)));

figure(7)
plot(axaX2,FFT2)
title("Spectrul semnalului filtrat:")
xlabel("F[Hz]")