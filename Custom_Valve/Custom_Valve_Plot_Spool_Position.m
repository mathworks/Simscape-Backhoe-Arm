% Copyright 2012-2014 The MathWorks, Inc.

colordef black;
Color_Set = ['r','c','y','g','m','b','w'];
LineStyle_Set = {'-','-.',':','--','-','-.',':','--'};

figure(3);
clf;
set(gcf,'Position',[236   155   560   420]);

for i=1:length(ValveSimRes)
    Spool_Position_DATA = ValveSimRes(i).Spool_Pos;
    time = ValveSimRes(i).time;
    hf_h = plot(time,Spool_Position_DATA,Color_Set(i),'LineStyle',LineStyle_Set{i},'LineWidth',3);
    title_h2 = title('Spool Position vs. Time','FontSize',14);
    xlabel_h2 = xlabel('Time (s)','FontSize',12);
    ylabel_h2 = ylabel('Position(m)','FontSize',12);
    grid on
    set(gca,'Box','on');
    hold on
end
hold off
leg_h = legend(legend_set,'Location','Best');

colordef white
