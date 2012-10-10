## Running
* run "run-all.bat"

## formatter assumptions
* DLL name: "XfoDotNet<.NET major version>0Ctl<Formatter major version *10 + minor version>.dll" (eg XfoDotNet20Ctl60.dll for .NET2.0 and Formatter6.0)
* directory name: AHFormatterV<version number passed in run-all.bat>
* programfiles directory name:
 * for versions greater than 5: "Antenna House"
 * for versions less than 6: "AntenaHouse"
* sample FO: <Install dir>\samples\sample.fo

## SBC assumptions
* DLL name: "DfvDotNet<.NET major version>0Ctl<SBC major version *10 + minor version>.dll" (eg DfvDotNet20Ctl40.dll for .NET2.0 and SBC4.0)
* directory name: Server Based ConverterV<version number passed in run-all.bat>
* programfiles directory name:
 * for versions greater than 3: "Antenna House"
 * for versions less than 4: "AntenaHouse"
* sample document: <testing dir>\sbc_sample.doc

## .NET Assumptions
* .NET2.0 version: v2.0.50727
* .NET4.0 version: v4.0.30319

## Windows assumptions
* %PROCESSOR_ARCHITECTURE% is "x86" only on 32bit systems
* x86 Program Files on x64 systems is: "C:\Program Files (x86)"
