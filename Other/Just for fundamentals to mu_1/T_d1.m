function [T_d1_num,T_d1_sim] = T_d1 (Noise,gamma,g1,upsilon_1,N)

%%%%%%%%%%%%
T_d1_num=exp(-(gamma*Noise)/(upsilon_1*g1));
% %%%%%%%%%%%%
s=0;

for k=1:N

    A1=(raylrnd(sqrt(upsilon_1/2)))^2;
    
    if  (g1*A1)/(Noise) >  gamma 
        s=s+1;
    end
    
end
T_d1_sim=s/N;

end