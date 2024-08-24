@echo off
:menu
cls
echo.
echo  All Servers
echo -------------
echo 1. Shutdown All Servers
echo 2. Restart All Servers
echo.
echo  Main            NAS
echo -----------     -----------
echo 3. Shutdown      5. Shutdown
echo 4. Restart       6. Restart
echo.
echo  HYD-SMS         MPK-SMS
echo -----------     -----------
echo 7. Shutdown      9. Shutdown
echo 8. Restart       10. Restart
echo.
echo 0. Exit
echo.

set /p choice="> "
goto option_%choice%

:option_1
    call :shutdown_server "\\server" "password"
    call :shutdown_server "\\vm-mpk"
    call :shutdown_server "\\vm-hyd"
    call :shutdown_server "\\adil-hyd-nas" "password" 60
    goto :end

:option_2
    call :restart_server "\\server" "password"
    call :shutdown_server "\\vm-mpk"
    call :shutdown_server "\\vm-hyd"
    call :restart_server "\\adil-hyd-nas" "password" 60
    goto :end

:option_3
    call :shutdown_server "\\server" "password"
    goto :end

:option_4
    call :restart_server "\\server" "password"
    goto :end

:option_5
    call :shutdown_server "\\adil-hyd-nas" "password" 60
    goto :end

:option_6
    call :restart_server "\\adil-hyd-nas" "password" 60
    goto :end

:option_7
    call :shutdown_server "\\vm-hyd"
    goto :end

:option_8
    call :restart_server "\\vm-hyd"
    goto :end

:option_9
    call :shutdown_server "\\vm-mpk"
    goto :end

:option_10
    call :restart_server "\\vm-mpk"
    goto :end

:option_0
    goto :end

:shutdown_server
    setlocal
    set "server=%~1"
    set "password=%~2"
    set "delay=%~3"
    if "%password%"=="" net use %server%\admin$ /user:%server%\admin
    if not "%password%"=="" net use %server%\admin$ /user:%server%\administrator "%password%"
    if "%delay%"=="" set "delay=5"
    shutdown /m %server% /s /t %delay% /f
    timeout /T 3 /NOBREAK >nul
    endlocal
    goto :EOF

:restart_server
    setlocal
    set "server=%~1"
    set "password=%~2"
    set "delay=%~3"
    if "%password%"=="" net use %server%\admin$ /user:%server%\admin
    if not "%password%"=="" net use %server%\admin$ /user:%server%\administrator "%password%"
    if "%delay%"=="" set "delay=5"
    shutdown /m %server% /r /t %delay% /f
    timeout /T 3 /NOBREAK >nul
    endlocal
    goto :EOF

:end
cls
echo.
echo Exit
exit
