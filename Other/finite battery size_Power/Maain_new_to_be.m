clear
% clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
m=20;
N =1; % the number of simulated time slots   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Noise_dbm=-100;
Noise=(10^(Noise_dbm/10))*10^(-3);

gamma_dbm=-3;
gamma=(10^(gamma_dbm/10))*10^(-3);

gamma_e_dbm=-30;
gamma_e=(10^(gamma_e_dbm/10))*10^(-3);

P_t=5*10^(-3);
radios=20;
alpha=4;
g1=P_t*(radios^(-alpha));

P_t_2=5*10^(-3);
radios_2=10;
alpha_2=4;
g2=P_t_2*(radios_2^(-alpha_2));

sigma_1=2;
sigma_2=2;


q1=0.03;
q2=0.04;


% rho=0.9;
%%%%%%%%%%%%%%%%%%%%%

for rt=0.5:1:0.95

   
rho=rt    


% 
% P11=T_d1_sim ;
% P12=T_d12_sim;
% P22=T_e2_sim;
% P21=T_e12_sim;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SIMULATION

B=0;

A=1;
I=1;
% NN=1000;
% 
% for ti=1:NN
% ti

for i=1:N
    
    s_B(i)=B;
    s(i)=A;
    s_I(i)=I;
    

rq1=rand;
rq2=rand;

if rq1 <= q1 && rq2 <= q2
    
    s_d=T_d12_try(rho,Noise,gamma,g1,g2,sigma_1,sigma_2);
    s_e=T_e12_try(rho,gamma_e,g1,g2,sigma_1,sigma_2);

    if s_d ==1 && s_e ==1
        
        I=1;
        
        if B==0
            A=1;
            B=B;
        elseif B==m
            A=1;
            B=B;
        else
            A=1;
            B=B;
        end
    end
    
    if s_d ==1 && s_e ==0
        
        I=1;
        
        if B==0
            A=A+1;
            B=B;
        elseif B==m
            A=1;
            B=B-1;
        else
            A=1;
            B=B-1;
        end
    end
    
    if s_d ==0 && s_e ==1
        
        I=I+1;
        
        if B==0
            A=A+1;
            B=B+1;
        elseif B==m
            A=A+1;
            B=B;
        else
            A=A+1;
            B=B+1;
        end
    end
    
    if s_d ==0 && s_e ==0
        
        I=I+1;
        
        if B==0
            A=A+1;
            B=B;
        elseif B==m
            A=A+1;
            B=B;
        else
            A=A+1;
            B=B;
        end
    end
    
end
%%%%%%%%%%%%%%
                         
    
if rq1 <= q1 && rq2 > q2
    
    s_d=T_d1_try(Noise,gamma,g1,sigma_1);
    
    if s_d==1
        
        I=1;
        
        if B==0
            A=A+1;
            B=B;
        elseif B==m
            A=1;
            B=B-1;
        else
            A=1;
            B=B-1;
        end
    end
    
    if s_d==0
        
        I=I+1;
        
        if B==0
            A=A+1;
            B=B;
        elseif B==m
            A=A+1;
            B=B;
        else
            A=A+1;
            B=B;
        end
    end
    
end
%%%%%%%%%%%%%%
        

if rq1 > q1 && rq2 <= q2
    
    s_e=T_e2_try(gamma_e,g2,sigma_2);
    
    if s_e==1 
        
        I=I+1;
        
        if B==0
            A=A+1;
            B=B+1;
        elseif B==m
            A=A+1;
            B=B;
        else
            A=A+1;
            B=B+1;
        end
    end
    
    if s_e==0
        
        I=I+1;
        
        if B==0
            A=A+1;
            B=B;
        elseif B==m
            A=A+1;
            B=B;
        else
            A=A+1;
            B=B;
        end
    end
    
end
%%%%%%%%%%%%%%

if rq1 > q1 && rq2 > q2
    
    I=I+1;
    
    A=A+1;
    B=B;
    
end

end

% 
% AoI_in(ti)=sum(s)/N;
% I_in(ti)=sum(s_I)/N;
% 
% clear s s_B s_I
% 
% end



%%%%%%%%%%%%%%%%%%%%%%%%%%%
% s_values=zeros(1,1000000);
% for i=1:N
%     s_values(s(i))=s_values(s(i))+1;
% end
% 
% for i=1:1000000
%     if s_values(i)~=0
%         aa=i;
%     end
% end
% s_values(aa+1:1000000)=[];
% 
% P_steady=s_values/N;
% P=zeros(aa,aa);
% 
% for i=1:N-1
%     P(s(i),s(i+1))=P(s(i),s(i+1))+1;
% end
% 
% for i=1:aa
%     P(i,:)=P(i,:)/ s_values(i) ;
% end
% P;

%%%%%%%%%%%%%%%%%%%%%%%%%%%


% s_values_B=zeros(1,m+1);
% for i=1:N
%     s_values_B(s_B(i)+1)=s_values_B(s_B(i)+1)+1;
% end
% P_steady_B=s_values_B/N;
% 
% P_b=zeros(m+1,m+1);
% 
% for i=1:N-1
%     P_b(s_B(i)+1,s_B(i+1)+1)=P_b(s_B(i)+1,s_B(i+1)+1)+1;
% end
% 
% for i=1:m+1
%     P_b(i,:)=P_b(i,:)/ s_values_B(i) ;
% end
% 
% % P_b
% 
% neb=1-P_steady_B(1);
%%%%%%%%%%%%%%%%%%%

AF_Sim(round(20*rt))=sum(s)/N;
AoI_Sim(round(20*rt))=sum(s_I)/N;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NUMERICAL

[T_d1_num]=T_d1 (Noise,gamma,g1,sigma_1);
[T_d12_num]=T_d12(rho,Noise,gamma,g1,g2,sigma_1,sigma_2);
[T_e2_num]=T_e2(gamma_e,g2,sigma_2);
[T_e12_num]=T_e12(rho,gamma_e,g1,g2,sigma_1,sigma_2);

P11_num=T_d1_num ;
P12_num=T_d12_num;
P22_num=T_e2_num;
P21_num=T_e12_num;


u1= q1*(q2*P12_num+(1-q2)*P11_num);
u2= q2*(q1*P21_num+(1-q1)*P22_num);

x1=q1*q2*P12_num*P21_num;
x2=q1*q2*P12_num*(1-P21_num)+q1*(1-q2)*P11_num;
x3=q1*q2*(1-P12_num)*P21_num+(1-q1)*q2*P22_num;
x4=(1-q1)*(1-q2)+q1*(1-q2)*(1-P11_num)+(1-q1)*q2*(1-P22_num)+q1*q2*(1-P12_num)*(1-P21_num);


xt=x3/x2;
empty_B=(1-xt)/(1-(xt^(m+1)));
non_empty_B=1-empty_B;


A0=(u1*non_empty_B)+(x1*empty_B);
I0=u1;

AF_Num(round(rt*20))=double((1/A0)*((q1*P_t)+(q2*P_t_2)));
AoI_Num(round(rt*20))=double((1/I0)*((q1*P_t)+(q2*P_t_2)));


end


AF_Num

                         