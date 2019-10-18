% Copyright 2012-2019 The MathWorks, Inc.

clear ValveSimRes legend_set;

test_model = bdroot;
open(test_model);
valve_path = [test_model '/4 Way Valve'];

valve_variants = {...
    'Abstract',...
    'Spool',...
    'Flapper Nozzle Centering Spring',...
    'Flapper Nozzle Feedback Spring'};

Custom_Valve_Force_Setting = 'No_Force';
%Custom_Valve_Force_Setting = 'With Force';

for i=1:length(valve_variants)
    set_param(valve_path,'valvetype',valve_variants{i});
    valve_variant_str = strrep(valve_variants{i},'_',' ');
    force_setting_str = strrep(Custom_Valve_Force_Setting,'_',' ');

    if(~strcmp(valve_variants,'Abstract'))
        orifice_path = char(find_system(test_model,'LookUnderMasks','on','FollowLinks','on','Name','Orifices'));
        set_param(orifice_path,'OverrideUsingVariant',Custom_Valve_Force_Setting)
    end

    legend_set{i} = valve_variant_str;
    disp(['Testing ' valve_variant_str ' ' force_setting_str]);
    sim(test_model);
    ValveSimRes(i).time = Bucket_Angle_DATA.time;
    ValveSimRes(i).Angle = Bucket_Angle_DATA.signals.values(:,1);
    ValveSimRes(i).RefAngle = Bucket_Angle_DATA.signals.values(:,2);
    ValveSimRes(i).Spool_Pos = Spool_Disp_DATA.signals.values;
    ValveSimRes(i).Pressure_A = Cyl_Press_DATA.signals.values(:,1);
end

Backhoe_TiltCyl_Valve_Variants_plotpistpos
Backhoe_TiltCyl_Valve_Variants_plotspoolpos
Backhoe_TiltCyl_Valve_Variants_plotcylpress
