% Copyright 2012-2014 The MathWorks, Inc.

clear ValveSimRes legend_set;

% ENTER THE NAME OF THE MODEL HERE
% THE REST OF THE FILE SHOULD NOT NEED TO BE CHANGED
test_model = bdroot;

%open(test_model);
valve_path = [test_model '/4 Way Valve'];
current_valve_choice=get_param(valve_path,'BlockChoice');

if(~strcmp(current_valve_choice,'Ideal'))
    orifice_path = char(find_system(bdroot,'LookUnderMasks','on','FollowLinks','on','Name','Orifices'));
else
    warning_string = sprintf('The ideal valve cannot take into account spool forces.\nSelect another valve by right-clicking on the valve block in the model\nand select the ''Block Choice'' parameter.');
    f = warndlg(warning_string, 'Select another valve', 'modal');
    break
end

Orifice_Options = {'No Force','With Force'};
for i = 1:length(Orifice_Options)
    set_param(orifice_path,'BlockChoice',char(Orifice_Options{i}));
    disp(['Testing ' char(Orifice_Options{i})]);

    legend_set{i} = [current_valve_choice ', ' char(Orifice_Options{i})];
    sim(test_model);
    ValveSimRes(i).time = Bucket_Angle_DATA.time;
    ValveSimRes(i).Angle = Bucket_Angle_DATA.signals.values(:,1);
    ValveSimRes(i).Spool_Pos = Spool_Disp_DATA.signals(1).values;
    ValveSimRes(i).Pressure_A = Cyl_Press_DATA.signals.values(:,1);
end

Custom_Valve_Plot_Piston_Position
Custom_Valve_Plot_Spool_Position
Custom_Valve_Plot_Cyl_Press
Custom_Valve_Plot_Spool_Force

