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
log_meas = logsout_Backhoe_Arm.get('Joint_Angle_Meas');
t_ref = log_meas.Values.Time; y_ref = log_meas.Values.Data(:,1);

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
log_meas = logsout_Backhoe_Arm.get('Joint_Angle_Meas');
t_fs = log_meas.Values.Time; y_fs = log_meas.Values.Data(:,1);

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

%% Build and download to real-time target
% Choose target
cs = getActiveConfigSet(mdl);
cs.switchTarget('slrealtime.tlc',[]);

set_param(mdl,'SimMechanicsOpenEditorOnUpdate','off');
slbuild(mdl);

%% Download to real-time target
tg = slrealtime;
tg.connect;

%% Run application
tg.load(mdl)
tg.start('ReloadOnStop',true,'ExportToBaseWorkspace',true)

open_system(mdl);
disp('Waiting for SLRT to finish...');
pause(1);
while(strcmp(tg.status,'running'))
    pause(2);
    disp(tg.status);
end
pause(2);

%% Extract results from logged data in Simulink Data Inspector
y_slrt1 = logsout_Backhoe_Arm.getElement('Joint_Angle_Meas');

%% Plot reference and real-time results
figure(1)
hold on
h3=stairs(y_slrt1.Values.Time,y_slrt1.Values.Data(:,1),'c:','LineWidth',2.5);
hold off
legend({'Reference','Fixed-Step','Real-Time'},'Location','SouthWest');

%% Modify friction to model aged cylinder
disp(['Viscous Friction (current) = ' num2str(getparam(tg,'','cyl_visc_friction'))]);
setparam(tg,'','cyl_visc_friction',2e7)
disp(['Viscous Friction (new)     = ' num2str(getparam(tg,'','cyl_visc_friction'))]);

%% Run simulation with new parameter value
tg.start('ReloadOnStop',true,'ExportToBaseWorkspace',true)

disp('Waiting for Simulink Real-Time to finish...');
pause(1);
while(strcmp(tg.status,'running'))
    pause(2);
    disp(tg.status);
end
pause(2);

%% Extract results from logged data in Simulink Data Inspector
y_slrt2 = logsout_Backhoe_Arm.getElement('Joint_Angle_Meas');

%% Plot results of aged cylinder test
figure(1)
hold on
stairs(y_slrt2.Values.Time,y_slrt2.Values.Data(:,1),'Color',temp_colororder(4,:),'LineWidth',2);
hold off
legend({'Reference','Fixed-Step','Real-Time','Modified'},'Location','NorthEast');

% Copyright 2012-2024 The MathWorks(TM), Inc.

%% CLEAN UP DIRECTORY
%cleanup_rt_dir
%close(1)

