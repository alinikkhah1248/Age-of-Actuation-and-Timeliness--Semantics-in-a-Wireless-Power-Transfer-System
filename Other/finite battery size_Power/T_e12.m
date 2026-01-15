function[T_e12_num]=T_e12(rho,gamma_e,g1,g2,sigma_1,sigma_2)

upsilon=sigma_1^2;
upsilon_2=sigma_2^2;
 
syms x y
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Numerical
PDF_1=piecewise(x>=0, (1/(g1*2*upsilon)) * exp(-(  (x) / (g1*2*upsilon )) )  , x<0, 0);
PDF_2=piecewise(y>=0, (1/(g2*2*upsilon_2)) * exp(-(  (y) / (g2*2* upsilon_2)) )  , y<0, 0);

T_e12_num=  1-   int(    int( subs(PDF_1,x)*subs(PDF_2,y)    ,x,-1000, (gamma_e/rho^2) - y )  ,y,-1000, 1000   )    ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Simulation 


end