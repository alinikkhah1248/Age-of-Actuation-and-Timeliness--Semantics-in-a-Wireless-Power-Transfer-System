function[T_e12_num_2,T_e12_sim]=T_e12(rho,gamma_e,g1,g2,upsilon_1,upsilon_2,N)


syms x y
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Numerical
PDF_1=piecewise(x>=0, (1/(g1*upsilon_1)) * exp(-(  (x) / (g1*upsilon_1 )) )  , x<0, 0);
PDF_2=piecewise(y>=0, (1/(g2*upsilon_2)) * exp(-(  (y) / (g2* upsilon_2)) )  , y<0, 0);

T_e12_num=double (   1-   int(    int( subs(PDF_1,x)*subs(PDF_2,y)    ,x,-1000, (gamma_e/rho^2) - y )  ,y,-1000, 1000   )    );

exp_=exp( - (gamma_e) / ((rho^2)*g1*upsilon_1)  );
exp_2=exp( - (gamma_e) / ((rho^2)*g2*upsilon_2)  );

T_e12_num_2= 1- (g2*upsilon_2*(exp_2-1)+g1*upsilon_1*(1-exp_))  / (g1*upsilon_1 - g2*upsilon_2) ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Simulation 

s=0;
for k=1:N

    A1=(raylrnd(sqrt(upsilon_1/2)))^2;
    A2=(raylrnd(sqrt(upsilon_2/2)))^2;
    
    if  (rho^2)*(g1*A1+g2*A2) >  gamma_e  
        s=s+1;
    end
    
end
T_e12_sim=s/N;

end