% Copyright 2012-2014 The MathWorks(TM), Inc.

demoDir = fullfile('./');
models = dir([demoDir '/*_LS.slx']);
%models = dir([demoDir '/ssc_house*_rt.mdl']);
modelnames = strrep({models(:).name}, '.slx', '');


for mdl_i=1:size(modelnames,2)
    mdl = char(modelnames(:,mdl_i)');
    disp(['PROCESSING MODEL ' num2str(mdl_i) ' ' mdl '...']);
    load_system(mdl);
    
    solverBlock = find_system(bdroot, 'SubClassName', 'solver');
    
    if(~isempty(solverBlock))
        for solverBlock_i = 1:length(solverBlock)
            
            sampletimestr = char(get_param(solverBlock(solverBlock_i),'LocalSolverSampleTime'));
            
            sampletimenum = str2num(sampletimestr);
            if(isempty(sampletimenum))
                sampletimenum = eval(sampletimestr);
            end
            sampletime_arr(solverBlock_i) = sampletimenum;
        end
        sampletime = min(sampletime_arr);
    else
        sampletimestr = get_param(bdroot,'FixedStep');
        sampletime = str2num(sampletimestr);
    end
    
    
    set_param(bdroot,'ExtModeTrigDuration',num2str(ceil(1/sampletime)));
    set_param(bdroot,'ExtModeArmWhenConnect','on');
    set_param(bdroot,'ExtModeAutoUpdateStatusClock','on')
    set_param(bdroot,'ExtModeOpenProtocolUploadingEqualLengthVectors','on')
    set_param(bdroot,'ExplicitSolverDiagnosticOptions','none')
%    set_param(bdroot,'InputDerivativeDiagnosticOptions','none')
    set_param(bdroot,'WarnOnRedundantConstraints','off')
    set_param(bdroot,'SolverPrmCheckMsg','none')
    
    %warning off xPCTarget:sampleTime:sampleTimeInvariance
    %warning off Simulink:SL_MdlFileShadowedByFile
    
    % SET xPC TARGET
    cs = getActiveConfigSet(bdroot);
    cs.switchTarget('xpctarget.tlc',[]);
    
    save_system(mdl);
    close_system(mdl);
end



