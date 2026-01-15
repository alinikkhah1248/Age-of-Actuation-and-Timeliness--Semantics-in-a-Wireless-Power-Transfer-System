clear
% clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

m=20;
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

%%%%%%%%%%%%%%%%%%%%%

 


for rt=0:0.01:0.1
    
    rho=rt
    
    [T_d1_num]=T_d1 (Noise,gamma,g1,sigma_1);
            [T_d12_num]=T_d12(rho,Noise,gamma,g1,g2,sigma_1,sigma_2);
            [T_e2_num]=T_e2(gamma_e,g2,sigma_2);
            [T_e12_num]=T_e12(rho,gamma_e,g1,g2,sigma_1,sigma_2);
            
            P11_num=T_d1_num ;
            P12_num=T_d12_num;
            P22_num=T_e2_num;
            P21_num=T_e12_num;
    
    
    mini=0;
    for q1=0.01:0.01:1
        q1
        for q2=0.01:0.01:1
            
%           q2  
            
            
            
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
            
            
            AF_Num(round(100*q1),round(100*q2))=double(1/A0);
            
            
            
        end
        
    end
    
[Satri,q1s]=   min(AF_Num);
[megh(round(100*rho)+1),q2_star_cell]=min(Satri);
q2_star(round(100*rho)+1)=q2_star_cell/100;
 q1_star_cell=q1s(round(q2_star_cell));   
 q1_star(round(100*rho)+1)=q1_star_cell/100;   
    
end


