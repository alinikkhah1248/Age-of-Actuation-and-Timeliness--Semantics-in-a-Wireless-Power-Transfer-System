% to check if a matrix is positive semi-definite
function [flag]= Semi_positive (M)
% M=[5,4;
%    10,8];

pos=0;
neg=0;
eig_M = double(eig(M));
flag = 1;
for i = 1:rank(M)
  if eig_M(i) < 0 
  neg = 1;
  elseif eig_M(i) > 0
  pos = 1;
  end
end

if pos==1 && neg==0
flag=1;
elseif  pos==0 && neg==1
flag=-1;
elseif pos==1 && neg==1
    flag=0;
else 
    flag=10;
end
end