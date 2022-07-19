clc
clear all

% A=1; F1=4; F2=10; Fs=100; durata=1; fi=0;

% t=0:1/Fs:durata;
% 
% s=A*sin(2*pi*F1*t+fi); s2=A*sin(2*pi*F2*t+fi);
% s3=A*sin(2*pi*F1*t+fi)+A*sin(2*pi*F2*t+fi);
% 
% figure(); hold on
% 
%     subplot(3,1,1); plot(t,s); axis([0,durata,-A-1,A+1]),grid;
% 
%     subplot(3,1,2); plot(t,s2); axis([0,durata,-A-1,A+1]),grid;
%     
%     subplot(3,1,3); plot(t,s3); axis([0,durata,-A-2,A+2]),grid;
% 
% hold off

A=1;
F=9;
Fs1=8;
Fs2=90;
durata=1;
fi=0;

t2=0:1/Fs2:durata;
s2=A*sin(2*pi*F*t2+fi);

t1=0:1/Fs1:durata;
s1=A*sin(2*pi*F*t1+fi);

figure();
hold on;
    subplot(2,1,1)
    hold on;
    plot(t2,s2);
    stem(t2,s2);
    axis([0,durata,-A-1,A+1]),grid;
    hold off;
    
    subplot(2,1,2);
    hold on;
    plot(t2,s2,"b");
    plot(t1,s1);
    stem(t1,s1);
    axis([0,durata,-A-1,A+1]),grid;
    hold off;
hold off;

