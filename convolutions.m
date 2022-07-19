clc
clear all
close all

A=10; F=2; Fs=200; durata=2;
[t,s]=sinusoida(A,F,Fs,durata,0);

figure(1);
plot(t,s);
grid, axis([0,durata,-A-1,A+1]);
title("Sinudoida dinaintea convolutiei");

zgomot=rand(1,Fs*durata+1)*2-1;
figure(2);
plot(t,zgomot);
title("Niste zgomot");
axis([0,durata,-1.25,1.25]);

summ=s+zgomot;
figure(3);
hold on

    plot(t,s,"b");
    plot(t,summ,"r");
    plot(t,zgomot,"m");
    axis([0,durata,-A-2,A+2]);
    grid, title("Papalasca");
    
hold off

h=ones(1,10)/10;
convolutie=conv(summ,h);
newt=0:1/Fs:(length(convolutie)-1)/Fs;
% newt=0:durata/(length(convolutie)-1):durata;
% newt=linspace(0,durata,length(convolutie));
figure(4);

hold on

    subplot(2,1,1);
    plot(t,summ,"r");
    axis([0,durata,-A-2,A+2]);
    grid, title("Sinusoida zgomotoasa");
    
    subplot(2,1,2);
    plot(newt,convolutie,"b");
    axis([0,durata,-A-2,A+2]);
    grid, title("Semnalul filtrat");

hold off

X1=abs(fftshift(fft(s)));
axa1=linspace(-Fs/2,Fs/2,length(s));

X2=abs(fftshift(fft(summ)));
axa2=linspace(-Fs/2,Fs/2,length(summ));

X3=abs(fftshift(fft(convolutie)));
axa3=linspace(-Fs/2,Fs/2,length(convolutie));
 
figure(5);
hold on

    subplot(3,1,1);
    plot(axa1,X1);
    axis([-Fs/2-1,Fs/2+1,0,Fs*A+100]);
    title("Spectrul sinusoidei");
    xlabel("F[Hz]");

    subplot(3,1,2);
    plot(axa2,X2);
    axis([-Fs/2-1,Fs/2+1,0,Fs*A+100]);
    title("Spectrul sumei");
    xlabel("F[Hz]");

    subplot(3,1,3);
    plot(axa3,X3);
    axis([-Fs/2-1,Fs/2+1,0,Fs*A+100]);
    title("Spectrul dupa filtrare");
    xlabel("F[Hz]");

hold off