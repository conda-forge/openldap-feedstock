@echo on
REM Copy Windows build files (Makefile.win, generated headers, .def)
REM from the recipe into the source tree
xcopy /s /y %RECIPE_DIR%\patches\* .
if errorlevel 1 exit 1

nmake /nologo /f Makefile.win PREFIX=%LIBRARY_PREFIX% CFG=Release buildall
if errorlevel 1 exit 1
nmake /nologo /f Makefile.win PREFIX=%LIBRARY_PREFIX% CFG=Release installall
if errorlevel 1 exit 1

REM Do not ship debug symbols
del /q %LIBRARY_BIN%\liblber.pdb %LIBRARY_BIN%\libldap.pdb
