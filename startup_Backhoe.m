% Copyright 2012-2017 The MathWorks, Inc.
Backhoe_Arm_HomeDir = pwd;

addpath(pwd);
addpath([pwd filesep 'Scripts_Data']);
addpath([pwd filesep 'Libraries']);
addpath([pwd filesep 'Images']);
addpath([pwd filesep 'Images' filesep 'Diagrams']);
addpath([pwd filesep 'Actuation']);
addpath([pwd filesep 'Custom_Orifice']);
addpath([pwd filesep 'Custom_Valve']);
addpath([pwd filesep 'Custom_Valve' filesep 'Images']);
addpath([pwd filesep 'Custom_Valve' filesep 'Libraries']);
addpath([pwd filesep 'Custom_Valve' filesep 'Scripts_Data']);
addpath([pwd filesep 'Param_Est']);
addpath([pwd filesep 'Optimize']);
addpath([pwd filesep 'html' filesep 'html']);

if(exist('Custom_Orifice')==7)
    cd Custom_Orifice
    if((exist('+Hydraulic')==7) && ~exist('Hydraulic_lib'))
        disp('Building Custom Simscape Library...');
        ssc_build Hydraulic
        disp('Finished Building Library.');
    end
    cd ..
end

if(exist(['CAD' filesep 'Libraries'])==7)
    addpath([pwd filesep 'CAD']);
    addpath([pwd filesep 'CAD' filesep 'Import']);
    addpath([pwd filesep 'CAD' filesep 'Libraries']);
    addpath([pwd filesep 'CAD' filesep 'Images']);
    cd(['CAD' filesep 'Libraries'])
    if((exist('+mechPS')==7) && ~exist('mechPS_lib'))
        disp('Building Custom Simscape Library...');
        ssc_build mechPS
        disp('Finished Building Library.');
    end
    cd ..
end

cd(Backhoe_Arm_HomeDir)

Backhoe_Model_PARAM
Backhoe_Arm
open('Backhoe_Demo_Script.html')


