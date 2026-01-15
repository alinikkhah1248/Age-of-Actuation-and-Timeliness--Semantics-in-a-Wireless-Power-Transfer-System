clc
clear

ups=9;

x=0:0.01:10;
y=(1/2*ups) * exp(-x / 2*ups );

plot(x,y)