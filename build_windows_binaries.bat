@echo off
setlocal EnableDelayedExpansion
color e
echo Setting up Visual Studio environment...
color 2
call "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvars64.bat"
color 6
echo Creating build directory...
rd /S /Q build >nul 2>&1
mkdir build
cd build
color 9
echo Running nmake-lib.bat...
color e
cmd /c ..\nmake-lib.bat
color 6
echo Returning to parent directory...
cd ..
color b
echo Creating dll-build directory...
rd /S /Q dll-build >nul 2>&1
mkdir dll-build
cd dll-build
color 6
echo Running nmake-dll.bat...
color 6
cmd /c ..\nmake-dll.bat
timeout /t 4 /nobreak >nul
color 6
echo Listing built directory contents...
dir "..\build\kstool\"
dir "..\build\llvm\lib\"
dir "..\dll-build\llvm\bin\"
endlocal