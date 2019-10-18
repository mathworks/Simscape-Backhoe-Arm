% Copyright 2012-2019 The MathWorks, Inc.
time = HS_Param_Est_Input_DATA.time;
Input_Data = HS_Param_Est_Input_DATA.signals.values;
Cyl_Pos_Data = logsout_Hydraulic_System_Param_Est.get('Piston_Position');
Cyl_Pos_Sim_Data = Cyl_Pos_Data.Values.Data(:,1);
Cyl_Pos_Meas_Data = Cyl_Pos_Data.Values.Data(:,2);
Cyl_Pos_time = Cyl_Pos_Data.Values.time;

figure(1);
clf;
temp_colorOrder = get(gca,'DefaultAxesColorOrder');

new_sb211_h = 336;
set(gcf,'Position',[765   189   449   new_sb211_h]);
%POSITION_211 = [0.15 0.583837 0.775 0.341163*522/new_sb211_h];
subplot(211)
set(gca,'Position',[0.1300    0.48   0.7750    0.4]);

pos2_h = plot(Cyl_Pos_time,Cyl_Pos_Meas_Data,'LineWidth',3,'Color',temp_colorOrder(1,:));
hold on
pos_h = plot(Cyl_Pos_time,Cyl_Pos_Sim_Data,'LineWidth',3,'Color',temp_colorOrder(2,:));

title_h = title('Cylinder Position (m)');
ylabel_h = ylabel('Position (m)');
set(title_h,'FontSize',14);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([time(1) time(end) -1.4 .4]);
legend({'Measured','Simulated'},'Location','Best')

subplot(212)
set(gca,'Position',[0.1300    0.1100   0.7750    0.2]);
pos_h = stairs(time,Input_Data,'LineWidth',3);
title_h = title('Input Signal (PB | close | PA)');
set(gca,'YTickLabel',{'PA','close','PB'});
set(title_h,'FontSize',14);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
axis([time(1) time(end) -1.2 1.2]);

