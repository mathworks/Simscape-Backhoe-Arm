%% Backhoe Arm
% 
% This example shows a backhoe arm with three hydraulic actuators. A PID
% controller attempts to follow reference angles for the boom, arm, and
% bucket.  This model can be used to determine the mechanical requirements
% for the arm, size the hydraulic cylinders and valves, lay out the
% architecture of the hydraulic network, and design the controller.
%
% Copyright 2014-2021 The MathWorks, Inc.


%% Model

open_system('Backhoe_Arm')

set_param(find_system('Backhoe_Arm','FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% Arm Subsystem

set_param('Backhoe_Arm/Arm','LinkStatus','none')
open_system('Backhoe_Arm/Arm','force')

%% Lift Actuator Subsystem

set_param('Backhoe_Arm/Arm/Lift Actuator','LinkStatus','none')
open_system('Backhoe_Arm/Arm/Lift Actuator','force')

%% Simulation Results from Simscape Logging
%%
%
% The plot below shows the reference and measured angle for joints within
% the backhoe arm.
%


Backhoe_Arm_plot1angle;
%%
%
% The plot below shows the pressure differentials in each hydraulic actuator.
%


Backhoe_Arm_plot2pressure;

%%

%clear all
close all
bdclose all
