@echo off
:menu
cls
echo ======================
echo       SDS LOCAL
echo ======================
echo.
echo 1  - Hyderabad
echo 2  - Temp
echo 3  - 2016
echo.
echo 4  - Karachi
echo 5  - Fortune
echo.
echo 6  - Mirpurkhas
echo 7  - Temp
echo 8  - 2016
echo.
echo 9  - Nawabshah
echo 10 - TEMP
echo 11 - 08-2017
echo.
echo 0  - End
echo.
set /p choice="Select an option (1-0): " 
goto option_%choice%

:option_1
    call :run_sds "SmartApps-Local\SDS\"
    goto menu

:option_2
    call :run_sds "SmartApps-Local\SDS_Temp\"
    goto menu

:option_3
    call :run_sds "SmartApps-Local\SDS_2016\"
    goto menu

:option_4
    call :run_sds "SmartApps-local\SDSK\"
    goto menu

:option_5
    call :run_sds "SmartApps-local\SDSK_FORTUNE\"
    goto menu

:option_6
    call :run_sds "SmartApps-Local\SDSMV\"
    goto menu

:option_7
    call :run_sds "SmartApps-Local\SDSMV_Temp\"
    goto menu

:option_8
    call :run_sds "SmartApps-Local\SDSMV_2016\"
    goto menu

:option_9
    call :run_sds "SmartApps-Local\SDSN_AWS\"
    goto menu

:option_10
    call :run_sds "SmartApps-Local\SDSN_AWS_Temp\"
    goto menu

:option_11
    call :run_sds "SmartApps-local\SDSN_082017_AWS\"
    goto menu

:option_0
    goto end

:run_sds
    pushd "%~1"
    start "" "SDS.exe"
    popd
    goto :EOF

:end
