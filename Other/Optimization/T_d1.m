function [T_d1_num] = T_d1 (Noise,gamma,g1,sigma)

upsilon=sigma^2;
%%%%%%%%%%%%
T_d1_num=exp(-(gamma*Noise)/(2*upsilon*g1));
% %%%%%%%%%%%%


end