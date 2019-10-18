%% Open model resave for real-time test
orig_mdl = 'Backhoe_Arm';
open_system(orig_mdl);
mdl = [orig_mdl '_rttest_temp'];
save_system(orig_mdl,mdl);

cyl_visc_friction = eval(get_param([mdl '/Arm/Tilt Actuator'],'friction_viscous'));
set_param([mdl '/Arm/Tilt Actuator'],'friction_viscous','cyl_visc_friction');
set_param(mdl,'SimscapeLogType','none');
set_param(mdl,'StopTime','30');

%% Get reference results
Backhoe_Arm_setsolver(mdl,'desktop');
sim(mdl)
t_ref = tout; y_ref = yout;
clear tout yout

%% Create plot
figure(1)
temp_colororder = get(gca,'DefaultAxesColorOrder');
set(gcf,'Position',[552    50   472   301]);
plot(t_ref,y_ref,'k','LineWidth',3)
title('Comparing Simulation Results','FontSize',14,'FontWeight','Bold');
xlabel('Time (s)','FontSize',12);ylabel('Results');
legend({'Reference'},'Location','SouthWest')

%% Get results with real-time solver settings
Backhoe_Arm_setsolver(mdl,'realtime');
sim(mdl)
t_fs = tout; y_fs = yout;

%% Compare desktop and real-time results
figure(1)
hold on
h2=stairs(t_fs,y_fs,'Color',temp_colororder(2,:),'LineWidth',2.5);
hold off
legend({'Reference','Fixed-Step'},'Location','SouthWest')

%% Select run-time parameter
tune_bpth = [mdl '/Arm/Tilt Actuator/Friction'];
set_param(tune_bpth,'visc_coef_conf','runtime');

% Highlight block
open_system(get_param(tune_bpth,'Parent'),'force')
set_param(tune_bpth,'Selected','on');


%% BUILD AND DOWNLOAD XPC TARGET
slbuild(mdl);

%% Set simulation mode to External
set_param(mdl,'SimulationMode','External');

%% Connect to target and run
set_param(mdl, 'SimulationCommand', 'connect')
set_param(mdl, 'SimulationCommand', 'start')

open_system(mdl);
disp('Waiting for SLRT to finish...');
pause(1);
disp(get_param(mdl,'SimulationStatus'));
while(~strcmp(get_param(mdl,'SimulationStatus'),'stopped'))
    pause(2);
    disp(get_param(mdl,'SimulationStatus'));
end
pause(2);

t_slrt1 = tg.TimeLog; y_slrt1 = tg.OutputLog;

%% Plot reference and real-time results
figure(1)
hold on
h3=stairs(t_slrt1,y_slrt1,'c:','LineWidth',2.5);
hold off
legend({'Reference','Fixed-Step','Real-Time'},'Location','SouthWest');

%% Modify friction to model aged cylinder
friction_id = getparamid(tg, '','cyl_visc_friction');
disp(['Viscous Friction (current) = ' sprintf('%2.1e',getparam(tg,friction_id))]);
setparam(tg,friction_id,2e7);
disp(['Viscous Friction (new)     = ' sprintf('%2.1e',getparam(tg,friction_id))]);

%% Run simulation with new parameter value
start(tg);

disp('Waiting for Simulink Real-Time to finish...');
pause(1);
disp(tg.Status);
while(~strcmp(tg.Status,'stopped'))
    pause(2);
    disp(tg.Status);
end
pause(2);

t_slrt2 = tg.TimeLog; y_slrt2 = tg.OutputLog;

%% Plot results of aged cylinder test
figure(1)
hold on
stairs(t_slrt2,y_slrt2,'Color',temp_colororder(4,:),'LineWidth',2);
hold off
legend({'Reference','Fixed-Step','Real-Time','Modified'},'Location','NorthEast');

% Copyright 2012-2017 The MathWorks(TM), Inc.

%% CLEAN UP DIRECTORY
cleanup_rt_dir
%close(1)

