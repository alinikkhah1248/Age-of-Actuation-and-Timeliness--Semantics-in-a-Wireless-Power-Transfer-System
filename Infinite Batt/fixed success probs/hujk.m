clear
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N =1000000; % the number of simulated time slots
delta1=10;   % the constraint of cost
delta2=5;
delta3=3;
delta4=2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %%%First Set
% P11_num=1;
% P12_num=0.62;
% P22_num=0.20;
% P21_num=0.23;

% %%%Second Set
P11_num=1;
P12_num=0.34;
P22_num=0.60;
P21_num=0.63;
% 
% 
% % %Arbitrary Set
% P11_num=1;
% P12_num=0.44;
% P22_num=0.90;
% P21_num=0.99;


q1=0.43;
q2=0.60;


a= ((1)/(q1*(q2*P12_num+(1-q2)*P11_num))) 