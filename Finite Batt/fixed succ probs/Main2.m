clear
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=1;

load S_P
for counter=1:100


counter

P11_num=S_P(counter,1);
P12_num=S_P(counter,2);
P22_num=S_P(counter,3);
P21_num=S_P(counter,4);


%%%%%%%%%%%%%%%%%%%%%
start1=0.01;
step1=0.01;
endd1=0.99;
start2=0.01;
step2=0.01;
endd2=0.99;
for q1=start1:step1:endd1
q1;
for q2=start2:step2:endd2


u1= q1*(q2*P12_num+(1-q2)*P11_num);
u2= q2*(q1*P21_num+(1-q1)*P22_num);

x1=q1*q2*P12_num*P21_num;
x2=q1*q2*P12_num*(1-P21_num)+q1*(1-q2)*P11_num;
x3=q1*q2*(1-P12_num)*P21_num+(1-q1)*q2*P22_num;
x4=(1-q1)*(1-q2)+q1*(1-q2)*(1-P11_num)+(1-q1)*q2*(1-P22_num)+q1*q2*(1-P12_num)*(1-P21_num);

xt=x3/x2;
empty_B=(1-xt)/(1-(xt^(m+1)));
non_empty_B=1-empty_B;
Bat_St_Con(round(q2*step2^-1),round(q1*step1^-1))=xt;

A0=(u1*non_empty_B)+(x1*empty_B);
I0=u1;

AoA_Num(round(q2*(step2^-1)),round(q1*(step1^-1)))=double(1/A0);
AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1)))=double(1/I0);
CoA_Num(round(q2*(step2^-1)),round(q1*(step1^-1)))=q1*q2*(1-P12_num) + q1*(1-q2)*(1-P11_num)...
    + q1*q2*P12_num*(1-P21_num)*empty_B   + q1*(1-q2)*P11_num*empty_B ;

end
end

f0=AoA_Num;

[min_vals,min_rows]=min(f0(start2*(step1^-1):endd2*(step1^-1),start1*(step1^-1):endd1*(step1^-1)));
[min_val_f0,min_q1]=min(min_vals);
min_q2=min_rows(min_q1);
x1m_f0=min_q1/(step1^-1)+start1-step1;
x2m_f0=min_q2/(step1^-1)+start2-step2;


Ave_P(counter)=x1m_f0*0.001*counter+x2m_f0*0.1*counter;

AoA_S_P(counter)=min_val_f0;
end


Fig_AoA=plot(5:100,AoA_S_P(5:100),"b")
figure
Fig_P=plot(5:100,Ave_P(5:100),"b")


