function [T_d1_num] = T_d1 (Noise,gamma,g1,upsilon_1)

%%%%%%%%%%%%
T_d1_num=exp(-(gamma*Noise)/(upsilon_1*g1));
% %%%%%%%%%%%%


end