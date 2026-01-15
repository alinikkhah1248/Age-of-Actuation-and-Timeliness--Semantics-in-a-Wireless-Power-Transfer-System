clear
clc

Noise_dbm=10; %           % Bruno
Noise=(10^(Noise_dbm/10))*10^(-3)


gamma_d2_dB=-10; %
gamma_d2=10^(gamma_d2_dB/10);


P_t=10*10^(-3); %
radios_12=1.5; %
alpha=4; %
g1=P_t*(radios_12^(-alpha));

P_t_2=1000*10^(-3); %
radios_22=1; %
alpha_2=4; %
g2=P_t_2*(radios_22^(-alpha_2));

upsilon_1=1;     %    %2*sigma_1^2  old
upsilon_2=1;     %    %2*sigma_2^2  old


P_d2=T_d2(Noise,gamma_d2,g2,upsilon_2)
P_d21=T_d21(Noise,gamma_d2,g1,g2,upsilon_1,upsilon_2)

q1=1;
step=0.01;


for q2=0:step:1
P_D2(round(q2*(step^(-1))+1))= q1 * q2 * P_d21 +  (1-q1) * q2 * P_d2;
end



hold on
box on
grid on
set(gcf,'renderer','Painters');
plot(0:step:1,P_D2,'b','LineWidth',2)

xlabel('$\displaystyle{q_2}$','interpreter','latex','FontSize',17)
ylabel('Throughput','interpreter','latex','FontSize',17) 

legend('$P_{D2}$','interpreter','Latex','FontSize',17)
set(gca,'FontSize',15)
set(gca, 'ytick', 0:0.1:1);
set(gca, 'xtick', 0:0.1:1);
% 
% % zp = BaseZoom();
% % zp.plot;




