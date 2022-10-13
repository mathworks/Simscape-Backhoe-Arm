%% Backhoe with Custom Valve
% 
% This example shows the performance of various hydraulic valves in a
% backhoe actuation system.  The abstract valve includes no spool dynamics.
% The spool valve models an electromagnetically actuated spool with a
% centering spring.  The flapper-nozzle with centering spring uses
% the hydraulic pressure to actuate the spool.  The flapper-nozzle with
% feedback uses hydraulic pressure to actuate the spool, and spool is
% connected to the flapper providing a mechanical form of feedback within
% the system.
%
% The model can be configured to use any of these valve types, and
% hydraulic forces on the spool due to flow through the orifices can be
% enabled or disabled for each valve type that models spool dynamics.
%
% Copyright 2014-2022 The MathWorks, Inc.



%% Model

open_system('Backhoe_TiltCyl_Valve_Variants')

set_param(find_system('Backhoe_TiltCyl_Valve_Variants','MatchFilter',@Simulink.match.allVariants,'FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% Tilt Actuator Subsystem

set_param('Backhoe_TiltCyl_Valve_Variants/Tilt Actuator','LinkStatus','none')
open_system('Backhoe_TiltCyl_Valve_Variants/Tilt Actuator','force')

%% Abstract Valve Variant

set_param('Backhoe_TiltCyl_Valve_Variants/4 Way Valve','valvetype','Abstract')
open_system('Backhoe_TiltCyl_Valve_Variants/4 Way Valve/Abstract','force')
set_param('Backhoe_TiltCyl_Valve_Variants/4 Way Valve/Abstract','LinkStatus','none')
close_system('Backhoe_TiltCyl_Valve_Variants/4 Way Valve')

%% Spool Valve Variant

set_param('Backhoe_TiltCyl_Valve_Variants/4 Way Valve','valvetype','Spool')
open_system('Backhoe_TiltCyl_Valve_Variants/4 Way Valve/Spool','force')
set_param('Backhoe_TiltCyl_Valve_Variants/4 Way Valve/Spool','LinkStatus','none')
close_system('Backhoe_TiltCyl_Valve_Variants/4 Way Valve')


%% Nozzle Centering Spring Valve Variant

set_param('Backhoe_TiltCyl_Valve_Variants/4 Way Valve','valvetype','Flapper Nozzle Centering Spring')
open_system('Backhoe_TiltCyl_Valve_Variants/4 Way Valve/Nozzle Center','force')
set_param('Backhoe_TiltCyl_Valve_Variants/4 Way Valve/Nozzle Center','LinkStatus','none')
close_system('Backhoe_TiltCyl_Valve_Variants/4 Way Valve')

%% Nozzle Feedback Spring Valve Variant

set_param('Backhoe_TiltCyl_Valve_Variants/4 Way Valve','valvetype','Flapper Nozzle Feedback Spring')
open_system('Backhoe_TiltCyl_Valve_Variants/4 Way Valve/Nozzle Feedback','force')
set_param('Backhoe_TiltCyl_Valve_Variants/4 Way Valve/Nozzle Feedback','LinkStatus','none')
close_system('Backhoe_TiltCyl_Valve_Variants/4 Way Valve')


%% Simulation Results from Simscape Logging
%%
%
% The following plots compare system performance with different valve
% types.  Orifice hydraulic forces on the spool are neglected.
%

open_system('Backhoe_TiltCyl_Valve_Variants')
close(gcf)
Backhoe_TiltCyl_Valve_Variants_testvalves;
close_system('Backhoe_TiltCyl_Valve_Variants/4 Way Valve')

%% Orifice Hydraulic Forces in Spool Valve
%
% The following plots compare system performance if hydraulic forces on the
% spool are neglected or included.

set_param('Backhoe_TiltCyl_Valve_Variants/4 Way Valve','valvetype','Spool')
Backhoe_TiltCyl_Valve_Variants_testforces
close_system('Backhoe_TiltCyl_Valve_Variants/4 Way Valve')

%% Orifice Hydraulic Forces in Flapper Nozzle Valve with Centering Spring
%
% The following plots compare system performance if hydraulic forces on the
% spool are neglected or included.

set_param('Backhoe_TiltCyl_Valve_Variants/4 Way Valve','valvetype','Flapper Nozzle Centering Spring')
Backhoe_TiltCyl_Valve_Variants_testforces
close_system('Backhoe_TiltCyl_Valve_Variants/4 Way Valve')

%% Orifice Hydraulic Forces in Flapper Nozzle Valve with Feedback Spring
%
% The following plots compare system performance if hydraulic forces on the
% spool are neglected or included.

set_param('Backhoe_TiltCyl_Valve_Variants/4 Way Valve','valvetype','Flapper Nozzle Feedback Spring')
Backhoe_TiltCyl_Valve_Variants_testforces
close_system('Backhoe_TiltCyl_Valve_Variants/4 Way Valve')

%%

%clear all
close all
bdclose all
