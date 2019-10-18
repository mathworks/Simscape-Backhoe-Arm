% Copyright 2012-2014 The MathWorks, Inc.

colordef black;
Color_Set = ['r','c','g','y','m','b','w'];

figure(5);
clf;
set(gcf,'Position',[401   186   560   420]);

hold on
hf1_h = plot(Spool_Hydr_Force_AT.time,Spool_Hydr_Force_PB.signals.values,Color_Set(1),'LineWidth',3);
hf2_h = plot(Spool_Hydr_Force_AT.time,Spool_Hydr_Force_BT.signals.values,Color_Set(2),'LineWidth',3);
hf3_h = plot(Spool_Hydr_Force_AT.time,Spool_Hydr_Force_AT.signals.values,Color_Set(3),'LineWidth',3,'LineStyle',':');
hf4_h = plot(Spool_Hydr_Force_AT.time,Spool_Hydr_Force_PA.signals.values,Color_Set(4),'LineWidth',3,'LineStyle',':');
title_h2 = title('Spool Force vs. Time');
xlabel_h2 = xlabel('Time (s)');
ylabel_h2 = ylabel('Force(N)');
set(title_h2,'FontSize',14);
set(xlabel_h2,'FontSize',12);
set(ylabel_h2,'FontSize',12);
grid on
set(gca,'Box','on');
%    axis([0 5 0 100]);

legend_set = {'PB' 'BT' 'AT' 'PA'};
leg_h = legend(legend_set,'Location','Best');

colordef white
