clear
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% m=20;
N =1000000; % the number of simulated time slots   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Noise_dbm=-10;
Noise=(10^(Noise_dbm/10))*10^(-3);

gamma_dbm=-3;
gamma=(10^(gamma_dbm/10))*10^(-3);

gamma_e_dbm=-10;
gamma_e=(10^(gamma_e_dbm/10))*10^(-3);

P_t=50*10^(-3);
radios=40;
alpha=4;
g1=P_t*(radios^(-alpha));

P_t_2=100*10^(-3);
radios_2=10;
alpha_2=4;
g2=P_t_2*(radios_2^(-alpha_2));

upsilon_1=8; %2*sigma_1^2  old
upsilon_2=8; %2*sigma_2^2  old

% Beta_1_db=12;
% Beta_1=10^(Beta_1_db/10);
% 
% Beta_2_db=12;
% Beta_2=10^(Beta_2_db/10);



% rho=0.70694261312243596057309115167916;
syms rho

[T_d1_num]=T_d1 (Noise,gamma,g1,upsilon_1);
[T_d12_num]=T_d12(rho,Noise,gamma,g1,g2,upsilon_1,upsilon_2);
[T_e2_num]=T_e2(gamma_e,g2,upsilon_2);
[T_e12_num]=T_e12(rho,gamma_e,g1,g2,upsilon_1,upsilon_2);

P11_num=T_d1_num;
P12_num=T_d12_num;
P22_num=T_e2_num;
P21_num=T_e12_num;

%%%%%%%%%%%%%%%%%%%%%

% for rt1=0.01:0.01:0.99
%    for rt2=0.01:0.01:0.99

   
q1=0.8;
q2=0.7;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SIMULATION

% % % % % B=0;
% % % % % 
% % % % % A=1;
% % % % % I=1;
% % % % % Cost=0;
% % % % % 
% % % % % 
% % % % % 
% % % % % for i=1:N
% % % % %     
% % % % %     s_B(i)=B;
% % % % %     s(i)=A;
% % % % %     s_I(i)=I;
% % % % %     
% % % % % 
% % % % % rq1=rand;
% % % % % rq2=rand;
% % % % % 
% % % % % if rq1 <= q1 && rq2 <= q2
% % % % %     
% % % % %     s_d=T_d12_try(rho,Noise,gamma,g1,g2,upsilon_1,upsilon_2);
% % % % %     s_e=T_e12_try(rho,gamma_e,g1,g2,upsilon_1,upsilon_2);
% % % % % 
% % % % %     if s_d ==1 && s_e ==1
% % % % %         
% % % % %         I=1;
% % % % %         
% % % % %         if B==0
% % % % %             A=1;
% % % % %             B=B;
% % % % % %         elseif B==m
% % % % % %             A=1;
% % % % % %             B=B;
% % % % %         else
% % % % %             A=1;
% % % % %             B=B;
% % % % %         end
% % % % %     end
% % % % %     
% % % % %     if s_d ==1 && s_e ==0
% % % % %         
% % % % %         I=1;
% % % % %         
% % % % %         if B==0
% % % % %             A=A+1;
% % % % %             B=B;
% % % % % 
% % % % %             Cost=Cost+1;
% % % % % 
% % % % % %         elseif B==m
% % % % % %             A=1;
% % % % % %             B=B-1;
% % % % %         else
% % % % %             A=1;
% % % % %             B=B-1;
% % % % %         end
% % % % %     end
% % % % %     
% % % % %     if s_d ==0 && s_e ==1
% % % % %         
% % % % %         I=I+1;
% % % % %         
% % % % %         if B==0
% % % % %             A=A+1;
% % % % %             B=B+1;
% % % % % %         elseif B==m
% % % % % %             A=A+1;
% % % % % %             B=B;
% % % % %         else
% % % % %             A=A+1;
% % % % %             B=B+1;
% % % % %         end
% % % % %     end
% % % % %     
% % % % %     if s_d ==0 && s_e ==0
% % % % %         
% % % % %         I=I+1;
% % % % %         
% % % % %         if B==0
% % % % %             A=A+1;
% % % % %             B=B;
% % % % % %         elseif B==m
% % % % % %             A=A+1;
% % % % % %             B=B;
% % % % %         else
% % % % %             A=A+1;
% % % % %             B=B;
% % % % %         end
% % % % %     end
% % % % %     
% % % % % end
% % % % % %%%%%%%%%%%%%%
% % % % %                          
% % % % %     
% % % % % if rq1 <= q1 && rq2 > q2
% % % % %     
% % % % %     s_d=T_d1_try(Noise,gamma,g1,upsilon_1);
% % % % %     
% % % % %     if s_d==1
% % % % %         
% % % % %         I=1;
% % % % %         
% % % % %         if B==0
% % % % %             A=A+1;
% % % % %             B=B;
% % % % %             Cost=Cost+1;
% % % % % %         elseif B==m
% % % % % %             A=1;
% % % % % %             B=B-1;
% % % % %         else
% % % % %             A=1;
% % % % %             B=B-1;
% % % % %         end
% % % % %     end
% % % % %     
% % % % %     if s_d==0
% % % % %         
% % % % %         I=I+1;
% % % % %         
% % % % %         if B==0
% % % % %             A=A+1;
% % % % %             B=B;
% % % % % %         elseif B==m
% % % % % %             A=A+1;
% % % % % %             B=B;
% % % % %         else
% % % % %             A=A+1;
% % % % %             B=B;
% % % % %         end
% % % % %     end
% % % % %     
% % % % % end
% % % % % %%%%%%%%%%%%%%
% % % % %         
% % % % % 
% % % % % if rq1 > q1 && rq2 <= q2
% % % % %     
% % % % %     s_e=T_e2_try(gamma_e,g2,upsilon_2);
% % % % %     
% % % % %     if s_e==1 
% % % % %         
% % % % %         I=I+1;
% % % % %         
% % % % %         if B==0
% % % % %             A=A+1;
% % % % %             B=B+1;
% % % % % %         elseif B==m
% % % % % %             A=A+1;
% % % % % %             B=B;
% % % % %         else
% % % % %             A=A+1;
% % % % %             B=B+1;
% % % % %         end
% % % % % 
% % % % %    
% % % % % 
% % % % %     end
% % % % %     
% % % % %     if s_e==0
% % % % %         
% % % % %         I=I+1;
% % % % %         
% % % % %         if B==0
% % % % %             A=A+1;
% % % % %             B=B;
% % % % % %         elseif B==m
% % % % % %             A=A+1;
% % % % % %             B=B;
% % % % %         else
% % % % %             A=A+1;
% % % % %             B=B;
% % % % %         end
% % % % %     end
% % % % %     
% % % % % end
% % % % % %%%%%%%%%%%%%%
% % % % % 
% % % % % if rq1 > q1 && rq2 > q2
% % % % %     
% % % % %     I=I+1;
% % % % %     A=A+1;
% % % % %     B=B;
% % % % %     
% % % % % end
% % % % % 
% % % % % end

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

% % % % % AF_Sim(round(rt2*10),round(rt1*10))=sum(s)/N;
% % % % % AoI_Sim(round(rt2*10),round(rt1*10))=sum(s_I)/N;
% % % % % Cost_Sim(round(rt2*10),round(rt1*10))=Cost/N;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NUMERICAL


u1= q1*(q2*P12_num+(1-q2)*P11_num);
u2= q2*(q1*P21_num+(1-q1)*P22_num);

x1=q1*q2*P12_num*P21_num;
x2=q1*q2*P12_num*(1-P21_num)+q1*(1-q2)*P11_num;
x3=q1*q2*(1-P12_num)*P21_num+(1-q1)*q2*P22_num;
x4=(1-q1)*(1-q2)+q1*(1-q2)*(1-P11_num)+(1-q1)*q2*(1-P22_num)+q1*q2*(1-P12_num)*(1-P21_num);

Bat_St_Con=(u2^2)/(u2-x3);

xt=x3/x2;
empty_B=(1-xt);
non_empty_B=xt;


A0=(u1*non_empty_B)+(x1*empty_B);
I0=u1;

% AoA_Num(round(rt2*100),round(rt1*100))=double(1/A0)
% AoI_Num(round(rt2*100),round(rt1*100))=double(1/I0);
% Cost_Num(round(rt2*100),round(rt1*100))=empty_B*x2;
%     end
% end

AA=1/A0;
p00=A0*(1-A0)
equ = rho == (0.25*p00) + (0.75*(1-p00));
solve(equ,rho)

% [Q1,Q2]=meshgrid(0.01:0.01:0.99,0.01:0.01:0.99);
% % plot(0.01:0.01:0.99,AF_Num)
% surf(Q1,Q2,Cost_Num)
% xlabel('$\displaystyle{q_1}$','interpreter','latex')
% ylabel('$\displaystyle{q_2}$','interpreter','latex')
% zlabel('$\displaystyle{\bar{I}}$','interpreter','latex')                      