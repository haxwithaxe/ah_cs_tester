@echo off

set openPDF=false
::set openPDF=true

::arch x64 or x86
set arch=%1
::software ahf or sbc
set software=%2
::software_version <integer> (number only)
set software_version=%3
::dll_version <dotnet major version (eg 4)>
set dll_version=%4
::dotnet_version <dotnet major version (eg 4)>
set dotnet_version=%5

set PROGRAMFILESDIR=C:\Program Files

::echo Which Software ...
if %software% == ahf goto softFormatter
if %software% == sbc goto softSBC

:softFormatter
::echo softFormatter
set softID=formatterV%software_version%
set DLLPREF=Xfo
set AHSOFTDIR=AHFormatterV%software_version%
if %software_version% GTR 5 set AHTOPDIR=Antenna House
if %software_version% LSS 6  set AHTOPDIR=AntenaHouse
set exeInputFile=%AHDIR%\samples\sample.fo
goto softend

:softSBC
::echo softSBC
set softID=sbcV%software_version%
set DLLPREF=Dfv
set AHSOFTDIR=Server Based ConverterV%software_version%
if %software_version% GTR 3 set AHTOPDIR=Antenna House
if %software_version% LSS 4  set AHTOPDIR=AntenaHouse
goto softend

:softend
::echo Softend

::echo Which dotnet ...
if %dotnet_version% == 2 goto dotnet2
if %dotnet_version% == 4 goto dotnet4

:dotnet2
::echo dotnet2
set DOTNETVERSION=v2.0.50727
set testID=_NET2
goto dotnetend

:dotnet4
::echo dotnet4
set DOTNETVERSION=v4.0.30319
set testID=_NET4
goto dotnetend

:dotnetend
::echo dotnetend

::echo Which arch ...
if %arch% == x86 goto arch86
if %arch% == x64 goto arch64

:arch86
::echo arch86
if %PROCESSOR_ARCHITECTURE% NEQ x86 set PROGRAMFILESDIR=C:\Program Files (x86)
set FRAMEWORK_ARCH=Framework
set testID=x86%testID%
set platform=x86
goto archend

:arch64
::echo arch64
set FRAMEWORK_ARCH=Framework64
set testID=x64%testID%
set platform=x64
goto archend

:archend
::echo archend

::echo Which dotnet for dll ...
if %dll_version% == 2 goto dlldotnet2
if %dll_version% == 4 goto dlldotnet4

:dlldotnet2
::echo dlldotnet2
set DLLSUFF=DotNet20Ctl%software_version%0.dll
goto dlldotnetend

:dlldotnet4
::echo dlldotnet4
set DLLSUFF=DotNet40Ctl%software_version%0.dll
goto dlldotnetend

:dlldotnetend
::echo dlldotnetend

::echo Main ...
set testID=%softID%-%testID%
set AHDIR=%PROGRAMFILESDIR%\%AHTOPDIR%\%AHSOFTDIR%
::echo AHDIR %AHDIR%

::echo Which Software ...
if %software% == ahf goto softFormatter2
if %software% == sbc goto softSBC2

:softFormatter2
set exeInputFile=%AHDIR%\samples\sample.fo
goto softend2

:softSBC2
set exeInputFile=sbc_sample.doc
goto softend2

:softend2

set AHDLL=%AHDIR%\%DLLPREF%%DLLSUFF%
echo copying %AHDLL%
copy /y "%AHDLL%" .

set CSC=C:\WINDOWS\Microsoft.NET\%FRAMEWORK_ARCH%\%DOTNETVERSION%\csc.exe
::echo CSC %CSC%

set PLATFORM=/platform:%platform%
::echo PLATFORM %PLATFORM%

set Refs=/reference:"%AHDLL%"
::echo Refs %Refs%

echo Debug: enabled
set Debug=
::/debug+ /debug:full

set exeFile=test-%testID%-output.exe
echo Executable: %outputFile%

set sourceFile=%AHDIR%\samples\dotnet\cs\sample.cs
::echo inputFile %inputFile%

set exeOutputFile=test-%testID%-output.pdf
::echo pdfFile %pdfFile%

echo Compiling ...
%CSC% %PLATFORM% %Debug% %Refs% /optimize- /out:%exeFile% "%sourceFile%"
echo Done Compiling

echo Running %exeFile%
%exeFile% "%exeInputFile%" "%exeOutputFile%" 2>&1 >test-%testID%-run.log

if "%openPDF%" == "true" goto openPDFJump
if not "%openPDF%" == "true" goto printPDFJump

:openPDFJump
echo Opening %exeOutputFile%
start /b "" %exeOutputFile%
goto printPDFJump

:printPDFJump
echo PDF Should be found here: %exeOutputFile%
goto EndOfScript

:EndOfScript
echo done
exit