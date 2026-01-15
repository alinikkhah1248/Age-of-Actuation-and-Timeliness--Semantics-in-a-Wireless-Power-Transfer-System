% Interactive Zoom plot
% [p_ax,ch_ax]= ZoomPlot()
% [p_ax,ch_ax]= ZoomPlot(p_ax)
%
% This function allow you draw zoomed/magnified axes on a existing axes.
% The funciton gets its axes handle from gca() when called with no input
% arguments. This function should work for all 2D linear axes plots like
% plot(), scatter(), quiver().
%
% INPUTS:
% p_ax - parent axes handle
%
%OUTPUTS:
% p_ax: handle of the parent axes
% ch_ax: handle of the child/Zoom axes
%
% Example 1: simple
x = linspace(0,3*pi,200);
y = [cos(x) + rand(1,200);cos(x+1) + rand(1,200)];
figure,plot(x,y),title('Noisy cosines'),xlabel('x'),ylabel(y)
ZoomPlot();
% %Follow the instructions on the title of the plot
%
% Example 2: create multiple zoomed axes and playing with handles
x = linspace(0,3*pi,200);
y = [cos(x) + rand(1,200);cos(x+1) + rand(1,200)];
figure,plot(x,y),title('Noisy cosines'),xlabel('x'),ylabel(y)
p_ax=gca;
[p_ax,ch_ax1]=ZoomPlot(p_ax);
%follow the instruction on the title of the plot
[p_ax,ch_ax2]=ZoomPlot(p_ax);
% set title and other properties with handle
legend(p_ax,{'Cos','Shifted cos'})
title(ch_ax1,'1st zoom plot')
set(ch_ax1,'LineWidth',1.5,'XColor',lines(1),'YColor',lines(1))
title(ch_ax2,'2nd zoom plot')