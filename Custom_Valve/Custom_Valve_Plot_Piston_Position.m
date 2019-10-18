% Copyright 2012-2014 The MathWorks, Inc.

colordef black;
Color_Set = ['r','c','y','g','m','b','w'];
LineStyle_Set = {'-','-.',':','--','-','-.',':','--'};

figure(2);
clf;
set(gcf,'Position',[151   201   560   420]);
%set(gcf,'Position',[240   496   450   335]);


for i=1:length(ValveSimRes)
    Position_DATA = ValveSimRes(i).Angle;
    time = ValveSimRes(i).time;
    hf_h = plot(time,Position_DATA,Color_Set(i),'LineStyle',LineStyle_Set{i},'LineWidth',3);
    grid on
    hold on
end

set(gca,'Box','on');
title_h2 = title('Bucket Angle vs. Time','FontSize',14);
xlabel_h2 = xlabel('Time (s)','FontSize',12);
ylabel_h2 = ylabel('Angle (deg)','FontSize',12);
grid on
axis([0 60 -120 20]);
hold off
leg_h = legend(legend_set,'Location','Best');

colordef white
