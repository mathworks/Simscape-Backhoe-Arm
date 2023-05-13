% Copyright 2012-2023 The MathWorks, Inc.

% Reuse figure if it exists, else create new figure
if ~exist('h1_Backhoe_TiltCyl_Valve_Variants', 'var') || ...
        ~isgraphics(h1_Backhoe_TiltCyl_Valve_Variants, 'figure')
    h1_Backhoe_TiltCyl_Valve_Variants = figure('Name', 'Backhoe_TiltCyl_Valve_Variants');
end
figure(h1_Backhoe_TiltCyl_Valve_Variants)
clf(h1_Backhoe_TiltCyl_Valve_Variants)

temp_colorOrder = get(gca,'DefaultAxesColorOrder');
Color_Set = temp_colorOrder([2 1 3 5],:);
LineStyle_Set = {'-','-.',':','--','-','-.',':','--'};

set(gcf,'Position',[151   201   560   420]);

hf_h = plot(ValveSimRes(1).time,ValveSimRes(1).RefAngle,'Color','k','LineStyle','-.','LineWidth',1);
hold on
for i=1:length(ValveSimRes)
    Position_DATA = ValveSimRes(i).Angle;
    time = ValveSimRes(i).time;
    hf_h = plot(time,Position_DATA,'Color',Color_Set(i,:),'LineStyle','-','LineWidth',2);
    grid on
end

set(gca,'Box','on');
title('Bucket Angle vs. Time');
xlabel('Time (s)');
ylabel('Angle (deg)');
grid on
axis([0 60 -120 20]);
hold off
leg_h = legend({'Reference', legend_set{:}},'Location','Best');

