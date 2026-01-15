% clc
% clear





% plot1=plot(0.05:0.05:0.95,AF_Num,'m+-');    % "1 5 b", "3 5 r", "5 5 g", "7 5 c", "9 5 m"
% plot1.Annotation.LegendInformation.IconDisplayStyle = 'off';
% hold on
% plot2=plot(0.05:0.05:0.95,AF_Sim,'md--');
% plot2.Annotation.LegendInformation.IconDisplayStyle = 'off';
% plot3=plot(0.05:0.05:0.95,AoI_Num,'m*-');
% plot3.Annotation.LegendInformation.IconDisplayStyle = 'off';
% plot4=plot(0.05:0.05:0.95,AoI_Sim,'ms--');
% plot4.Annotation.LegendInformation.IconDisplayStyle = 'off';

% legend([plot1,plot2,plot3,plot4],'$\displaystyle{\bar{A},q_1=0.1,q_2=0.5}$ - Num',...
%     '$\displaystyle{\bar{A},q_1=0.1,q_2=0.9}$ - Sim','$\displaystyle{\bar{I},q_1=0.9,q_2=0.9}$ - Num'...
%     ,'$\displaystyle{\bar{I},q_1=0.9,q_2=0.9}$ - Sim','interpreter','latex');


% plot1=plot(0.05:0.05:0.95,AF_Num,'m+-');
% hold on
% plot2=plot(0.05:0.05:0.95,AF_Sim,'bd--');
% 
% plot3=plot(0.05:0.05:0.95,AoI_Num,'m*-');
% 
% plot4=plot(0.05:0.05:0.95,AoI_Sim,'bs--');


% legend([plot1,plot2,plot3,plot4],'$\displaystyle{\bar{A},\rho=0.9}$ - Num',...
%     '$\displaystyle{\bar{A},\rho=0.9}$ - Sim','$\displaystyle{\bar{I},\rho=0.9}$ - Num'...
%     ,'$\displaystyle{\bar{I},\rho=0.9}$ - Sim','interpreter','latex');


% plot1=plot(0.05:0.05:0.95,AF_Opt,'g+-');
% hold on
% plot2=plot(0.05:0.05:0.95,AoI_Opt,'g*-'); 
% 
% 
% legend([plot1,plot2],'$\displaystyle{\bar{rho}^{*}$ - Num'...
%     ,'$\displaystyle{\bar{rho}^{*}$ - Num','interpreter','latex');



% xlim([0 0.5]);
% ylim([0 0.35]);

 
% ylabel('$\displaystyle{\bar{A},\bar{I}}$','interpreter','latex')
% xlabel('$\displaystyle{\rho^{*}}$','interpreter','latex')
% % hold on

set(findall(gcf,'-property','FontSize'),'FontSize',10);
set(findall(gcf,'-property','FontWeight'),'FontWeight','Normal');
set(findall(gcf,'-property','FontName'),'FontName','Times');
export_fig(gcf,'-dpng','-r600','-painters','rho_fixed_0.9_q1q2_vary_A.png');                        