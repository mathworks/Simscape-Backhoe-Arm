% Copyright 2012-2018 The MathWorks, Inc.

% Reuse figure if it exists, else create new figure
if ~exist('h3_Backhoe_TiltCyl_Valve_Variants', 'var') || ...
        ~isgraphics(h3_Backhoe_TiltCyl_Valve_Variants, 'figure')
    h3_Backhoe_TiltCyl_Valve_Variants = figure('Name', 'Backhoe_TiltCyl_Valve_Variants');
end
figure(h3_Backhoe_TiltCyl_Valve_Variants)
clf(h3_Backhoe_TiltCyl_Valve_Variants)
set(gcf,'Position',[321    99   560   420]);

temp_colorOrder = get(gca,'DefaultAxesColorOrder');
Color_Set = temp_colorOrder([2 1 3 5],:);
LineStyle_Set = {'-','-.',':','--','-','-.',':','--'};


for i=1:length(ValveSimRes)
    Pressure_DATA = ValveSimRes(i).Pressure_A;
    time = ValveSimRes(i).time;
    
    %subplot(211);
    hf_h = plot(time,Pressure_DATA,'Color',Color_Set(i,:),'LineStyle','-','LineWidth',2);
    hold on
end
hold off
leg_h = legend(legend_set,'Location','Best');
title('Cylinder Pressure vs. Time');
xlabel('Time (s)');
ylabel('Pressure (Pa)');
grid on
set(gca,'Box','on');
