clear
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=1;
% N =1000000; % the number of simulated time slots
% delta1=10;
% delta2=5;
% delta3=3;
% delta4=2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %First Set
% P11_num=1;
% P12_num=0.88;
% P22_num=0.36;
% P21_num=0.68;
% 
% %Second Set
% P11_num=1;
% P12_num=0.44;
% P22_num=0.90;
% P21_num=0.99;

load S_P_2
for counter=1:1000


counter

P11_num=S_P_2(counter,1);
P12_num=S_P_2(counter,2);
P22_num=S_P_2(counter,3);
P21_num=S_P_2(counter,4);


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
% % % % % B=0;
% % % % % A=1;
% % % % % I=1;
% % % % % Cost=0;
% % % % % for i=1:N
% % % % %     s_B(i)=B;
% % % % %     s(i)=A;
% % % % %     s_I(i)=I;
% % % % % rq1=rand;
% % % % % rq2=rand;
% % % % % if rq1 <= q1 && rq2 <= q2
% % % % %     
% % % % %      s_d=rand;
% % % % %      s_e=rand;
% % % % % 
% % % % %     if s_d <= P12_num && s_e <= P21_num
% % % % %         
% % % % %         I=1;
% % % % %         
% % % % %         if B==0
% % % % %             A=1;
% % % % %             B=B;
% % % % %         elseif B==m
% % % % %             A=1;
% % % % %             B=B;
% % % % %         else
% % % % %             A=1;
% % % % %             B=B;
% % % % %         end
% % % % %     end
% % % % %     
% % % % %     if s_d <= P12_num && s_e > P21_num
% % % % %         
% % % % %         I=1;
% % % % %         
% % % % %         if B==0
% % % % %             A=A+1;
% % % % %             B=B;
% % % % % 
% % % % %             Cost=Cost+1;
% % % % % 
% % % % %         elseif B==m
% % % % %             A=1;
% % % % %             B=B-1;
% % % % %         else
% % % % %             A=1;
% % % % %             B=B-1;
% % % % %         end
% % % % %     end
% % % % %     
% % % % %     if s_d > P12_num && s_e <= P21_num
% % % % %         
% % % % %         I=I+1;
% % % % %         Cost=Cost+1;
% % % % %         if B==0
% % % % %             A=A+1;
% % % % %             B=B+1;
% % % % %         elseif B==m
% % % % %             A=A+1;
% % % % %             B=B;
% % % % %         else
% % % % %             A=A+1;
% % % % %             B=B+1;
% % % % %         end
% % % % %     end
% % % % %     
% % % % %    if s_d > P12_num && s_e > P21_num
% % % % %         
% % % % %         I=I+1;
% % % % %         Cost=Cost+1;
% % % % %         if B==0
% % % % %             A=A+1;
% % % % %             B=B;
% % % % %         elseif B==m
% % % % %             A=A+1;
% % % % %             B=B;
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
% % % % %     s_d=rand;
% % % % %     
% % % % %     if s_d <= P11_num 
% % % % %         
% % % % %         I=1;
% % % % %         
% % % % %         if B==0
% % % % %             A=A+1;
% % % % %             B=B;
% % % % %             Cost=Cost+1;
% % % % %         elseif B==m
% % % % %             A=1;
% % % % %             B=B-1;
% % % % %         else
% % % % %             A=1;
% % % % %             B=B-1;
% % % % %         end
% % % % %     end
% % % % %     
% % % % %    if s_d > P11_num 
% % % % %         
% % % % %         I=I+1;
% % % % %         Cost=Cost+1;
% % % % %         if B==0
% % % % %             A=A+1;
% % % % %             B=B;
% % % % %         elseif B==m
% % % % %             A=A+1;
% % % % %             B=B;
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
% % % % %     s_e=rand;
% % % % %     
% % % % %     if s_e <= P22_num 
% % % % %         
% % % % %         I=I+1;
% % % % %         
% % % % %         if B==0
% % % % %             A=A+1;
% % % % %             B=B+1;
% % % % %         elseif B==m
% % % % %             A=A+1;
% % % % %             B=B;
% % % % %         else
% % % % %             A=A+1;
% % % % %             B=B+1;
% % % % %         end
% % % % % 
% % % % %    
% % % % % 
% % % % %     end
% % % % %    
% % % % %     if s_e > P22_num 
% % % % %         
% % % % %         I=I+1;
% % % % %         
% % % % %         if B==0
% % % % %             A=A+1;
% % % % %             B=B;
% % % % %         elseif B==m
% % % % %             A=A+1;
% % % % %             B=B;
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
% % % % % AoA_Sim(round(q2*(step2^-1)),round(q1*(step1^-1)))=sum(s)/N;
% % % % % AoI_Sim(round(q2*(step2^-1)),round(q1*(step1^-1)))=sum(s_I)/N;
% % % % % Cost_Sim(round(q2*(step2^-1)),round(q1*(step1^-1)))=Cost/N;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NUMERICAL

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
% f00=AoA_Num;

% set(gcf,'renderer','Painters');
% [Q1,Q2]=meshgrid(start1:step1:endd1,start2:step2:endd2);
% Figg=mesh(Q1,Q2,f0(start2*(step1^-1):endd2*(step1^-1),start1*(step1^-1):endd1*(step1^-1)),'HandleVisibility','off');
% % legend('');
% %set(Figg,'LineStyle','none');
% xlabel('$\displaystyle{q_1}$','interpreter','latex','FontSize',17)
% ylabel('$\displaystyle{q_2}$','interpreter','latex','FontSize',17)
% zlabel('$\displaystyle{\bar{C}}$','interpreter','latex','FontSize',17)    
% 
% set(gca,'FontSize',15)
% set(gca, 'xtick', 0:0.2:1);
% set(gca, 'ytick', 0:0.2:1);

% hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  DATA TIPS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Data tip for the main function
[min_vals,min_rows]=min(f0(start2*(step1^-1):endd2*(step1^-1),start1*(step1^-1):endd1*(step1^-1)));
[min_val_f0,min_q1]=min(min_vals);
min_q2=min_rows(min_q1);
x1m_f0=min_q1/(step1^-1)+start1-step1;
x2m_f0=min_q2/(step1^-1)+start2-step2;


Ave_P(counter)=x1m_f0*0.001*counter+x2m_f0*0.1*counter;

AoA_S_P(counter)=min_val_f0;
end


plot(5:1000,AoA_S_P(5:1000))
hold on
plot(5:1000,Ave_P(5:1000))


% min_val_f0
% dt=datatip(Figg,x1m_f0,x2m_f0,min_val_f0);
% set(datacursormode,'updatefcn',@mydatatip,'interpreter','latex');
% Figg.DataTipTemplate.DataTipRows(1).Label="$\displaystyle{q_1}$";
% Figg.DataTipTemplate.DataTipRows(2).Label = "$\displaystyle{q_2}$";
% Figg.DataTipTemplate.DataTipRows(3).Label = "$\bar{C}$";



% alldatacursors = findall(gcf,'type','hggroup');
% set(alldatacursors,'FontSize',8);
% set(alldatacursors,'FontName','Times');
% set(alldatacursors, 'FontWeight', 'bold');
% Figg.DataTipTemplate.DataTipRows(1).Format = '%.2g'; % x
% Figg.DataTipTemplate.DataTipRows(2).Format = '%.2g'; % y
% Figg.DataTipTemplate.DataTipRows(3).Format = '%.2g'; % y

% 
% % % %%%%%%%%%%%%%%%%%%%% for AoA data tip on the surf of CoMA
% [min_vals,min_rows]=min(f00(start2*(step1^-1):endd2*(step1^-1),start1*(step1^-1):endd1*(step1^-1)));
% [min_val_f00,min_q1]=min(min_vals);
% min_q2=min_rows(min_q1);
% x1m_f00=min_q1/(step1^-1)+start1-step1
% x2m_f00=min_q2/(step1^-1)+start2-step2
% dt=datatip(Figg,x1m_f00,x2m_f00,f0(x2m_f00*(step1^-1),x1m_f00*(step1^-1)));
% set(datacursormode,'updatefcn',@mydatatip,'interpreter','latex');
% Figg.DataTipTemplate.DataTipRows(1).Format = '%.2g'; % x
% Figg.DataTipTemplate.DataTipRows(2).Format = '%.2g'; % y
% Figg.DataTipTemplate.DataTipRows(3).Format = '%.2g'; % y
% alldatacursors = findall(gcf,'type','hggroup');
% set(alldatacursors,'FontSize',8);
% set(alldatacursors,'FontName','Times');
% set(alldatacursors, 'FontWeight', 'bold');
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% deltas for CoMA
% delta1_ind=1;
% for q1=start1:step1:endd1
%     for q2=start2:step2:endd2
%         if AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))) < delta1
%             if q1==start1 || q1==endd1 || q2==start2 || q2==endd2
%                 if delta1_ind==1
%                     plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.y','markersize',10);
%                     delta1_ind=0;
%                 else
%                     plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.y','markersize',10,'HandleVisibility','off');
%                 end
%             elseif AoI_Num(round(q2*(step2^-1))+1,round(q1*(step1^-1))) > delta1 || AoI_Num(round(q2*(step2^-1))-1,round(q1*(step1^-1))) > delta1 ...
%                     || AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))+1) > delta1 || AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))-1) > delta1
%                 if delta1_ind==1
%                     plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.y','markersize',10);
%                     delta1_ind=0;
%                 else
%                     plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.y','markersize',10,'HandleVisibility','off');
%                 end
%             end
%         end
%     end
% end
% % % %%%%%%%%%%%%%%
% delta2_ind=1;
% for q1=start1:step1:endd1
%     for q2=start2:step2:endd2
%         if AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))) < delta2
%             if q1==start1 || q1==endd1 || q2==start2 || q2==endd2
%                 if delta2_ind==1
%                     plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.g','markersize',10);
%                     delta2_ind=0;
%                 else
%                     plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.g','markersize',10,'HandleVisibility','off');
%                 end
%             elseif AoI_Num(round(q2*(step2^-1))+1,round(q1*(step1^-1))) > delta2 || AoI_Num(round(q2*(step2^-1))-1,round(q1*(step1^-1))) > delta2 ...
%                     || AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))+1) > delta2 || AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))-1) > delta2
%                 if delta2_ind==1
%                     plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.g','markersize',10);
%                     delta2_ind=0;
%                 else
%                     plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.g','markersize',10,'HandleVisibility','off');
%                 end
%             end
%         end
%     end
% end
% %%%%%%%%%%%%%
% delta3_ind=1;
% for q1=start1:step1:endd1
%     for q2=start2:step2:endd2
%         if AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))) < delta3
%             if q1==start1 || q1==endd1 || q2==start2 || q2==endd2
%                 if delta3_ind==1
%                     plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.r','markersize',10);
%                     delta3_ind=0;
%                 else
%                     plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.r','markersize',10,'HandleVisibility','off');
%                 end
%             elseif AoI_Num(round(q2*(step2^-1))+1,round(q1*(step1^-1))) > delta3 || AoI_Num(round(q2*(step2^-1))-1,round(q1*(step1^-1))) > delta3 ...
%                     || AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))+1) > delta3 || AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))-1) > delta3
%                 if delta3_ind==1
%                     plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.r','markersize',10);
%                     delta3_ind=0;
%                 else
%                     plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.r','markersize',10,'HandleVisibility','off');
%                 end
%             end
%         end
%     end
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% delta4_ind=1;
% for q1=start1:step1:endd1
%     for q2=start2:step2:endd2
%         if AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))) < delta4
%             if q1==start1 || q1==endd1 || q2==start2 || q2==endd2
%                 if delta4_ind==1
%                     plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.b','markersize',10);
%                     delta4_ind=0;
%                 else
%                     plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.b','markersize',10,'HandleVisibility','off');
%                 end
%             elseif AoI_Num(round(q2*(step2^-1))+1,round(q1*(step1^-1))) > delta4 || AoI_Num(round(q2*(step2^-1))-1,round(q1*(step1^-1))) > delta4 ...
%                     || AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))+1) > delta4 || AoI_Num(round(q2*(step2^-1)),round(q1*(step1^-1))-1) > delta4
%                 if delta4_ind==1
%                     plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.b','markersize',10);
%                     delta4_ind=0;
%                 else
%                     plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.b','markersize',10,'HandleVisibility','off');
%                 end
%             end
%         end
%     end
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%% Energy Limited Area
% 
% for q1=start1:step1:endd1
%     for q2=start2:step2:endd2
%         if Bat_St_Con(round(q2*(step2^-1)),round(q1*(step1^-1))) < 1
%             if q1==start1 || q1==endd1 || q2==start2 || q2==endd2 
%                 plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.k','markersize',10,'HandleVisibility','off');
%             elseif Bat_St_Con(round(q2*(step2^-1))+1,round(q1*(step1^-1))) > 1 || Bat_St_Con(round(q2*(step2^-1))-1,round(q1*(step1^-1))) > 1 ...
%                  || Bat_St_Con(round(q2*(step2^-1)),round(q1*(step1^-1))+1) > 1 || Bat_St_Con(round(q2*(step2^-1)),round(q1*(step1^-1))-1) > 1
%             plot3(q1,q2,f0(round(q2*(step2^-1)),round(q1*(step1^-1))),'.k','markersize',10,'HandleVisibility','off');
%         end
%         end
%     end
% end
% % % % % 
% % % % % 
% % % % % 
% legend('$\Delta=10$','$\Delta=5$','$\Delta=3$','$\Delta=2$','interpreter','Latex')