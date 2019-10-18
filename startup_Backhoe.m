% Copyright 2012-2014 The MathWorks, Inc.
Backhoe_Arm_HomeDir = pwd;

addpath(pwd);
addpath([pwd '\Scripts']);
addpath([pwd '\Libraries']);
addpath([pwd '\Images']);
addpath([pwd '\Images\Diagrams']);
addpath([pwd '\Actuation']);
addpath([pwd '\Custom_Orifice']);
addpath([pwd '\Custom_Valve']);
addpath([pwd '\Param_Est']);
addpath([pwd '\Optimize']);

if(exist('Custom_Orifice')==7)
    cd Custom_Orifice
    if((exist('+Hydraulic')==7) && ~exist('Hydraulic_lib'))
        disp('Building Custom Simscape Library...');
        ssc_build Hydraulic
        disp('Finished Building Library.');
    end
    cd ..
end

Backhoe_Model_PARAM
Backhoe_Arm
open('Backhoe_Demo_Script.html')


