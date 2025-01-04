% Code to plot simulation results from Backhoe_Arm
%% Plot Description:
%
% The plot below shows the reference and measured angle for joints within
% the backhoe arm.
%
% Copyright 2017-2024 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_Backhoe_Arm', 'var')
    sim('Backhoe_Arm')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_Backhoe_Arm', 'var') || ...
        ~isgraphics(h1_Backhoe_Arm, 'figure')
    h1_Backhoe_Arm = figure('Name', 'Backhoe_Arm');
end
figure(h1_Backhoe_Arm)
clf(h1_Backhoe_Arm)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_jointAngleMeas = logsout_Backhoe_Arm.get('Joint_Angle_Meas');
simlog_jointAngleRef = logsout_Backhoe_Arm.get('Joint_Angle_Ref');

% Plot results
plot(simlog_jointAngleMeas.Values.Time, simlog_jointAngleMeas.Values.Data, 'LineWidth', 1)
hold on
plot(simlog_jointAngleRef.Values.Time, simlog_jointAngleRef.Values.Data, 'k-.','LineWidth', 1)
hold off
grid on
title('Backhoe Arm Joint Angles')
ylabel('Angle (deg)')
legend({'Bucket','Upper Arm','Lower Arm','Reference'},'Location','Best');
xlabel('Time (s)')
text(0.01,0.05,['# Steps: ' num2str(length(simlog_jointAngleMeas.Values.Time))],...
    'Units','Normalized','Color',[0.7 0.7 0.7]);

% Remove temporary variables
clear simlog_jointAngleMeas simlog_jointAngleRef temp_colororder

