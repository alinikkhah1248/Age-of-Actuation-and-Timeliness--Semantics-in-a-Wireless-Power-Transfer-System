clear
clc

Noise_dbm=10; %           % Bruno
Noise=(10^(Noise_dbm/10))*10^(-3)



% gamma_dbm=20; %
% gamma=(10^(gamma_dbm/10))*10^(-3)



gamma_dB=-10; %
gamma=10^(gamma_dB/10);


gamma_e_dbm=20; %
gamma_e=(10^(gamma_e_dbm/10))*10^(-3);




P_t=10*10^(-3); %
radios=1; %
alpha=4; %
g1=P_t*(radios^(-alpha));

P_t_2=1000*10^(-3); %
radios_2=1.5; %
alpha_2=4; %
g2=P_t_2*(radios_2^(-alpha_2));

upsilon_1=1;     %    %2*sigma_1^2  old
upsilon_2=1;     %    %2*sigma_2^2  old


% rho=0.99;   %
step=0.01;

for rho=0:step:1
P_d1(round(rho*(step^(-1))+1))=T_d1(Noise,gamma,g1,upsilon_1);
P_d12(round(rho*(step^(-1))+1))=T_d12(rho,Noise,gamma,g1,g2,upsilon_1,upsilon_2);
P_e2(round(rho*(step^(-1))+1))=T_e2(gamma_e,g2,upsilon_2);
P_e12(round(rho*(step^(-1))+1))=T_e12(rho,gamma_e,g1,g2,upsilon_1,upsilon_2);
% P_d12_e12(round(rho*(step^(-1))+1))=P_d12(round(rho*(step^(-1))+1))+P_e12(round(rho*(step^(-1))+1));
end

% [~,max_P_d12_e12]=max(P_d12_e12);


% S_P(counter,1:4)=[P_d1(max_P_d12_e12),P_d12(max_P_d12_e12),P_e2(max_P_d12_e12),P_e12(max_P_d12_e12)]


hold on
box on
grid on
set(gcf,'renderer','Painters');
plot(0:step:1,P_d1,'b','LineWidth',2)
plot(0:step:1,P_d12,'r','LineWidth',2)
plot(0:step:1,P_e2,'k','LineWidth',2)
plot(0:step:1,P_e12,'g','LineWidth',2)

xlabel('$\displaystyle{\rho}$','interpreter','latex','FontSize',17)
ylabel('Success Probability','interpreter','latex','FontSize',17) 

legend('$P_{d1}$','$P_{d12}$','$P_{e2}$','$P_{e12}$','interpreter','Latex','FontSize',17)
set(gca,'FontSize',15)
set(gca, 'ytick', 0:0.1:1);
set(gca, 'xtick', 0:0.1:1);
% 
% % zp = BaseZoom();
% % zp.plot;