function[s] = Fourier(A,F,k,t)
% generare serie fourer
    if k == 1
        s = 4/pi*sin(2*pi*k*F*t);
        s= s+ Fourier(A,F,k-1,t);
    end