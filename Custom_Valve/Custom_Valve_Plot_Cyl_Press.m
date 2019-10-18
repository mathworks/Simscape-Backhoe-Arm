% Copyright 2012-2014 The MathWorks, Inc.

colordef black;
Color_Set = ['r','c','y','g','m','b','w'];
LineStyle_Set = {'-','-.',':','--','-','-.',':','--'};

figure(4);
clf;
set(gcf,'Position',[321    99   560   420]);

for i=1:length(ValveSimRes)
    Pressure_DATA = ValveSimRes(i).Pressure_A;
    time = ValveSimRes(i).time;

    %subplot(211);
    hf_h = plot(time,Pressure_DATA,Color_Set(i),'LineStyle',LineStyle_Set{i},'LineWidth',3);
    title_h2 = title('Cylinder Pressure vs. Time','FontSize',14);
    xlabel_h2 = xlabel('Time (s)','FontSize',12);
    ylabel_h2 = ylabel('Pressure (Pa)','FontSize',12);
    set(hf_h);
    grid on
    set(gca,'Box','on');
%    axis([0 5 0 100]);
    hold on
end
hold off
leg_h = legend(legend_set,'Location','Best');

colordef white
