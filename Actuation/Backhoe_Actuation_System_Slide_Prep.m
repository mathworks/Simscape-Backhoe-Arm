% Copyright 2012-2014 The MathWorks, Inc.

colordef black;

time = Actuation_System_DATA.time;
Cylinder_Position_Data = Actuation_System_DATA.signals.values;
%Input_Shaft_Data = SimDriveline_clutch_gear_DATA.signals(2).values(:,2);
%Output_Shaft_Data = SimDriveline_clutch_gear_DATA.signals(2).values(:,1);
%Voltage_Data = ASM.signals(1).values;
%Disp_Data = FEL_Actuator_DATA.signals(1).values(:,1);
%Current_Data = ASM.signals(2).values;
%Speed_Data = ASM.signals(3).values;

figure(1);
clf;
 


%new_sb211_h = 400;
set(gcf,'Position',[38    65   449   336]);

%set(gca,'Position',[0.15 0.63/522*new_sb211_h 0.775 0.341163*522/new_sb211_h])
%POSITION_211 = [0.15 0.583837 0.775 0.341163*522/new_sb211_h];
%subplot(211)
pos_h = plot(time,Cylinder_Position_Data,'color','r','LineWidth',3);
%hold on
%rct2_h = plot(time,Required_Crank_Torque2_data,'m');
title_h = title('Cylinder Extension (m)','FontSize',14);
xlabel_h = xlabel('Time (s)','FontSize',12);
ylabel_h = ylabel('Position (m)','FontSize',12);
%set(spd_h,'color',[0 0.3 1]);

grid on
set(gca,'Box','on');
%legend('No Friction','Friction','Location','Best');
%legend('Rod','Piston','Location',[0.2128    0.4421    0.2691    0.1622]);
axis([time(1) time(end) -0.05 0.55]);

