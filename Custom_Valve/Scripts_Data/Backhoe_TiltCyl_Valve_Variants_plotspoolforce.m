% Copyright 2012-2018 The MathWorks, Inc.

if ~exist('h4_Backhoe_TiltCyl_Valve_Variants', 'var') || ...
        ~isgraphics(h4_Backhoe_TiltCyl_Valve_Variants, 'figure')
    h4_Backhoe_TiltCyl_Valve_Variants = figure('Name', 'Backhoe_TiltCyl_Valve_Variants');
end
figure(h4_Backhoe_TiltCyl_Valve_Variants)
clf(h4_Backhoe_TiltCyl_Valve_Variants)
set(gcf,'Position',[401   186   560   420]);

temp_colorOrder = get(gca,'DefaultAxesColorOrder');
Color_Set = temp_colorOrder([2 1 3 5],:);


hold on
hf1_h = plot(Spool_Hydr_Force_AT.time,Spool_Hydr_Force_PB.signals.values,'Color',Color_Set(1,:),'LineWidth',2);
hf2_h = plot(Spool_Hydr_Force_AT.time,Spool_Hydr_Force_BT.signals.values,'Color',Color_Set(2,:),'LineWidth',2);
hf3_h = plot(Spool_Hydr_Force_AT.time,Spool_Hydr_Force_AT.signals.values,'Color',Color_Set(3,:),'LineWidth',2,'LineStyle',':');
hf4_h = plot(Spool_Hydr_Force_AT.time,Spool_Hydr_Force_PA.signals.values,'Color',Color_Set(4,:),'LineWidth',2,'LineStyle',':');
title('Spool Force vs. Time');
xlabel('Time (s)');
ylabel('Force(N)');
grid on
set(gca,'Box','on');

legend_set = {'PB' 'BT' 'AT' 'PA'};
leg_h = legend(legend_set,'Location','Best');
