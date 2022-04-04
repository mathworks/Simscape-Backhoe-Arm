% CLEANUP RT TEST DIR
% Copyright 2012-2022 The MathWorks(TM), Inc.

delete('*bio.m')
delete('*pt.m')
delete('*ref.m')
delete('*.dlm')
delete('*.xml')
delete('*.mldatx')

rtw_dirs = dir('*_rtw');
for i=1:size(rtw_dirs,1)
    rmdir(rtw_dirs(i).name,'s');
    %eval(['!rmdir ' rtw_dirs(i).name '/S /Q'])
end
bdclose all
delete('*.mex*')

delete([mdl '.slx'])


