% Code to plot simulation results from hydraulic_actuation_dacyl_4way_BH
%% Plot Description:
%
% <enter plot description here if desired>
%
% Copyright 2016-2021 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_hydraulic_actuation_dacyl_4way_BH', 'var')
    sim('hydraulic_actuation_dacyl_4way_BH')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_hydraulic_actuation_dacyl_4way_BH', 'var') || ...
        ~isgraphics(h1_hydraulic_actuation_dacyl_4way_BH, 'figure')
    h1_hydraulic_actuation_dacyl_4way_BH = figure('Name', 'hydraulic_actuation_dacyl_4way_BH');
end
figure(h1_hydraulic_actuation_dacyl_4way_BH)
clf(h1_hydraulic_actuation_dacyl_4way_BH)

% Get simulation results
simlog_t = simlog_hydraulic_actuation_dacyl_4way_BH.Tilt_Actuator.UArm_to_Bucket.Rz.q.series.time;
simlog_bucketAngle = simlog_hydraulic_actuation_dacyl_4way_BH.Tilt_Actuator.UArm_to_Bucket.Rz.q.series.values('deg');

% Plot results
plot(simlog_t, simlog_bucketAngle, 'LineWidth', 1)
hold off
grid on
title('Bucket Angle')
ylabel('Angle (deg)')
xlabel('Time (s)');
%legend({'Side A','Side B'},'Location','Best');

% Remove temporary variables
clear simlog_t simlog_bucketAngle simlog_handles
