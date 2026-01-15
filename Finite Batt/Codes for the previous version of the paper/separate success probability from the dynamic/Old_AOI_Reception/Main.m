clear
% clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
q1=0.8;
q2=0.4;
P11=0.8;
P12=0.4;
P22=0.7;
P21=0.65;
m=20;

contor1=0;

% for q1=0.01:0.01:0.99
%     contor1=contor1+1
    contor2=1;
% for q2=0.2:0.01:0.8
%     
%     contor2=contor2+1
  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SIMULATION
N=10000000; % the number of simulated time slots  
B=0;

A=1;


for i=1:N
    
    s_B(i)=B;
    s(i)=A;
    
    rq1=rand;
    rq2=rand;

        
        if rq1 <= q1
            
            if B==0
A=A+1;
            else
                if rq2 <= q2
                    if rand <=P12
                        B=B-1;
                        A=1;
                    else
                        A=A+1;
                    end
                else
                    if rand <=P11
                        B=B-1;
                        A=1;
                         else
                        A=A+1;
                    end
                end
                
            end
 
        else
A=A+1;
        end
        

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
        if rq2 <= q2
            
            if B < m

                if rq1 <= q1 
                    if rand <=P21
                        B=B+1;
                    end
                else
                    if rand <=P22
                        B=B+1;
                    end
                end
                
            end
           
        end

end






%%%%%%%%%%%%%%%%%%%%%%%%%%%
s_values=zeros(1,10000);
for i=1:N
    s_values(s(i))=s_values(s(i))+1;
end

for i=1:10000
    if s_values(i)~=0
        aa=i;
    end
end
s_values(aa+1:10000)=[];

P_steady=s_values/N;
P=zeros(aa,aa);

for i=1:N-1
    P(s(i),s(i+1))=P(s(i),s(i+1))+1;
end

for i=1:aa
    P(i,:)=P(i,:)/ s_values(i) ;
end
P;

%%%%%%%%%%%%%%%%%%%%%%%%%%%


s_values_B=zeros(1,m+1);
for i=1:N
    s_values_B(s_B(i)+1)=s_values_B(s_B(i)+1)+1;
end
P_steady_B=s_values_B/N;

P_b=zeros(m+1,m+1);

for i=1:N-1
    P_b(s_B(i)+1,s_B(i+1)+1)=P_b(s_B(i)+1,s_B(i+1)+1)+1;
end

for i=1:m+1
    P_b(i,:)=P_b(i,:)/ s_values_B(i) ;
end

% P_b

neb=1-P_steady_B(1);
%%%%%%%%%%%%%%%%%%%

AOI_Sim(contor2)=sum(s)/N;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NUMERICAL

u1= q1*(q2*P12+(1-q2)*P11);
u2= q2*(q1*P21+(1-q1)*P22);

x1=q1*q2*P12*P21;
x2=q1*q2*P12*(1-P21)+q1*(1-q2)*P11;
x3=q1*q2*(1-P12)*P21+(1-q1)*q2*P22;
x4=(1-q1)*(1-q2)+q1*(1-q2)*(1-P11)+(1-q1)*q2*(1-P22)+q1*q2*(1-P12)*(1-P21);

xt1=(x1+x3);
xt2=(x2-x3);
xt3=(1-((x3/x2)^(m)));
xt=xt1*xt3;


if xt2==0
 non_empty_B= ((xt1/x2)*m) /  (1+ ((xt1/x2)*m) );
else
non_empty_B= xt/(xt2+xt);
end

AOI_Num(contor2)=1/(u1*non_empty_B);




% end
% end


% [q1,q2]=meshgrid(0.01:0.01:0.99,0.01:0.01:0.99);
% surf(q1,q2,AOI_Num)


% plot(0.2:0.01:0.8,AOI_Sim,'b');
% hold on
% plot(0.2:0.01:0.8,AOI_Num,'r');

%legend(plot2,'$\displaystyle{e=0.9,\mu_3=0.9,m=7}$','interpreter','latex');

% xlim([0 0.5]);
% ylim([0 0.35]);


% 
% ylabel('$\displaystyle{D_t}$','interpreter','latex')
% xlabel('$\displaystyle{m}$','interpreter','latex')
% hold on



% set(findall(gcf,'-property','FontSize'),'FontSize',10);
% set(findall(gcf,'-property','FontWeight'),'FontWeight','Normal');
% set(findall(gcf,'-property','FontName'),'FontName','Times');
% export_fig(gcf,'-dpng','-r600','-painters','Variant_u1_zoomed.png');

