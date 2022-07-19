clc
clear all
close all

F1=500; F2=1000; F3=1500;
A=1; durata=1; Fs=5000;

[t1,s1]=sinusoida(A,F1,Fs,durata,0);
[t2,s2]=sinusoida(A,F2,Fs,durata,0);
[t3,s3]=sinusoida(A,F3,Fs,durata,0);
summ=s1+s2+s3;

X=abs(fftshift(fft(summ)));
axa=linspace(-Fs/2,Fs/2,length(summ));

% figure();
% plot(axa,X),title("Spectrul sumei");
% axis([-Fs/2-1,Fs/2+1,0,Fs/2*A+Fs/10]);
% xlabel("F[Hz]");

N=1001; Ft=750;
n=-(N-1)/2:(N-1)/2;

% Pentrul filtrare trece jos
h=2*Ft/Fs*sinc(2*n*Ft/Fs);
XR=abs(fftshift(fft(h)));
axaR=linspace(-Fs/2,Fs/2,length(h));

% figure();
% plot(axaR,XR);
% title("Caracteristica reala");
% xlabel("F[Hz]");

filtrare=conv(summ,h);
X3=fftshift(abs(fft(filtrare)));
axa3=linspace(-Fs/2,Fs/2,length(filtrare));

Ft1=750; Ft2=1250;

% Pentrul filtrare trece banda
hBanda=2*Ft2/Fs*sinc(2*n*Ft2/Fs)-2*Ft1/Fs*sinc(2*n*Ft1/Fs);
XRBanda=abs(fftshift(fft(hBanda)));
axaRBanda=linspace(-Fs/2,Fs/2,length(hBanda));
filtrareB=conv(summ,hBanda);
X4=fftshift(abs(fft(filtrareB)));
axa4=linspace(-Fs/2,Fs/2,length(filtrareB));

% Pentrul filtrare trece banda
hOpreste=sinc(n)-2*Ft2/Fs*sinc(2*n*Ft2/Fs)-2*Ft1/Fs*sinc(2*n*Ft1/Fs);
XOpreste=abs(fftshift(fft(hOpreste)));
axaOpreste=linspace(-Fs/2,Fs/2,length(hOpreste));
filtOpreste=conv(summ,hOpreste);
X5=fftshift(abs(fft(filtOpreste)));
axa5=linspace(-Fs/2,Fs/2,length(filtOpreste));

figure();
hold on;
    subplot(3,1,1)
    plot(axa,X),title("Spectrul sumei");
    axis([-Fs/2-1,Fs/2+1,0,Fs/2*A+Fs/10]);
    xlabel("F[Hz]");

    subplot(3,1,2);
    plot(axaR,XR);
    title("Caracteristica reala");
    xlabel("F[Hz]");

    subplot(3,1,3);
    plot(axa3,X3);
    title("Trece doar f de 500Hz");
    xlabel("F[Hz]");
hold off;

figure();
hold on;
    subplot(3,1,1)
    plot(axa,X),title("Spectrul sumei");
    axis([-Fs/2-1,Fs/2+1,0,Fs/2*A+Fs/10]);
    xlabel("F[Hz]");

    subplot(3,1,2);
    plot(axaRBanda,XRBanda);
    title("Caracteristica reala");
    xlabel("F[Hz]");

    subplot(3,1,3);
    plot(axa4,X4);
    title("Trece doar f de 1000Hz");
    xlabel("F[Hz]");
hold off;


figure();
hold on;
    subplot(3,1,1)
    plot(axa,X),title("Spectrul sumei");
    axis([-Fs/2-1,Fs/2+1,0,Fs/2*A+Fs/10]);
    xlabel("F[Hz]");

    subplot(3,1,2);
    plot(axaOpreste,XOpreste);
    title("Caracteristica reala");
    xlabel("F[Hz]");

    subplot(3,1,3);
    plot(axa5,X5);
    title("Trece doar f de 500Hz si cea de 1000Hz");
    xlabel("F[Hz]");
hold off;