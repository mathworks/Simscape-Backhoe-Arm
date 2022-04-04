% Code to plot simulation results from Backhoe_Arm
%% Plot Description:
%
% The plot below shows the pressure differentials in each hydraulic actuator.
%
% Copyright 2017-2022 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_Backhoe_Arm', 'var')
    sim('Backhoe_Arm')
end

% Reuse figure if it exists, else create new figure
if ~exist('h2_Backhoe_Arm', 'var') || ...
        ~isgraphics(h2_Backhoe_Arm, 'figure')
    h2_Backhoe_Arm = figure('Name', 'Backhoe_Arm');
end
figure(h2_Backhoe_Arm)
clf(h2_Backhoe_Arm)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t = simlog_Backhoe_Arm.Arm.Lift_Actuator.Hydraulic_Cylinder.A.p.series.time;
simlog_lCylA = simlog_Backhoe_Arm.Arm.Lift_Actuator.Hydraulic_Cylinder.A.p.series.values('bar');
simlog_lCylB = simlog_Backhoe_Arm.Arm.Lift_Actuator.Hydraulic_Cylinder.B.p.series.values('bar');
simlog_rCylA = simlog_Backhoe_Arm.Arm.Reach_Actuator.Hydraulic_Cylinder.A.p.series.values('bar');
simlog_rCylB = simlog_Backhoe_Arm.Arm.Reach_Actuator.Hydraulic_Cylinder.B.p.series.values('bar');
simlog_tCylA = simlog_Backhoe_Arm.Arm.Tilt_Actuator.Hydraulic_Cylinder.A.p.series.values('bar');
simlog_tCylB = simlog_Backhoe_Arm.Arm.Tilt_Actuator.Hydraulic_Cylinder.B.p.series.values('bar');

% Plot results
plot(simlog_t, simlog_lCylA-simlog_lCylB, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_rCylA-simlog_rCylB, 'LineWidth', 1)
plot(simlog_t, simlog_tCylA-simlog_tCylB, 'LineWidth', 1)
hold off
grid on
title('Pressure Differential in Actuators')
ylabel('\Delta P (bar)')
legend({'Lift','Reach','Tilt'},'Location','SouthEast');
xlabel('Time (s)')
text(0.01,0.05,['# Steps: ' num2str(length(simlog_t))],...
    'Units','Normalized','Color',[0.7 0.7 0.7]);

% Remove temporary variables
clear simlog_t simlog_handles temp_colororder
clear simlog_lCylA simlog_lCylB simlog_tCylA simlog_tCylB
clear simlog_rCylA simlog_rCylB
    
