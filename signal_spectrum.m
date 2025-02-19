% This script loads a signal and applies a low-pass filter to it.
% The plot showcases the original and filtered signal spectrum.

clc
clear all
close all

load("semnal.mat")
axa1=linspace(-Fs/2,Fs/2,length(semnal));
FFT1=fftshift(abs(fft(semnal)));

figure();
plot(axa1,FFT1),title("Frecventele semnalului");
xlabel("F[Hz]");

N=101;
Ft=2800;
H=zeros(1,N);
H(round(-Ft*N/Fs+(N+1)/2):round(Ft*N/Fs+(N+1)/2))=1;

% q=1;
% for i = -(N-1)*Fs/(2*N):Fs/N:(N-1)*Fs/(2*N)
%     if(i > -Ft && i < Ft)
%         H(q)=1;
%     end
%     q=q+1;
% end

Fq = -(N-1)/2:(N-1)/2;
Fq = Fq*Fs/N;
figure();
stem(Fq,H);
title("Caracteristica ideala de amplitudine");

% qq=1;
% for n=-(N-1)/2:(N-1)/2
%     cry=1;
%     for k = -(N-1)/2:(N-1)/2
%         h(qq)= h(qq)+1/N*H(cry)*cos(2*k*pi*n/N);
%         cry=cry+1;
%     end
%     qq=qq+1;
% end

k=-(N-1)/2:(N-1)/2;
h=zeros(1,N);
for n = -(N-1)/2:(N-1)/2
    h(n+(N+1)/2) = 1/N*dot(H,cos(2*pi*(-(N-1)/2:(N-1)/2)*n/N));
end

figure();
stem(k,h);
title("Coeficientii filtrului:");

convvv = conv(h,semnal);
axa2=linspace(-Fs/2,Fs/2,length(convvv));
FFT2=fftshift(abs(fft(convvv)));

figure();
plot(axa2,FFT2);
title("Semnalul filtrat:");

sound(convvv,Fs);