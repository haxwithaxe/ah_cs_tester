
set start=start /wait
::Formatter v6
set ahf_ver=6
:: 64bit
::  .NET4
::   .NET4 DLL
%start% cs-test.bat x64 ahf %ahf_ver% 4 4
::   .NET2 DLL
%start% cs-test.bat x64 ahf %ahf_ver% 2 4
::  .NET2
::   .NET2 DLL
%start% cs-test.bat x64 ahf %ahf_ver% 2 2
:: 32bit
::  .NET4
::   .NET4 DLL
%start% cs-test.bat x86 ahf %ahf_ver% 4 4
::   .NET2 DLL
%start% cs-test.bat x86 ahf %ahf_ver% 2 4
::  .NET2
::   .NET2 DLL
%start% cs-test.bat x86 ahf %ahf_ver% 2 2

::SBC v4
set sbc_ver=4
:: 64bit
::  .NET4
::   .NET4 DLL
%start% cs-test.bat x64 sbc %sbc_ver% 4 4
::   .NET2 DLL
%start% cs-test.bat x64 sbc %sbc_ver% 2 4
::  .NET2
::   .NET2 DLL
%start% cs-test.bat x64 sbc %sbc_ver% 2 2
:: 32bit
::  .NET4
::   .NET4 DLL
%start% cs-test.bat x86 sbc %sbc_ver% 4 4
::   .NET2 DLL
%start% cs-test.bat x86 sbc %sbc_ver% 2 4
::  .NET2
::   .NET2 DLL
%start% cs-test.bat x86 sbc %sbc_ver% 2 2