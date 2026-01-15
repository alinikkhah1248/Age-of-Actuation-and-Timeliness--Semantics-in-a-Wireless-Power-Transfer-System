function [T_d1_num] = T_d2 (Noise,gamma_d2,g2,upsilon_2)

%%%%%%%%%%%%
T_d1_num=exp(-(gamma_d2*Noise)/(upsilon_2*g2));
% %%%%%%%%%%%%
% T_d1_num=exp(-(gamma*Noise)/(g1));


end