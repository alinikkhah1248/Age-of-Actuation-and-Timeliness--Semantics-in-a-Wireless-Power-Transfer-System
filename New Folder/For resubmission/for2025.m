clear
clc


gamma_e_dbm=20; %
gamma_e=(10^(gamma_e_dbm/10))*10^(-3);


upsilon_1=1;     %    %2*sigma_1^2  old
upsilon_2=1;     %    %2*sigma_2^2  old
step=0.01;
rho=0.99;   

for g1=0.01:step:1
    for g2=0.01:step:1
        P_e12(round(g1*(step^(-1))),round(g2*(step^(-1))))=T_e12(rho,gamma_e,g1,g2,upsilon_1,upsilon_2);
    end
end


[X,Y] = meshgrid(0.01:step:1,0.01:step:1);



hold on
box on
grid on
set(gcf,'renderer','Painters');
surf(X,Y,P_e12)

xlabel('$\displaystyle{\rho}$','interpreter','latex','FontSize',17)
ylabel('Success Probability','interpreter','latex','FontSize',17) 


set(gca,'FontSize',15)
set(gca, 'ytick', 0:0.1:1);
set(gca, 'xtick', 0:0.1:1);
