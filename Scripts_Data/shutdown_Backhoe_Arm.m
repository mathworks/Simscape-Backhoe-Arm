% Shutdown file for project Backhoe_Arm.prj
% Copyright 2012-2021 The MathWorks, Inc.

cd(fileparts(which('Actuation_System_Test.slx')))
if(exist('+Hydraulic','dir') && exist('Hydraulic_lib.slx','file'))
    ssc_clean Hydraulic
end

cd(fileparts(which('multibody_3D_1D_intf_lib.slx')))
if(exist('+mechPS','dir') && exist('mechPS_lib.slx','file'))
    ssc_clean mechPS
end
cd(fileparts(which('Backhoe_Arm.slx')))
