function[T_e2_num,T_e2_sim]=T_e2(gamma_e,g2,upsilon_2,N)


%%%%%%%%%%%
T_e2_num=exp(-gamma_e/(g2*upsilon_2));
%%%%%%%%%%%%
s=0;
for k=1:N

    A2=(raylrnd(sqrt(upsilon_2/2)))^2;
    
    if  g2*A2 >  gamma_e  
        s=s+1;
    end
    
end
T_e2_sim=s/N;

end