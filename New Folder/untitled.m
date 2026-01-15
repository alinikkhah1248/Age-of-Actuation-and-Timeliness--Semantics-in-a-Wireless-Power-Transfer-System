X2=rand(1,100);
Y2=rand(1,100);
p2=rand(1,100);
W_esc_half=rand(1,100);
scatter(X2,Y2)
hold on;
plot(W_esc_half,p2,'r','LineWidth',2)
set(gca, 'xScale', 'log')
set(gca, 'YScale', 'linear')

% creating the zoom-in inset
ax=axes;
set(ax,'units','normalized','position',[0.2,0.2,0.2,0.2])
box(ax,'on')
plot(W_esc_half,p2,'r','LineWidth',2,'parent',ax)
set(ax,'xlim',[0.2,0.3],'ylim',[0.2,0.4])