function [min_val_f0,x1m_f0,x2m_f0] = Min_MA(f0,start1,start2,step1,step2,endd1,endd2,P11_num,P12_num,P21_num,P22_num)

DR=f0(start2*(step1^-1):endd2*(step1^-1),start1*(step1^-1):endd1*(step1^-1));
maxx=max(max(DR));
shart=0;


while shart==0

[min_vals,min_rows]=min(DR);
[min_f,min_q1]=min(min_vals);
min_q2=min_rows(min_q1);
q1=min_q1/(step1^-1)+start1-step1
q2=min_q2/(step1^-1)+start2-step2

if ((1)/(q1*(q2*P12_num+(1-q2)*P11_num))) < 5

    shart=1;
min_val_f0=min_f;
x1m_f0=q1;
x2m_f0=q2;
56
else
    DR(min_q2,min_q1)=maxx+1;
   
end
clear min_vals min_rows
% q1
% q2
end
