function[T_d12_num,T_d12_sim]=T_d12(rho,Noise,gamma,g1,g2,upsilon_1,upsilon_2,N)



%%%%%%%%%%%%
T_d12_num=exp(-(gamma*Noise)/((1-(rho^2))*upsilon_1*g1))  *  (1/(1+  gamma*((upsilon_2*g2)/(upsilon_1*g1))  )  );
%%%%%%%%%%%
s=0;
for k=1:N

    A1=(raylrnd(sqrt(upsilon_1/2)))^2;
    A2=(raylrnd(sqrt(upsilon_2/2)))^2;
    
    if  (g1*A1)/(g2*A2+(  Noise/(1-(rho^2)) ) ) >  gamma 
        s=s+1;
    end
    
end
T_d12_sim=s/N;



end