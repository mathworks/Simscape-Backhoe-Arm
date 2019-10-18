% BACKHOE MODEL PARAMETERS
% Copyright 2012-2014 The MathWorks, Inc.

BH_Param.Colors.cylinderGray = [0.6 0.6 0.6];
BH_Param.Colors.darkOrange = [0.8 0.5 0];
BH_Param.Colors.glassBlue = [0.2 0.2 1];
BH_Param.Colors.gray = [0.3 0.3 0.3];
BH_Param.Colors.orange = [0.8 0.65 0];
BH_Param.Colors.pistonGray = [0.4 0.4 0.4];
BH_Param.Colors.tireBlack = [0.1 0.1 0.1];
BH_Param.Colors.wheelGray = [0.6 0.6 0.6];
BH_Param.Colors.yellow = [0.8 0.8 0];
BH_Param.Densities.rhoGlass = 2500;
BH_Param.Densities.rhoRubber = 1500;
BH_Param.Densities.rhoSteel = 7800;

BH_Param.Constants.psi2Pa = 6894.75;

BH_Param.Friction.Breakaway = 2e5;
BH_Param.Friction.Coulomb = 2e5;
BH_Param.Friction.Viscous = 1e8;

% LIFT ACTUATOR
BH_Param.Lift_Actuator.Friction.Breakaway = 1e5;
BH_Param.Lift_Actuator.Friction.Coulomb = 1e5;
BH_Param.Lift_Actuator.Friction.Viscous = 1e7;

BH_Param.Lift_Actuator.Cylinder.Area_A = 0.2^2*pi*2;
BH_Param.Lift_Actuator.Cylinder.Area_B = 0.2^2*pi*2;
BH_Param.Lift_Actuator.Cylinder.Stroke = 1.85;
BH_Param.Lift_Actuator.Cylinder.DeadVol_A = 1e-4;
BH_Param.Lift_Actuator.Cylinder.DeadVol_B = 1e-4;
BH_Param.Lift_Actuator.Cylinder.x0 = 0.067; % m
BH_Param.Lift_Actuator.Cylinder.PA0 = 3500*BH_Param.Constants.psi2Pa; %psi
BH_Param.Lift_Actuator.Cylinder.PB0 = 500*BH_Param.Constants.psi2Pa;  %psi

BH_Param.Lift_Actuator.Valve.Max_Area = 500; % mm^2
BH_Param.Lift_Actuator.Valve.Max_Opening = 0.005; % m

BH_Param.Lift_Actuator.Cyl_Dims.Lcyl = 1.85; % m
BH_Param.Lift_Actuator.Cyl_Dims.Rcyl = 0.2; % m
BH_Param.Lift_Actuator.Cyl_Dims.Lbase = 0.65; % m
BH_Param.Lift_Actuator.Cyl_Dims.Wbase= 0.425; % m
BH_Param.Lift_Actuator.Cyl_Dims.Rbp= 0.075; % m
BH_Param.Lift_Actuator.Cyl_Dims.Lbp= 0.8; % m

BH_Param.Lift_Actuator.Piston_Dims.Lpist = 1.85; % m
BH_Param.Lift_Actuator.Piston_Dims.Rpist = 0.12; % m
BH_Param.Lift_Actuator.Piston_Dims.Whead = 0.35; % m
BH_Param.Lift_Actuator.Piston_Dims.Lhead= 0.65; % m
BH_Param.Lift_Actuator.Piston_Dims.Rhp= 0.075; % m
BH_Param.Lift_Actuator.Piston_Dims.Lhp= 0.9; % m


% REACH ACTUATOR
BH_Param.Reach_Actuator.Friction.Breakaway = 1e4;
BH_Param.Reach_Actuator.Friction.Coulomb = 1e4;
BH_Param.Reach_Actuator.Friction.Viscous = 1e7;

BH_Param.Reach_Actuator.Cylinder.Area_A = 0.2^2*pi;
BH_Param.Reach_Actuator.Cylinder.Area_B = 0.2^2*pi;
BH_Param.Reach_Actuator.Cylinder.Stroke = 2.25;
BH_Param.Reach_Actuator.Cylinder.DeadVol_A = 1e-4;
BH_Param.Reach_Actuator.Cylinder.DeadVol_B = 1e-4;
BH_Param.Reach_Actuator.Cylinder.x0 = 2;  %m
BH_Param.Reach_Actuator.Cylinder.PA0 = 2000*BH_Param.Constants.psi2Pa; %psi
BH_Param.Reach_Actuator.Cylinder.PB0 = 1100*BH_Param.Constants.psi2Pa;  %psi

BH_Param.Reach_Actuator.Valve.Max_Area = 500; % mm^2
BH_Param.Reach_Actuator.Valve.Max_Opening = 0.005; % m

BH_Param.Reach_Actuator.Cyl_Dims.Lcyl = 2.25; % m
BH_Param.Reach_Actuator.Cyl_Dims.Rcyl = 0.2; % m
BH_Param.Reach_Actuator.Cyl_Dims.Lbase = 0.65; % m
BH_Param.Reach_Actuator.Cyl_Dims.Wbase= 0.425; % m
BH_Param.Reach_Actuator.Cyl_Dims.Rbp= 0.075; % m
BH_Param.Reach_Actuator.Cyl_Dims.Lbp= 0.8; % m

BH_Param.Reach_Actuator.Piston_Dims.Lpist = 2.25; % m
BH_Param.Reach_Actuator.Piston_Dims.Rpist = 0.12; % m
BH_Param.Reach_Actuator.Piston_Dims.Whead = 0.35; % m
BH_Param.Reach_Actuator.Piston_Dims.Lhead= 0.65; % m
BH_Param.Reach_Actuator.Piston_Dims.Rhp= 0.075; % m
BH_Param.Reach_Actuator.Piston_Dims.Lhp= 0.9; % m


% TILT ACTUATOR
BH_Param.Tilt_Actuator.Friction.Breakaway = 2000;
BH_Param.Tilt_Actuator.Friction.Coulomb = 2000;
BH_Param.Tilt_Actuator.Friction.Viscous = 1e6;

BH_Param.Tilt_Actuator.Cylinder.Area_A = 0.2^2*pi;
BH_Param.Tilt_Actuator.Cylinder.Area_B = 0.2^2*pi;
BH_Param.Tilt_Actuator.Cylinder.Stroke = 1.9;
BH_Param.Tilt_Actuator.Cylinder.DeadVol_A = 1e-4;
BH_Param.Tilt_Actuator.Cylinder.DeadVol_B = 1e-4;
BH_Param.Tilt_Actuator.Cylinder.x0 = 1.85;  %m
BH_Param.Tilt_Actuator.Cylinder.PA0 = 1875*BH_Param.Constants.psi2Pa; %psi
BH_Param.Tilt_Actuator.Cylinder.PB0 = 2130*BH_Param.Constants.psi2Pa;  %psi

BH_Param.Tilt_Actuator.Valve.Max_Area = 500; % mm^2
BH_Param.Tilt_Actuator.Valve.Max_Opening = 0.005; % m

BH_Param.Tilt_Actuator.Cyl_Dims.Lcyl = 1.9; % m
BH_Param.Tilt_Actuator.Cyl_Dims.Rcyl = 0.2; % m
BH_Param.Tilt_Actuator.Cyl_Dims.Lbase = 0.65; % m
BH_Param.Tilt_Actuator.Cyl_Dims.Wbase= 0.425; % m
BH_Param.Tilt_Actuator.Cyl_Dims.Rbp= 0.075; % m
BH_Param.Tilt_Actuator.Cyl_Dims.Lbp= 0.8; % m

BH_Param.Tilt_Actuator.Piston_Dims.Lpist = 1.9; % m
BH_Param.Tilt_Actuator.Piston_Dims.Rpist = 0.12; % m
BH_Param.Tilt_Actuator.Piston_Dims.Whead = 0.35; % m
BH_Param.Tilt_Actuator.Piston_Dims.Lhead= 0.65; % m
BH_Param.Tilt_Actuator.Piston_Dims.Rhp= 0.075; % m
BH_Param.Tilt_Actuator.Piston_Dims.Lhp= 0.9; % m


% HYDRAULIC SUPPLY
BH_Param.Hydraulic.Pump.Displacement = 5e-04; % m^3/rad
BH_Param.Hydraulic.Pump.Vol_Eff = 0.92; 
BH_Param.Hydraulic.Pump.Total_Eff = 0.8; 
BH_Param.Hydraulic.Pump.Nominal_Pressure = 1e7; % Pa 
BH_Param.Hydraulic.Pump.Nominal_Ang_Vel = 188; % rad/s
BH_Param.Hydraulic.Pump.Nominal_Kin_Visc = 18; % cSt
BH_Param.Hydraulic.Pump.Speed = 188; % rad/s

BH_Param.Hydraulic.PRV.Max_Area = 2e-3; % m^2
BH_Param.Hydraulic.PRV.Pressure_Set = 4000*BH_Param.Constants.psi2Pa; % Pa
BH_Param.Hydraulic.PRV.Pressure_Rng = 400*BH_Param.Constants.psi2Pa; % Pa
BH_Param.Hydraulic.PRV.Flow_Disch_Coeff = 0.7;
BH_Param.Hydraulic.PRV.Re_Critical = 12;
BH_Param.Hydraulic.PRV.Leakage_Area = 1e-9; % m^2
