% Example MATLAB script to convert Onshape CAD assembly to a
% Simscape Multibody model
%
% Running this script will
% 1. Export an example CAD assembly from Onshape
%    Note: requires Onshape account
% 2. Automatically construct a Simscape Multibody model
% 3. Adjust a couple default settings
% 4. Run the simulation
% 5. Add actuation
% 6. Run the simulation
% 7. Plot results

% Copyright 2016-2021 The MathWorks, Inc.

% Add current directory to path
%addpath(pwd)

%% Create and move to folder for files
mkdir('FromOnshape')
cd('FromOnshape')

%% 1. Export CAD assembly from Onshape
% Requires Onshape account
Onshape_assembly_url = 'https://cad.onshape.com/documents/58b99e4c0a25bb0ff5a7a368/w/0f8a216769e4fc8224eb242e/e/f90780d0737155c0edc950e8';
if ~verLessThan('matlab', '9.2')
    multibody_xml_file = smexportonshape(Onshape_assembly_url);
elseif verLessThan('matlab', '9.1')
    errordlg('Export from Onshape is not supported in this release','Export Not Supported');
else
    if (exist('smexportonshape_16b','file'))
        multibody_xml_file = smexportonshape_16b(Onshape_assembly_url);
    else
        errordlg('Please visit the MATLAB Central File Exchange to download the function that will enable you to export from Onshape to Simscape Multibody.','Function not present');
        return
    end
end
%% 2. Automatically construct Simscape Multibody model
mdl_h = smimport(multibody_xml_file,'ModelName',strrep(multibody_xml_file,'.xml','_imported'));
modelname = get_param(mdl_h,'Name');

%% 3. Adjust default settings (gravity, logging, etc.)
% Enable Simscape Logging
set_param(modelname,'SimscapeLogType','All');
set_param([modelname '/MechanismConfiguration'],'GravityVector','[0 0 -9.80665]');

% 4. Run simulation
out1=sim(modelname);

%% 5. Add actuation
act_h = find_system(modelname,'regexp','on','Name','CylindricalCylinder.*');

for i=1:length(act_h)
    set_param(act_h{i},...
        'PzDampingCoefficient','2e7',...
        'PzSpringStiffness','1e7',...
        'PzEquilibriumPosition','0.2',...
        'FontSize','14','FontWeight','Bold')
end


%% 6. Run simulation
out2=sim(modelname);

%% 7. Plot Results
% Reuse figure if it exists, else create new figure
if ~exist('h1_backhoe_arm_imported', 'var') || ...
        ~isgraphics(h1_backhoe_arm_imported, 'figure')
    h1_backhoe_arm_imported = figure('Name', 'backhoe_arm_imported');
end
figure(h1_backhoe_arm_imported)
clf(h1_backhoe_arm_imported)

simlog_t = out2.simlog.CylindricalCylinderBoomRod.Pz.p.series.time;
ext_boomCyl = out2.simlog.CylindricalCylinderBoomRod.Pz.p.series.values('m');
ext_StickCyl = out2.simlog.CylindricalCylinderStickRod.Pz.p.series.values('m');
ext_BucketCyl = out2.simlog.CylindricalCylinderBucketRod.Pz.p.series.values('m');

plot(simlog_t,[ext_boomCyl ext_StickCyl ext_BucketCyl],'LineWidth',1);
title('Actuator Extension')
legend({'Boom','Stick','Bucket'},'Location','Best');
ylabel('Extension (m)');
xlabel('Time (s)');
grid on




