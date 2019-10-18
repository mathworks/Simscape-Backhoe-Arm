colordef black;

time = HS_Param_Est_Input_DATA.time;
Input_Data = HS_Param_Est_Input_DATA.signals.values;
Cyl_Pos_Sim_Data = HS_Param_Est_DATA.signals.values(:,1);
Cyl_Pos_Meas_Data = HS_Param_Est_DATA.signals.values(:,2);
Cyl_Pos_Meas_time = HS_Param_Est_DATA.time;

figure(1);
clf;

new_sb211_h = 336;
set(gcf,'Position',[765   189   449   new_sb211_h]);

%POSITION_211 = [0.15 0.583837 0.775 0.341163*522/new_sb211_h];
subplot(211)
set(gca,'Position',[0.1300    0.48   0.7750    0.4]);

pos2_h = plot(Cyl_Pos_Meas_time,Cyl_Pos_Meas_Data,'m');
set(pos2_h,'LineWidth',3);

hold on
pos_h = plot(time,Cyl_Pos_Sim_Data,'y-.');
set(pos_h,'LineWidth',3);   

title_h = title('Cylinder Position (m)');
%xlabel_h = xlabel('Time (s)');
ylabel_h = ylabel('Position (m)');
%set(spd_h,'color',[0 0.3 1]);
%set(pos_h,'color','r');
set(title_h,'FontSize',14);
%set(xlabel_h,'FontSize',12);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
%legend('No Friction','Friction','Location','Best');
%legend('Rod','Piston','Location',[0.2128    0.4421    0.2691    0.1622]);
axis([time(1) time(end) -1.4 .4]);

subplot(212)
set(gca,'Position',[0.1300    0.1100   0.7750    0.2]);
pos_h = stairs(time,Input_Data);
%rct2_h = plot(time,Required_Crank_Torque2_data,'m');
title_h = title('Input Signal (PB | close | PA)');
%xlabel_h = xlabel('Time (s)');
ylabel_h = ylabel('PA | close | PB');
set(pos_h,'color',[0 0.3 1]);
%%%set(pos_h,'color','r');
set(pos_h,'LineWidth',3);
set(title_h,'FontSize',14);
%set(xlabel_h,'FontSize',12);
set(ylabel_h,'FontSize',12);
grid on
set(gca,'Box','on');
%legend('No Friction','Friction','Location','Best');
%legend('Rod','Piston','Location',[0.2128    0.4421    0.2691    0.1622]);
axis([time(1) time(end) -1.2 1.2]);

