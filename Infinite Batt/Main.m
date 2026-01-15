clear
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% m=20;
 N =1000; % the number of simulated time slots   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Noise_dbm=-10;           % Bruno
Noise=(10^(Noise_dbm/10))*10^(-3);

gamma_dbm=-1;
gamma=(10^(gamma_dbm/10))*10^(-3);

gamma_e_dbm=-3;
gamma_e=(10^(gamma_e_dbm/10))*10^(-3);

P_t=10*10^(-3);
radios=3;
alpha=4;
g1=P_t*(radios^(-alpha));

P_t_2=100*10^(-3);
radios_2=3;
alpha_2=4;
g2=P_t_2*(radios_2^(-alpha_2));

upsilon_1=8; %2*sigma_1^2  old
upsilon_2=8; %2*sigma_2^2  old

rho=0.99;



[T_d1_num]=T_d1 (Noise,gamma,g1,upsilon_1);
[T_d12_num]=T_d12(rho,Noise,gamma,g1,g2,upsilon_1,upsilon_2);
[T_e2_num]=T_e2(gamma_e,g2,upsilon_2);
[T_e12_num]=T_e12(rho,gamma_e,g1,g2,upsilon_1,upsilon_2);

P11_num=T_d1_num
P12_num=T_d12_num
P22_num=T_e2_num
P21_num=T_e12_num

%%%%%%%%%%%%%%%%%%%%%

start1=0.01;
step1=0.01;
endd1=0.99;
start2=0.01;
step2=0.01;
endd2=0.99;
for q1=start1:step1:endd1
q1
for q2=start2:step2:endd2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SIMULATION

B=0;

A=1;
I=1;
Cost=0;

I_sum=0;
A_sum=0;
Cost_sum=0;


for i=1:N
    
    s_B(i)=B;
    s(i)=A;
    s_I(i)=I;
    

rq1=rand;
rq2=rand;

if rq1 <= q1 && rq2 <= q2
    
    s_d=T_d12_try(rho,Noise,gamma,g1,g2,upsilon_1,upsilon_2);
    s_e=T_e12_try(rho,gamma_e,g1,g2,upsilon_1,upsilon_2);

    if s_d ==1 && s_e ==1
        
        I=1;
        
        if B==0
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

            Cost=Cost+1;

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
        else
            A=A+1;
            B=B;
        end
    end
    
end
%%%%%%%%%%%%%%
                         
    
if rq1 <= q1 && rq2 > q2
    
    s_d=T_d1_try(Noise,gamma,g1,upsilon_1);
    
    if s_d==1
        
        I=1;
        
        if B==0
            A=A+1;
            B=B;
            Cost=Cost+1;
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

        else
            A=A+1;
            B=B;
        end
    end
    
end
%%%%%%%%%%%%%%
        

if rq1 > q1 && rq2 <= q2
    
    s_e=T_e2_try(gamma_e,g2,upsilon_2);
    
    if s_e==1 
        
        I=I+1;
        
        if B==0
            A=A+1;
            B=B+1;

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



I_sum=I_sum+A;
A_sum=A_sum+A;
Cost_sum=Cost_sum+Cost;

end

AF_Sim(round(q2*100),round(q1*100))=A_sum/N;
AoI_Sim(round(q2*100),round(q1*100))=I_sum/N;
Cost_Sim(round(q2*100),round(q1*100))=Cost_sum/N;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NUMERICAL


u1= q1*(q2*P12_num+(1-q2)*P11_num);
u2= q2*(q1*P21_num+(1-q1)*P22_num);

x1=q1*q2*P12_num*P21_num;
x2=q1*q2*P12_num*(1-P21_num)+q1*(1-q2)*P11_num;
x3=q1*q2*(1-P12_num)*P21_num+(1-q1)*q2*P22_num;
x4=(1-q1)*(1-q2)+q1*(1-q2)*(1-P11_num)+(1-q1)*q2*(1-P22_num)+q1*q2*(1-P12_num)*(1-P21_num);

Bat_St_Con=(u2^2)/(u2-x3);

% xt=x3/x2;
% empty_B=(1-xt);
% non_empty_B=xt;
%%%%%%%%%%%%%%%%
xt=x3/x2;
if xt < 1
    empty_B=1-xt;
    non_empty_B=xt;
else
    empty_B=0;
    non_empty_B=1;
end
%%%%%%%%%%%%%%%%%%

A0=(u1*non_empty_B)+(x1*empty_B);
I0=u1;

AoA_Num(round(q2*100),round(q1*100))=double(1/A0);
AoI_Num(round(q2*100),round(q1*100))=double(1/I0);
Cost_Num(round(q2*100),round(q1*100))=q1*q2*(1-P12_num) + q1*(1-q2)*(1-P11_num)...
    + q1*q2*P12_num*(1-P21_num)*empty_B   + q1*(1-q2)*P11_num*empty_B ;
    end
end


f0=AoA_Num;
%f00=AoA_Num;

[Q1,Q2]=meshgrid(start1:step1:endd1,start2:step2:endd2);
Figg=surf(Q1,Q2,f0(start2*(step1^-1):endd2*(step1^-1),start1*(step1^-1):endd1*(step1^-1)),'HandleVisibility','off');
legend('');
%set(Figg,'LineStyle','none');
xlabel('$\displaystyle{q_1}$','interpreter','latex')
ylabel('$\displaystyle{q_2}$','interpreter','latex')
zlabel('$\displaystyle{\bar{A}}$','interpreter','latex')    

hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  DATA TIPS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Data tip for the main function
[min_vals,min_rows]=min(f0(start2*(step1^-1):endd2*(step1^-1),start1*(step1^-1):endd1*(step1^-1)));
[min_val_f0,min_q1]=min(min_vals);
min_q2=min_rows(min_q1);
x1m_f0=min_q1/(step1^-1)+start1-step1
x2m_f0=min_q2/(step1^-1)+start2-step2
min_val_f0
dt=datatip(Figg,x1m_f0,x2m_f0,min_val_f0);
set(datacursormode,'updatefcn',@mydatatip,'interpreter','latex');
Figg.DataTipTemplate.DataTipRows(1).Label="$\displaystyle{q_1}$";
Figg.DataTipTemplate.DataTipRows(2).Label = "$\displaystyle{q_2}$";
Figg.DataTipTemplate.DataTipRows(3).Label = "$\bar{C}$";
alldatacursors = findall(gcf,'type','hggroup');
set(alldatacursors,'FontSize',8);
set(alldatacursors,'FontName','Times');
set(alldatacursors, 'FontWeight', 'bold');
Figg.DataTipTemplate.DataTipRows(1).Format = '%.2g'; % x
Figg.DataTipTemplate.DataTipRows(2).Format = '%.2g'; % y
Figg.DataTipTemplate.DataTipRows(3).Format = '%.2g'; % y


%%%%%%%%%%%%%%%%%%%% for AoA data tip on the surf of CoMA
% [min_vals,min_rows]=min(f00(start2*(step1^-1):endd2*(step1^-1),start1*(step1^-1):endd1*(step1^-1)));
% [min_val_f00,min_q1]=min(min_vals);
% min_q2=min_rows(min_q1);
% x1m_f00=min_q1/(step1^-1)+start1-step1
% x2m_f00=min_q2/(step1^-1)+start2-step2
% dt=datatip(Figg,x1m_f00,x2m_f00,f0(x2m_f00*(step1^-1),x1m_f00*(step1^-1)));
% set(datacursormode,'updatefcn',@mydatatip,'interpreter','latex');
% Figg.DataTipTemplate.DataTipRows(1).Label="$\displaystyle{q_1}$";
% Figg.DataTipTemplate.DataTipRows(2).Label = "$\displaystyle{q_2}$";
% Figg.DataTipTemplate.DataTipRows(3).Label = "$\bar{C}$";
% alldatacursors = findall(gcf,'type','hggroup');
% set(alldatacursors,'FontSize',8);
% set(alldatacursors,'FontName','Times');
% set(alldatacursors, 'FontWeight', 'bold');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% deltas for CoMA
delta1_ind=1;
for q1=start1:step1:endd1
    for q2=start2:step2:endd2
        if AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))) < delta1
            if q1==start1 || q1==endd1 || q2==start2 || q2==endd2
                if delta1_ind==1
                    plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.g','markersize',10);
                    delta1_ind=0;
                else
                    plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.g','markersize',10,'HandleVisibility','off');
                end
            elseif AoI_Num(round(q2*(step2^-1))+1,round(q1*(step1^-1))) > delta1 || AoI_Num(round(q2*(step2^-1))-1,round(q1*(step1^-1))) > delta1 ...
                    || AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))+1) > delta1 || AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))-1) > delta1
                if delta1_ind==1
                    plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.g','markersize',10);
                    delta1_ind=0;
                else
                    plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.g','markersize',10,'HandleVisibility','off');
                end
            end
        end
    end
end
%%%%%%%%%%%%%%
delta2_ind=1;
for q1=start1:step1:endd1
    for q2=start2:step2:endd2
        if AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))) < delta2
            if q1==start1 || q1==endd1 || q2==start2 || q2==endd2
                if delta2_ind==1
                    plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.r','markersize',10);
                    delta2_ind=0;
                else
                    plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.r','markersize',10,'HandleVisibility','off');
                end
            elseif AoI_Num(round(q2*(step2^-1))+1,round(q1*(step1^-1))) > delta2 || AoI_Num(round(q2*(step2^-1))-1,round(q1*(step1^-1))) > delta2 ...
                    || AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))+1) > delta2 || AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))-1) > delta2
                if delta2_ind==1
                    plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.r','markersize',10);
                    delta2_ind=0;
                else
                    plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.r','markersize',10,'HandleVisibility','off');
                end
            end
        end
    end
end
%%%%%%%%%%%%%
delta3_ind=1;
for q1=start1:step1:endd1
    for q2=start2:step2:endd2
        if AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))) < delta3
            if q1==start1 || q1==endd1 || q2==start2 || q2==endd2
                if delta3_ind==1
                    plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.c','markersize',10);
                    delta3_ind=0;
                else
                    plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.c','markersize',10,'HandleVisibility','off');
                end
            elseif AoI_Num(round(q2*(step2^-1))+1,round(q1*(step1^-1))) > delta3 || AoI_Num(round(q2*(step2^-1))-1,round(q1*(step1^-1))) > delta3 ...
                    || AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))+1) > delta3 || AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))-1) > delta3
                if delta3_ind==1
                    plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.c','markersize',10);
                    delta3_ind=0;
                else
                    plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.c','markersize',10,'HandleVisibility','off');
                end
            end
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
delta4_ind=1;
for q1=start1:step1:endd1
    for q2=start2:step2:endd2
        if AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))) < delta4
            if q1==start1 || q1==endd1 || q2==start2 || q2==endd2
                if delta4_ind==1
                    plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.b','markersize',10);
                    delta4_ind=0;
                else
                    plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.b','markersize',10,'HandleVisibility','off');
                end
            elseif AoI_Num(round(q2*(step2^-1))+1,round(q1*(step1^-1))) > delta4 || AoI_Num(round(q2*(step2^-1))-1,round(q1*(step1^-1))) > delta4 ...
                    || AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))+1) > delta4 || AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))-1) > delta4
                if delta4_ind==1
                    plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.b','markersize',10);
                    delta4_ind=0;
                else
                    plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.b','markersize',10,'HandleVisibility','off');
                end
            end
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Energy Limited Area

for q1=start1:step1:endd1
    for q2=start2:step2:endd2
        if Bat_St_Con(round(q2*(step2^-1)),round(q1*(step1^-1))) < 1
            if q1==start1 || q1==endd1 || q2==start2 || q2==endd2 
                plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.y','markersize',10,'HandleVisibility','off');
            elseif Bat_St_Con(round(q2*(step2^-1))+1,round(q1*(step1^-1))) > 1 || Bat_St_Con(round(q2*(step2^-1))-1,round(q1*(step1^-1))) > 1 ...
                 || Bat_St_Con(round(q2*(step2^-1)),round(q1*(step1^-1))+1) > 1 || Bat_St_Con(round(q2*(step2^-1)),round(q1*(step1^-1))-1) > 1
            plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.y','markersize',10,'HandleVisibility','off');
        end
        end
    end
end
% % % % % % 
% % % % % % 
% % % % % % 
legend('$\Delta=10$','$\Delta=5$','$\Delta=3$','$\Delta=2$','interpreter','Latex')                  