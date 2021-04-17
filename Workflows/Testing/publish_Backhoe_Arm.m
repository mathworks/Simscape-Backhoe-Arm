% Script for testing Backhoe_Arm and publishing results
% Copyright 2012-2021 The MathWorks, Inc.

mdl_list = {...
    'Backhoe_Arm',...
    'Backhoe_TiltCyl_Valve_Variants.slx'...
    };

% Loop over models with publish script
for mdl_list_i = 1:length(mdl_list)
    
    % Move to folder with publish scripts
    cd(fileparts(which(mdl_list{mdl_list_i})))
    cd('Overview')
    
    % Close main model to avoid shadowing error
    bdclose(mdl_list{mdl_list_i});
    
    % Loop over publish scripts
    filelist_m=dir('*.m');
    filenames_m = {filelist_m.name};
    warning('off','Simulink:Engine:MdlFileShadowedByFile');
    for filenames_m_i=1:length(filenames_m)
        publish(filenames_m{filenames_m_i},'showCode',false)
    end    
end

clear filelist_m filenames_m filenames_m_i 
clear mdl_list mdl_list_i

