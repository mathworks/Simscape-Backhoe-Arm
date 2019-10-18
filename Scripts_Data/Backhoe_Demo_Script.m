%% Backhoe Demo Script
%
% <html>
% <span style="font-family:Arial">
% <span style="font-size:10pt">
% <tr><b><u>Model</u></b><br>
% <tr>1.  <a href="matlab:cd(Backhoe_Arm_HomeDir);open_system('Backhoe_Arm');">Open Complete Backhoe Model</a><br>
% <tr>2.  Model Hydraulic System <a href="matlab:open_system('Tilt_Actuator_Lib');new_system('untitled');open_system('untitled');set_param(bdroot,'ModelBrowserVisibility','off');">From Scratch</a>, <a href="matlab:open_system('hydraulic_actuation_dacyl_4way');">Finished Model</a>, <a href="matlab:open_system('hydraulic_actuation_dacyl_4way_BH');">Model With Arm</a><br>
% <tr>3.  <a href="matlab:cd([Backhoe_Arm_HomeDir '/Param_Est']);open_system('Hydraulic_System_Param_Est');">Estimate Parameters</a><br>
% <tr>4.  <a href="matlab:cd([Backhoe_Arm_HomeDir '/Custom_Valve']);open_system('Backhoe_TiltCyl_Valve_Variants');">Model Custom Valve</a><br>
% <tr>5.  Simscape Language <a href="matlab:cd([Backhoe_Arm_HomeDir '/Custom_Orifice']);open_system('Orifice_Test');">Orifice Test</a>, <a href="matlab:cd([Backhoe_Arm_HomeDir '/Custom_Orifice']);open_system('Actuation_System_Test');">Actuation System</a><br>
% <tr>6.  CAD: <a href="matlab:cd([Backhoe_Arm_HomeDir filesep 'CAD' filesep 'Onshape']);edit('Get_Onshape_Backhoe_Model.m');">Import from Onshape</a>, <a href="matlab:cd(Backhoe_Arm_HomeDir);open_system('backhoe_arm_actuate');">Open Model Imported from CAD</a><br>
% <br>
% <tr><b><u>Simulate</u></b><br>
% <tr>7.  <a href="matlab:cd([Backhoe_Arm_HomeDir '/Optimize']);open_system('Backhoe_TiltCyl_PIopt');">Optimize Performance</a><br>
% <br>
% <tr><b><u>Deploy</u></b><br>
% <tr>8.  <a href="matlab:cd([Backhoe_Arm_HomeDir '/Local_Solver']);edit('Test_RT_Model');">Configure for Real-Time Simulation</a><br>
% </style>
% </style>
% </html>
% 
% Copyright 2012-2019 The MathWorks(TM), Inc.

