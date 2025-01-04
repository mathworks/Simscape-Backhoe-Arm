% Copyright 2012-2024 The MathWorks, Inc.

% Reuse figure if it exists, else create new figure
if ~exist('h2_Backhoe_TiltCyl_Valve_Variants', 'var') || ...
        ~isgraphics(h2_Backhoe_TiltCyl_Valve_Variants, 'figure')
    h2_Backhoe_TiltCyl_Valve_Variants = figure('Name', 'Backhoe_TiltCyl_Valve_Variants');
end
figure(h2_Backhoe_TiltCyl_Valve_Variants)
clf(h2_Backhoe_TiltCyl_Valve_Variants)
set(gcf,'Position',[236   155   560   420]);

temp_colorOrder = get(gca,'DefaultAxesColorOrder');
Color_Set = temp_colorOrder([2 1 3 5],:);
LineStyle_Set = {'-','-.',':','--','-','-.',':','--'};

for i=1:length(ValveSimRes)
    Spool_Position_DATA = ValveSimRes(i).Spool_Pos;
    time = ValveSimRes(i).time;
    hf_h = plot(time,Spool_Position_DATA,'Color',Color_Set(i,:),'LineStyle','-','LineWidth',2);
    hold on
end
hold off
leg_h = legend(legend_set,'Location','Best');
title('Spool Position vs. Time');
xlabel('Time (s)');
ylabel('Position (mm)');
grid on
set(gca,'Box','on');


