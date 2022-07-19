clc
clear all
load handel

linistee = zeros(1,2*Fs);
temp = y.';
temp1=temp(1 : round(length(temp)/2));
temp2=temp(round(length(temp)/2)+1 : length(temp));
final = [temp1, linistee, temp2];
y=final.';
sound(y,Fs);