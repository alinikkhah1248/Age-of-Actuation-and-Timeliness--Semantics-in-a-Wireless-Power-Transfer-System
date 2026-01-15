% clc
% clear




% plot1=plot(0.05:0.05:0.95,AF_Num,'m+-');
% hold on
% plot2=plot(0.05:0.05:0.95,AF_Sim,'md--');
% 
% plot3=plot(0.05:0.05:0.95,AoI_Num,'m*-');
% 
% plot4=plot(0.05:0.05:0.95,AoI_Sim,'ms--');
% 
% legend([plot1,plot2,plot3,plot4],'$\displaystyle{\bar{A},q_1=0.9,q_2=0.9}$ - Num',...
%     '$\displaystyle{\bar{A},q_1=0.9,q_2=0.9}$ - Sim','$\displaystyle{\bar{I},q_1=0.9,q_2=0.9}$ - Num'...
%     ,'$\displaystyle{\bar{I},q_1=0.9,q_2=0.9}$ - Sim','interpreter','latex');


% plot1=plot(0.05:0.05:0.95,AF_Num,'m+-');
% hold on
% plot2=plot(0.05:0.05:0.95,AF_Sim,'md--');
% 
% plot3=plot(0.05:0.05:0.95,AoI_Num,'m*-');
% 
% plot4=plot(0.05:0.05:0.95,AoI_Sim,'ms--');
% 
% 
% legend([plot1,plot2,plot3,plot4],'$\displaystyle{\bar{A},\rho=0.9}$ - Num',...
%     '$\displaystyle{\bar{A},\rho=0.9}$ - Sim','$\displaystyle{\bar{I},\rho=0.9}$ - Num'...
%     ,'$\displaystyle{\bar{I},\rho=0.9}$ - Sim','interpreter','latex');


% xlim([0 0.5]);
% ylim([0 0.35]);


% 
% ylabel('$\displaystyle{\bar{I},\bar{A}}$','interpreter','latex')
% xlabel('$\displaystyle{q_1=q_2}$','interpreter','latex')
% hold on



% set(findall(gcf,'-property','FontSize'),'FontSize',5);
% set(findall(gcf,'-property','FontWeight'),'FontWeight','Normal');
% set(findall(gcf,'-property','FontName'),'FontName','Times');
% export_fig(gcf,'-dpng','-r600','-painters','1 3 5 7 9.png');                        