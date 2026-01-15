function [m,mf] = minimizer2 (ff)


a=0;                            % start of interval
b=1;                            % end of interval
epsilon=0.01;               % accuracy value
iter= 100;                       % maximum number of iterations
tau=double((sqrt(5)-1)/2);      % golden proportion coefficient, around 0.618
k=0;                            % number of iterations
x1=a+(1-tau)*(b-a);             % computing x values
x2=a+tau*(b-a);
f_x1=f(x1,ff);                    % computing values in x points
f_x2=f(x2,ff);

while ((abs(b-a)>epsilon) && (k<iter))
    k=k+1;
    if(double(f_x1)<double(f_x2))
        b=x2;
        x2=x1;
        x1=a+(1-tau)*(b-a);
        
        f_x1=f(x1,ff);
        f_x2=f(x2,ff);
        

    else
        a=x1;
        x1=x2;
        x2=a+tau*(b-a);
        
        f_x1=f(x1,ff);
        f_x2=f(x2,ff);
        

    end
    
    k=k+1;
end
% chooses minimum point
if(double(f_x1)<double(f_x2))
    m=x1;
    mf=f_x1;
else
    m=x2;
    mf=f_x2;
end

function y=f(x,ff)
% modify this - write your own function!
y=subs(ff,x);
end


end