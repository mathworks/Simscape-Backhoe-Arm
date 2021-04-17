% Copyright 2012-2021 The MathWorks, Inc.

clear ValveSimRes legend_set;

test_model = bdroot;

valve_path = [test_model '/4 Way Valve'];
current_valve_choice=get_param(valve_path,'ActiveVariant');

if(~strcmp(current_valve_choice,'Abstract'))
    orifice_path = char(find_system(bdroot,'LookUnderMasks','on','FollowLinks','on','Name','Orifices'));
    
    Orifice_Options = {'No_Force','With_Force'};
    Hydraulic_Forces = {'Disable','Enable'};

    for i = 1:length(Orifice_Options)
        valve_variant_str = strrep(current_valve_choice,'_',' ');
        force_setting_str = strrep(char(Orifice_Options{i}),'_',' ');
        set_param(valve_path,'spool_hyd_frc',char(Hydraulic_Forces{i}));
        disp(['Testing ' char(Orifice_Options{i})]);
        
        legend_set{i} = [valve_variant_str ', ' force_setting_str];
        sim(test_model);
        ValveSimRes(i).time = Bucket_Angle_DATA.time;
        ValveSimRes(i).Angle = Bucket_Angle_DATA.signals.values(:,1);
        ValveSimRes(i).RefAngle = Bucket_Angle_DATA.signals.values(:,2);
        ValveSimRes(i).Spool_Pos = Spool_Disp_DATA.signals(1).values;
        ValveSimRes(i).Pressure_A = Cyl_Press_DATA.signals.values(:,1);
    end
    
    Backhoe_TiltCyl_Valve_Variants_plotpistpos
    Backhoe_TiltCyl_Valve_Variants_plotspoolpos
    Backhoe_TiltCyl_Valve_Variants_plotcylpress
    Backhoe_TiltCyl_Valve_Variants_plotspoolforce
    
else
    warning_string = sprintf('The abstract valve model cannot take into account spool forces.\nSelect another valve model.');
    f = warndlg(warning_string, 'Select another valve', 'modal');
end

