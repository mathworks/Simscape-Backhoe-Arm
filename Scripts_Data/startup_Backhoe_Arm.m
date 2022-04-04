% Startup script for project Backhoe_Arm.prj
% Copyright 2012-2022 The MathWorks, Inc.

cd(fileparts(which('Actuation_System_Test.slx')))
if(exist('+Hydraulic','dir') && ~exist('Hydraulic_lib.slx','file'))
    disp('Building Custom Simscape Library...');
    ssc_build Hydraulic
    disp('Finished Building Library.');
end

cd(fileparts(which('multibody_3D_1D_intf_lib.slx')))
if(exist('+mechPS','dir') && ~exist('mechPS_lib.slx','file'))
    disp('Building Custom Simscape Library...');
    ssc_build mechPS
    disp('Finished Building Library.');
end

cd(fileparts(which('Backhoe_Arm.slx')))

Backhoe_Model_PARAM
Backhoe_Arm

open('Backhoe_Demo_Script.html')


