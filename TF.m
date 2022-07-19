clc
clear all
close all

A=1;
durata=2;
F=2;
Fs=400;
fi0=0;

t=0:1/Fs:durata-1/Fs;
squaree=A*square(2*pi*F*t+fi0);

s=0; n=500;
for k = 1 : n
    if mod(k,2) == 1
        s = s + 4/(k*pi)*sin(2*pi*k*F*t);
    end
end

axa1=linspace(-Fs/2,Fs/2,length(s));
X1=abs(fftshift(fft(s)));

figure(6);
hold on;

    plot(t,squaree);
    plot(t,s,"r");
    axis([0,durata,-A-1,A+1]),title("Square-u + armonicile");
    
hold off;
tf=['Suma primelor N = ', num2str(n), ' armonici'];
legend('Semnalul initial',tf);

figure(87);
plot(axa1,X1);
xlabel("F[Hz]");
