clear
% clc

syms q1 q2 %P11 P12 P22 P21 m

P11=0.8;
P12=0.1;
P22=0.6;
P21=0.2;
m=3;



u1= q1*(q2*P21+(1-q2)*P22);
u2= q2*(q1*P21+(1-q1)*P22);

x1=q1*q2*P12*P21;
x2=q1*q2*P12*(1-P21)+q1*(1-q2)*P11;
x3=q1*q2*(1-P12)*P21+(1-q1)*q2*P22;
x4=(1-q1)*(1-q2)+q1*(1-q2)*(1-P11)+(1-q1)*q2*(1-P22)+q1*q2*(1-P12)*(1-P21);




xt=x3/x2;
empty_B=(1-xt)/(1-(xt^(m+1)));
non_empty_B=1-empty_B;


A0=(u1*non_empty_B)+(x1*empty_B);

AOI_Num=1/A0;



A_1=diff(AOI_Num,q1);
A_2=diff(AOI_Num,q2);

[a,b]=solve(A_1==0,A_2==0,q1,q2)

