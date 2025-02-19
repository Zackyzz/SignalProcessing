% This script applies filters such as: low-pass, band-pass, high-pass and band-stop
% to some various generated sinusoids.

clc
clear all
close all

F1=200; F2=700; F3=1200;
A=1; durata=1; Fs=10000;

[t1,s1]=sinusoid(A,F1,Fs,durata,0);
[t2,s2]=sinusoid(A,F2,Fs,durata,0);
[t3,s3]=sinusoid(A,F3,Fs,durata,0);
summ=s1+s2+s3;

X1=abs(fftshift(fft(summ)));
axa1=linspace(-Fs/2,Fs/2,length(summ));

N=1001;
n=-(N-1)/2:(N-1)/2;

% Pentrul filtrare trece jos
FtJos=450;
hJos=2*FtJos/Fs*sinc(2*n*FtJos/Fs);
XJos=abs(fftshift(fft(hJos)));
axaR=linspace(-Fs/2,Fs/2,length(hJos));

convolutie1=conv(summ,hJos);
newt1=0:1/Fs:(length(convolutie1)-1)/Fs;

XJ1=fftshift(abs(fft(convolutie1)));
axaJ1=linspace(-Fs/2,Fs/2,length(convolutie1));

figure()
hold on;

    subplot(3,2,1);
    plot(t1,summ),title("Suma");
    axis([0,durata/100,-A-2,A+2]);

    subplot(3,2,2);
    plot(axa1,X1),title("Spectrul sumei");
    axis([-Fs/2-1,Fs/2+1,0,Fs/2*A+Fs/10]);
    xlabel("F[Hz]");

    subplot(3,2,3);
    plot(n,hJos),title("Caracteristica reala de amplitudine al lui h");

    subplot(3,2,4);
    plot(axaR,XJos),title("Caracteristica lui h");
    axis([-Fs/2-1,Fs/2+1,0,1.25]);
    xlabel("F[Hz]");

    subplot(3,2,5);
    plot(newt1,convolutie1);title("Semnalul filtrat");
    axis([0.5,0.53,-A-0.25,A+0.25]);

    subplot(3,2,6);
    plot(axaJ1,XJ1),title("Spectrul semnalului filtrat");
    axis([-Fs/2-1,Fs/2+1,0,Fs/2*A+Fs/10]);
    xlabel("F[Hz]");

hold off

% Pentru filtrare trece banda
Ft1=450;Ft2=900;
hBanda=2*Ft2/Fs*sinc(2*n*Ft2/Fs)-2*Ft1/Fs*sinc(2*n*Ft1/Fs);
XBanda=abs(fftshift(fft(hBanda)));
axaBanda=linspace(-Fs/2,Fs/2,length(hBanda));

convolutie2=conv(summ,hBanda);
newt2=0:1/Fs:(length(convolutie2)-1)/Fs;

XB1=fftshift(abs(fft(convolutie2)));
axaB1=linspace(-Fs/2,Fs/2,length(convolutie2));

figure()
hold on;

    subplot(3,2,1);
    plot(t1,summ),title("Suma");
    axis([0,durata/100,-A-2,A+2]);

    subplot(3,2,2);
    plot(axa1,X1),title("Spectrul sumei");
    axis([-Fs/2-1,Fs/2+1,0,Fs/2*A+Fs/10]);
    xlabel("F[Hz]");

    subplot(3,2,3);
    plot(n,hBanda),title("Coeficientii h");

    subplot(3,2,4);
    plot(axaBanda,XBanda),title("Caracteristica reala de amplitudine al lui h");
    axis([-Fs/2-1,Fs/2+1,0,1.25]);
    xlabel("F[Hz]");

    subplot(3,2,5);
    plot(newt2,convolutie2);title("Semnalul filtrat");
    axis([0.5,0.51,-A-0.25,A+0.25]);

    subplot(3,2,6);
    plot(axaB1,XB1),title("Spectrul semnalului filtrat");
    axis([-Fs/2-1,Fs/2+1,0,Fs/2*A+Fs/10]);
    xlabel("F[Hz]");

hold off


% Pentru filtrare trece sus
FtSus=1000;
hSus=sinc(n)-2*FtSus/Fs*sinc(2*n*FtSus/Fs);
XSus=abs(fftshift(fft(hSus)));
axaSus=linspace(-Fs/2,Fs/2,length(hSus));

convolutie3=conv(summ,hSus);
newt3=0:1/Fs:(length(convolutie3)-1)/Fs;

XS1=fftshift(abs(fft(convolutie3)));
axaS1=linspace(-Fs/2,Fs/2,length(convolutie3));

figure()
hold on;

    subplot(3,2,1);
    plot(t1,summ),title("Suma");
    axis([0,durata/100,-A-2,A+2]);

    subplot(3,2,2);
    plot(axa1,X1),title("Spectrul sumei");
    axis([-Fs/2-1,Fs/2+1,0,Fs/2*A+Fs/10]);
    xlabel("F[Hz]");

    subplot(3,2,3);
    plot(n,hSus),title("Coeficientii h");

    subplot(3,2,4);
    plot(axaSus,XSus),title("Caracteristica reala de amplitudine al lui h");
    axis([-Fs/2-1,Fs/2+1,0,1.25]);
    xlabel("F[Hz]");

    subplot(3,2,5);
    plot(newt3,convolutie3);title("Semnalul filtrat");
    axis([0.5,0.51,-A-0.25,A+0.25]);

    subplot(3,2,6);
    plot(axaS1,XS1),title("Spectrul semnalului filtrat");
    axis([-Fs/2-1,Fs/2+1,0,Fs/2*A+Fs/10]);
    xlabel("F[Hz]");

hold off

% Pentru filtrare opreste banda
Ft12=450;Ft22=900;
hOpreste=sinc(n)-2*Ft22/Fs*sinc(2*n*Ft22/Fs)+2*Ft12/Fs*sinc(2*n*Ft12/Fs);
XOpreste=abs(fftshift(fft(hOpreste)));
axaOpreste=linspace(-Fs/2,Fs/2,length(hOpreste));

convolutie4=conv(summ,hOpreste);
newt4=0:1/Fs:(length(convolutie4)-1)/Fs;

XOpreste1=fftshift(abs(fft(convolutie4)));
axaOpreste1=linspace(-Fs/2,Fs/2,length(convolutie4));

figure()
hold on;

    subplot(3,2,1);
    plot(t1,summ),title("Suma");
    axis([0,durata/100,-A-2,A+2]);

    subplot(3,2,2);
    plot(axa1,X1),title("Spectrul sumei");
    axis([-Fs/2-1,Fs/2+1,0,Fs/2*A+Fs/10]);
    xlabel("F[Hz]");

    subplot(3,2,3);
    plot(n,hOpreste),title("Coeficientii h");

    subplot(3,2,4);
    plot(axaOpreste,XOpreste),title("Caracteristica lui h");
    axis([-Fs/2-1,Fs/2+1,0,1.25]);
    xlabel("F[Hz]");

    subplot(3,2,5);
    plot(newt4,convolutie4);title("Semnalul filtrat");
    axis([0.5,0.51,-A-1,A+1]);

    subplot(3,2,6);
    plot(axaOpreste1,XOpreste1),title("Spectrul semnalului filtrat");
    axis([-Fs/2-1,Fs/2+1,0,Fs/2*A+Fs/10]);
    xlabel("F[Hz]");

hold off