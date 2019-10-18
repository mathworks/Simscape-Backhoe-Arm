% Copyright 2012-2014 The MathWorks, Inc.

clear ValveSimRes legend_set;

test_model = bdroot;
open(test_model);
valve_path = [test_model '/4 Way Valve'];

block_choices=get_param(valve_path,'MemberBlocks');
block_choices = [block_choices,','];
idx = findstr(block_choices,',');

block_choice_list{1} = block_choices(1:idx(1)-1);
for i=2:length(idx);
    block_choice_list{i} = block_choices(idx(i-1)+1:idx(i)-1);
end

Custom_Valve_Force_Setting = 'No Force';
%Custom_Valve_Force_Setting = 'With Force';

for i=1:length(block_choice_list)
    set_param(valve_path,'BlockChoice',block_choice_list{i})

    if(~strcmp(block_choice_list{i},'Ideal'))
        orifice_path = char(find_system(bdroot,'LookUnderMasks','on','FollowLinks','on','Name','Orifices'));
        set_param(orifice_path,'BlockChoice',Custom_Valve_Force_Setting)
    end

    legend_set{i} = block_choice_list{i};
    disp(['Testing ' char(block_choice_list{i}) ' ' Custom_Valve_Force_Setting]);
    sim(test_model);
    ValveSimRes(i).time = Bucket_Angle_DATA.time;
    ValveSimRes(i).Angle = Bucket_Angle_DATA.signals.values(:,1);
    ValveSimRes(i).Spool_Pos = Spool_Disp_DATA.signals.values;
    ValveSimRes(i).Pressure_A = Cyl_Press_DATA.signals.values(:,1);
end

Custom_Valve_Plot_Piston_Position
Custom_Valve_Plot_Spool_Position
Custom_Valve_Plot_Cyl_Press
