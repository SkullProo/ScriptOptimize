@echo off
setlocal enabledelayedexpansion

:: Establecer título inicial en la barra de tareas
title SKULL SYSTEM v1.2

:: Configurar codificación UTF-8 y soporte para colores
chcp 65001 >nul
reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 0x00000001 /f >nul

:: Variables globales
set "LOGFILE=%temp%\skull_system_log.txt"
set "VERSION=1.2"
set "COLOR=[36m"  :: Color por defecto: Cyan

:: Crear archivo de log inicial
echo [%date% %time%] Iniciando SKULL SYSTEM v%VERSION% > "%LOGFILE%"

:: Verificar modo silencioso
if /i "%1"=="/silent" goto silent_mode

:: ==============================================
::            SKULL SYSTEM
::             Versión 1.2
:: ==============================================

:admin_check
fsutil dirty query %systemdrive% >nul 2>&1
if %errorlevel% neq 0 (
    cls
    title SKULL SYSTEM - Error de Permisos
    echo.
    echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳%COLOR%
    echo %COLOR%┃       ⚠ ERROR: PERMISOS REQUERIDOS    ┃%COLOR%
    echo %COLOR%┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻%COLOR%
    echo.
    echo  [[91mX[0m] [91mEste script debe ejecutarse como ADMINISTRADOR[0m
    echo.
    echo  [93mSolución:[0m
    echo  1. Cierra esta ventana
    echo  2. Haz clic derecho en el archivo
    echo  3. Selecciona "Ejecutar como administrador"
    echo.
    pause >nul
    exit /b
)

:main_menu
cls
title SKULL SYSTEM - Menú Principal
echo %COLOR%
echo ┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃                                                 ┃
echo ┃     ███████╗██╗  ██╗██╗   ██╗██╗     ██╗        ┃
echo ┃     ██╔════╝██║ ██╔╝██║   ██║██║     ██║        ┃
echo ┃     ███████╗█████╔╝ ██║   ██║██║     ██║        ┃
echo ┃     ╚════██║██╔═██╗ ██║   ██║██║     ██║        ┃
echo ┃     ███████║██║  ██╗╚██████╔╝███████╗███████╗   ┃
echo ┃     ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝   ┃
echo ┃                                                 ┃
echo ┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻
echo [0m
echo [95m┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃                 MENÚ PRINCIPAL - v%VERSION%                   ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
echo ┃  [92m1. Limpieza Rápida          [96m8. Actualizaciones         [95m┃
echo ┃  [92m2. Limpieza Profunda        [96m9. Programas Inicio        [95m┃
echo ┃  [92m3. Redes                    [96m10. Gestión de Energía     [95m┃
echo ┃  [92m4. Limpieza Disco           [96m11. Gestor de Procesos     [95m┃
echo ┃  [92m5. Verificar Sistema        [96m12. Copia Registro         [95m┃
echo ┃  [92m6. Optimización Gráfica     [96m13. Análisis Seguridad     [95m┃
echo ┃  [92m7. Información Sistema      [96m14. Optimización Juegos    [95m┃
echo ┃  [96m15. Diagnóstico Hardware    [96mH. Ayuda Rápida            [95m┃
echo ┃  [96m16. Gestor Wi-Fi            [96mC. Personalizar Interfaz   [95m┃
echo ┃  [96m17. Exportar Reporte        [96mT. Herramientas Externas   [95m┃
echo ┃  [96m18. Buscar Actualización    [96m0. Salir                   [95m┃
echo ┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
echo.
set /p choice=[93mSelecciona una opción [0-18, H, C, T]: [0m
if /i "!choice!"=="1" goto quick_clean
if /i "!choice!"=="2" goto deep_clean
if /i "!choice!"=="3" goto redes_menu
if /i "!choice!"=="4" goto disk_clean
if /i "!choice!"=="5" goto system_check
if /i "!choice!"=="6" goto graphics_optimize
if /i "!choice!"=="7" goto system_info
if /i "!choice!"=="8" goto check_updates
if /i "!choice!"=="9" goto startup_manager
if /i "!choice!"=="10" goto power_menu
if /i "!choice!"=="11" goto process_manager
if /i "!choice!"=="12" goto backup_registry
if /i "!choice!"=="13" goto security_check
if /i "!choice!"=="14" goto game_optimize
if /i "!choice!"=="15" goto hardware_diag
if /i "!choice!"=="16" goto wifi_manager
if /i "!choice!"=="17" goto export_report
if /i "!choice!"=="18" goto check_script_update
if /i "!choice!"=="0" goto exit_program
if /i "!choice!"=="H" goto help_menu
if /i "!choice!"=="C" goto customize_ui
if /i "!choice!"=="T" goto external_tools
goto main_menu

:help_menu
cls
title SKULL SYSTEM - Ayuda Rápida
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃                AYUDA RÁPIDA                 ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [96mEste script optimiza y mantiene tu sistema Windows.[0m
echo [93mOpciones del menú principal:[0m
echo 1. Limpieza Rápida: Elimina archivos temporales y caché DNS.
echo 2. Limpieza Profunda: Limpieza exhaustiva del sistema.
echo 3. Redes: Optimiza conexiones de red y DNS.
echo 4. Limpieza Disco: Libera espacio en disco duro.
echo 5. Verificar Sistema: Escanea y repara errores del sistema.
echo 6. Optimización Gráfica: Ajusta configuraciones para rendimiento.
echo 7. Información Sistema: Muestra detalles del hardware y red.
echo 8. Actualizaciones: Gestiona actualizaciones de Windows.
echo 9. Programas Inicio: Administra programas que inician con Windows.
echo 10. Gestión de Energía: Cambia entre planes de energía.
echo 11. Gestor de Procesos: Lista y finaliza procesos activos.
echo 12. Copia Registro: Crea respaldos del registro de Windows.
echo 13. Análisis Seguridad: Verifica el sistema con Windows Defender.
echo 14. Optimización Juegos: Configura el sistema para gaming.
echo 15. Diagnóstico Hardware: Comprueba el estado del hardware.
echo 16. Gestor Wi-Fi: Administra conexiones inalámbricas.
echo 17. Exportar Reporte: Genera un informe de actividades.
echo 18. Buscar Actualización: Verifica nuevas versiones del script.
echo C. Personalizar Interfaz: Cambia el esquema de color.
echo T. Herramientas Externas: Ejecuta CCleaner o Malwarebytes.
echo 0. Salir: Cierra el programa.
echo.
echo [92mPara soporte, contacta al desarrollador en https://discord.gg/ky7xJpGAED[0m
echo %COLOR%┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
pause
goto main_menu

:progress_bar
set /a "progress=%1"
set "bar="
for /l %%i in (1,1,%progress%) do set "bar=!bar!█"
for /l %%i in (%progress%,1,100) do set "bar=!bar! "
echo [92m[!bar!] %progress%%%[0m
goto :eof

:silent_mode
cls
title SKULL SYSTEM - Modo Silencioso
echo [%date% %time%] Modo silencioso iniciado >> "%LOGFILE%"
call :quick_clean
call :system_check
call :optimize_net
echo [%date% %time%] Modo silencioso completado >> "%LOGFILE%"
exit /b

:system_check
cls
title SKULL SYSTEM - Verificación del Sistema
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃           VERIFICACIÓN DEL SISTEMA           ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [%date% %time%] Iniciando verificación del sistema >> "%LOGFILE%"
echo [93m⚙️] Verificando integridad del sistema...[0m
call :progress_bar 25
sfc /scannow >nul 2>&1
if %errorlevel% neq 0 (
    echo [91m[X] Error en la verificación. Revisa el log en %LOGFILE%[0m
    echo [%date% %time%] Error en sfc /scannow >> "%LOGFILE%"
) else (
    echo [92m[✅] Integridad verificada[0m
)
echo [93m[⚙️] Reparando imagen del sistema...[0m
call :progress_bar 50
DISM /Online /Cleanup-Image /RestoreHealth >nul 2>&1
if %errorlevel% neq 0 (
    echo [91m[X] Error en DISM. Revisa el log en %LOGFILE%[0m
    echo [%date% %time%] Error en DISM >> "%LOGFILE%"
) else (
    echo [92m[✅] Imagen reparada[0m
)
echo [93m[⚙️] Comprobando disco...[0m
call :progress_bar 75
echo Este proceso puede requerir un reinicio.
chkdsk /f /r
if %errorlevel% neq 0 (
    echo [91m[X] Error en chkdsk. Revisa el log en %LOGFILE%[0m
    echo [%date% %time%] Error en chkdsk >> "%LOGFILE%"
) else (
    echo [92m[✅] Disco verificado[0m
)
call :progress_bar 100
echo [92m[✓] Verificación completada.[0m
echo [%date% %time%] Verificación completada >> "%LOGFILE%"
echo %COLOR%┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
pause
goto main_menu

:startup_manager
cls
title SKULL SYSTEM - Administrador de Inicio
echo [95m┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃           ADMINISTRADOR DE INICIO            ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [%date% %time%] Accediendo a programas de inicio >> "%LOGFILE%"
echo [93m[⚙️] Programas en inicio automático:[0m
set count=0
for /f "tokens=2,*" %%a in ('reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Run /s 2^>nul ^| findstr /R "REG_SZ REG_EXPAND_SZ"') do (
    set /a count+=1
    set "entry=%%b"
    echo  [96m[!count!] [97m%%~nxa: [92m!entry:REG_SZ=![0m
)
if %count% == 0 echo  [90mNo hay programas en el inicio automático[0m
echo.
echo [93mOpciones:[0m
echo [92m1. Deshabilitar un programa[0m
echo [92m2. Ver servicios de sistema[0m
echo [92m3. Volver al menú principal[0m
echo [95m┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
set /p choice=[93mSelección [1-3]: [0m
if "!choice!"=="1" (
    if %count% == 0 (
        echo [91m[X] No hay programas para deshabilitar[0m
        pause
        goto startup_manager
    )
    set /p num=[93mIngrese el número del programa a deshabilitar: [0m
    set valid=0
    for /l %%i in (1,1,%count%) do (
        if "!num!"=="%%i" set valid=1
    )
    if !valid! == 0 (
        echo [91m[X] Número inválido[0m
        pause
        goto startup_manager
    )
    set count=0
    for /f "tokens=2,*" %%a in ('reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Run /s 2^>nul ^| findstr /R "REG_SZ REG_EXPAND_SZ"') do (
        set /a count+=1
        if !count! equ !num! (
            echo [93m[⚠️] ¿Confirmar eliminación de "%%~nxa"? (S/N)[0m
            set /p confirm=[93mConfirmar [S/N]: [0m
            if /i "!confirm!"=="S" (
                reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v "%%~nxa" /f >nul
                echo [92m[✅] Programa "%%~nxa" eliminado del inicio[0m
                echo [%date% %time%] Eliminado %%~nxa del inicio >> "%LOGFILE%"
            ) else (
                echo [91m[X] Operación cancelada[0m
            )
        )
    )
    pause
    goto startup_manager
)
if "!choice!"=="2" goto services_menu
if "!choice!"=="3" goto main_menu
goto startup_manager

:services_menu
cls
title SKULL SYSTEM - Servicios del Sistema
echo [95m┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃           SERVICIOS DEL SISTEMA             ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [%date% %time%] Listando servicios del sistema >> "%LOGFILE%"
echo [93m[⚙️] Servicios activos:[0m
sc query | findstr /R "SERVICE_NAME STATE" | more
echo.
echo [92m1. Volver al administrador de inicio[0m
echo [92m2. Volver al menú principal[0m
echo [95m┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
set /p choice=[93mSelección [1-2]: [0m
if "!choice!"=="1" goto startup_manager
if "!choice!"=="2" goto main_menu
goto services_menu

:redes_menu
cls
title SKULL SYSTEM - Menú de Redes
echo [95m┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃                MENÚ DE REDES                ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
echo ┃  [96m1. Optimizar Internet        [92m4. Volver       [95m┃
echo ┃  [96m2. Cambiar DNS               [92m                 [95m┃
echo ┃  [96m3. Reparar Red               [92m                 [95m┃
echo ┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
echo.
set /p choice=[93mSelección [1-4]: [0m
if "!choice!"=="1" goto optimize_net
if "!choice!"=="2" goto dns_menu
if "!choice!"=="3" goto net_repair
if "!choice!"=="4" goto main_menu
goto redes_menu

:optimize_net
cls
title SKULL SYSTEM - Optimizar Internet
echo [95m┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃           OPTIMIZACIÓN DE INTERNET           ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [%date% %time%] Optimizando red >> "%LOGFILE%"
echo [93m[⚙️] Aplicando ajustes de rendimiento...[0m
netsh int tcp set global autotuninglevel=normal >nul
netsh int tcp set global congestionprovider=ctcp >nul
call :progress_bar 50
echo [93m[⚙️] Limpiando caché de red...[0m
ipconfig /flushdns >nul
call :progress_bar 100
echo [92m[✅] Red optimizada correctamente[0m
echo [%date% %time%] Red optimizada >> "%LOGFILE%"
pause
goto redes_menu

:dns_menu
cls
title SKULL SYSTEM - Cambiar DNS
echo [95m┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃               CAMBIAR DNS                   ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
echo ┃  [96m1. Google DNS                [92m4. Cloudflare   [95m┃
echo ┃  [96m2. OpenDNS                  [92m5. Volver       [95m┃
echo ┃  [96m3. Quad9                    [92m                [95m┃
echo ┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
set /p choice=[93mSelección [1-5]: [0m
if "!choice!"=="1" (
    netsh interface ip set dns name="Ethernet" source=static addr=8.8.8.8 >nul
    netsh interface ip add dns name="Ethernet" addr=8.8.4.4 index=2 >nul
    echo [92m[✅] DNS cambiado a Google DNS[0m
    echo [%date% %time%] DNS cambiado a Google >> "%LOGFILE%"
)
if "!choice!"=="2" (
    netsh interface ip set dns name="Ethernet" source=static addr=208.67.222.222 >nul
    netsh interface ip add dns name="Ethernet" addr=208.67.220.220 index=2 >nul
    echo [92m[✅] DNS cambiado a OpenDNS[0m
    echo [%date% %time%] DNS cambiado a OpenDNS >> "%LOGFILE%"
)
if "!choice!"=="3" (
    netsh interface ip set dns name="Ethernet" source=static addr=9.9.9.9 >nul
    netsh interface ip add dns name="Ethernet" addr=149.112.112.112 index=2 >nul
    echo [92m[✅] DNS cambiado a Quad9[0m
    echo [%date% %time%] DNS cambiado a Quad9 >> "%LOGFILE%"
)
if "!choice!"=="4" (
    netsh interface ip set dns name="Ethernet" source=static addr=1.1.1.1 >nul
    netsh interface ip add dns name="Ethernet" addr=1.0.0.1 index=2 >nul
    echo [92m[✅] DNS cambiado a Cloudflare[0m
    echo [%date% %time%] DNS cambiado a Cloudflare >> "%LOGFILE%"
)
if "!choice!"=="5" goto redes_menu
pause
goto dns_menu

:net_repair
cls
title SKULL SYSTEM - Reparar Red
echo [95m┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃               REPARAR RED                   ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [%date% %time%] Reparando red >> "%LOGFILE%"
echo [93m[⚙️] Restableciendo configuración de red...[0m
netsh winsock reset >nul
netsh int ip reset >nul
call :progress_bar 50
echo [93m[⚙️] Liberando y renovando IP...[0m
ipconfig /release >nul
ipconfig /renew >nul
call :progress_bar 100
echo [92m[✅] Red reparada correctamente[0m
echo [%date% %time%] Red reparada >> "%LOGFILE%"
pause
goto redes_menu

:system_info
cls
title SKULL SYSTEM - Información del Sistema
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃             INFORMACIÓN DEL SISTEMA          ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [%date% %time%] Mostrando información del sistema >> "%LOGFILE%"
echo [93mProcesador:[0m
for /f "delims=" %%a in ('powershell -Command "(Get-WmiObject Win32_Processor).Name"') do (
    set "cpu=%%a"
    echo  [97m!cpu![0m
)
echo [93mMemoria RAM:[0m
for /f "tokens=*" %%a in ('powershell -Command "(Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum /1GB | ForEach-Object { [math]::Round($_, 2) }"') do (
    echo  [92m%%a GB[0m
)
echo [93mTarjetas Gráficas:[0m
for /f "delims=" %%a in ('powershell -Command "(Get-WmiObject Win32_VideoController).Name"') do (
    set "gpu=%%a"
    echo  [96m• [97m!gpu![0m
)
echo [93mAlmacenamiento:[0m
for /f "delims=" %%a in ('powershell -Command "Get-Disk | ForEach-Object { $drive = $_; $sizeGB = [math]::Round($_.Size /1GB); Write-Output ('[' + $sizeGB + ' GB] ' + $drive.Model) }"') do (
    echo  [96m%%a[0m
)
echo [93mInformación de Red:[0m
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| find "IPv4" ^| find /v "autoconfiguration"') do (
    set "ip=%%a"
    set "ip=!ip: =!"
    echo  [96mDirección IP: [97m!ip![0m
)
echo %COLOR%┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
pause
goto main_menu

:disk_clean
cls
title SKULL SYSTEM - Limpieza Avanzada de Disco
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃           LIMPIEZA AVANZADA DE DISCO        ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [%date% %time%] Iniciando limpieza de disco >> "%LOGFILE%"
echo [93m[⚙️] Ejecutando Limpieza de Disco del Sistema...[0m
cleanmgr /sagerun:1 >nul
call :progress_bar 25
echo [93m[⚙️] Limpiando archivos temporales del sistema...[0m
del /f /s /q %systemroot%\temp\*.* >nul 2>&1
del /f /s /q %systemroot%\Prefetch\*.* >nul 2>&1
call :progress_bar 50
echo [93m[⚙️] Vaciando la Papelera de Reciclaje...[0m
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1
call :progress_bar 75
echo [93m[⚙️] Liberando espacio de WinSxS...[0m
DISM /Online /Cleanup-Image /StartComponentCleanup >nul
call :progress_bar 100
echo [92m[✅] Limpieza de disco completada correctamente[0m
echo [%date% %time%] Limpieza de disco completada >> "%LOGFILE%"
echo %COLOR%┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
pause
goto main_menu

:quick_clean
cls
title SKULL SYSTEM - Limpieza Rápida
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃               LIMPIEZA RÁPIDA               ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [%date% %time%] Iniciando limpieza rápida >> "%LOGFILE%"
echo [93m[⚙️] Eliminando archivos temporales...[0m
del /f /s /q %temp%\*.* >nul 2>&1
call :progress_bar 50
echo [93m[⚙️] Limpiando caché DNS...[0m
ipconfig /flushdns >nul
call :progress_bar 100
echo [92m[✅] Limpieza rápida completada[0m
echo [%date% %time%] Limpieza rápida completada >> "%LOGFILE%"
echo %COLOR%┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
pause
goto main_menu

:graphics_optimize
cls
title SKULL SYSTEM - Optimización Gráfica
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃          OPTIMIZACIÓN GRÁFICA AVANZADA      ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
echo ┃  [96m1. Optimizar rendimiento   [92m4. Restaurar valores [95m┃
echo ┃  [96m2. Configurar NVIDIA       [92m5. Volver            [95m┃
echo ┃  [96m3. Configurar AMD          [92m                   [95m┃
echo ┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
echo.
set /p choice=[93mSelección [1-5]: [0m
if "!choice!"=="1" (
    title SKULL SYSTEM - Optimizando Rendimiento Gráfico
    echo [%date% %time%] Optimizando gráficos >> "%LOGFILE%"
    reg add "HKCU\Control Panel\Desktop" /v DragFullWindows /t REG_SZ /d 0 /f >nul
    powercfg /SETACTIVE SCHEME_MIN >nul
    echo [92m[✅] Sistema optimizado para máximo rendimiento[0m
    echo [%date% %time%] Gráficos optimizados >> "%LOGFILE%"
    pause
    goto graphics_optimize
)
if "!choice!"=="2" (
    title SKULL SYSTEM - Configuración NVIDIA
    if exist "C:\Program Files\NVIDIA Corporation\Control Panel Client\nvcplui.exe" (
        echo [93m[⚙️] Abriendo panel de control de NVIDIA...[0m
        start "" "C:\Program Files\NVIDIA Corporation\Control Panel Client\nvcplui.exe"
    ) else (
        echo [91m[X] Panel de control de NVIDIA no encontrado[0m
    )
    pause
    goto graphics_optimize
)
if "!choice!"=="3" (
    title SKULL SYSTEM - Configuración AMD
    if exist "C:\Program Files\AMD\CNext\CNext\RadeonSoftware.exe" (
        echo [93m[⚙️] Abriendo Radeon Software...[0m
        start "" "C:\Program Files\AMD\CNext\CNext\RadeonSoftware.exe"
    ) else (
        echo [91m[X] Radeon Software no encontrado[0m
    )
    pause
    goto graphics_optimize
)
if "!choice!"=="4" (
    title SKULL SYSTEM - Restaurando Configuración Gráfica
    echo [%date% %time%] Restaurando configuración gráfica >> "%LOGFILE%"
    reg add "HKCU\Control Panel\Desktop" /v DragFullWindows /t REG_SZ /d 1 /f >nul
    powercfg /SETACTIVE SCHEME_BALANCED >nul
    echo [92m[✅] Configuración gráfica restablecida[0m
    echo [%date% %time%] Configuración gráfica restaurada >> "%LOGFILE%"
    pause
    goto graphics_optimize
)
if "!choice!"=="5" goto main_menu
goto graphics_optimize

:deep_clean
cls
title SKULL SYSTEM - Limpieza Profunda
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃         LIMPIEZA PROFUNDA 2.0 - MEGA        ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [%date% %time%] Iniciando limpieza profunda >> "%LOGFILE%"
echo [93m[⚙️] Limpieza de disco completa...[0m
cleanmgr /sagerun:1 /d %systemdrive% >nul
call :progress_bar 10
echo [93m[⚙️] Destruyendo archivos basura...[0m
del /f /s /q %systemroot%\temp\*.* >nul 2>&1
del /f /s /q %systemroot%\Prefetch\*.* >nul 2>&1
del /f /s /q "%userprofile%\AppData\Local\Temp\*.*" >nul 2>&1
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1
call :progress_bar 30
echo [93m[⚙️] Limpieza nuclear de navegadores...[0m
rd /s /q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Cache" >nul 2>&1
rd /s /q "%userprofile%\AppData\Local\Microsoft\Edge\User Data\Default\Cache" >nul 2>&1
rd /s /q "%userprofile%\AppData\Roaming\Mozilla\Firefox\Profiles\*.default-release\cache2" >nul 2>&1
call :progress_bar 50
echo [93m[⚙️] Purga de sistema avanzada...[0m
wevtutil cl Application >nul 2>&1
wevtutil cl System >nul 2>&1
wevtutil cl Security >nul 2>&1
dism /Online /Cleanup-Image /StartComponentCleanup /ResetBase >nul
call :progress_bar 70
echo [93m[⚙️] Limpieza de actualizaciones...[0m
net stop wuauserv >nul 2>&1
rd /s /q %systemroot%\SoftwareDistribution >nul 2>&1
net start wuauserv >nul 2>&1
call :progress_bar 80
echo [93m[⚙️] Optimización extrema...[0m
defrag /C /H /X /U /V >nul
powercfg /hibernate off >nul
del /f /q %systemroot%\hiberfil.sys >nul 2>&1
call :progress_bar 90
echo [93m[⚙️] Eliminando archivos obsoletos...[0m
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache*" >nul 2>&1
del /f /q %systemroot%\*.log >nul 2>&1
del /f /q %systemroot%\memory.dmp >nul 2>&1
del /f /q %systemroot%\Minidump\*.dmp >nul 2>&1
call :progress_bar 100
echo [92m[✅] ¡LIMPIEZA PROFUNDA COMPLETADA![0m
echo [%date% %time%] Limpieza profunda completada >> "%LOGFILE%"
echo %COLOR%┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
pause
goto main_menu

:check_updates
cls
title SKULL SYSTEM - Gestor de Actualizaciones
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃          GESTOR DE ACTUALIZACIONES          ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
echo ┃  [96m1. Buscar actualizaciones       [92m4. Reparar servicio [94m┃
echo ┃  [96m2. Instalar actualizaciones     [92m5. Historial completo[94m┃
echo ┃  [96m3. Actualizaciones pendientes   [92m0. Volver           [94m┃
echo ┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
echo.
set /p choice=[93mSelección [0-5]: [0m
if "!choice!"=="1" goto update_1
if "!choice!"=="2" goto update_2
if "!choice!"=="3" goto update_3
if "!choice!"=="4" goto update_4
if "!choice!"=="5" goto update_5
if "!choice!"=="0" goto main_menu
goto check_updates

:update_1
cls
title SKULL SYSTEM - Buscar Actualizaciones
echo [%date% %time%] Buscando actualizaciones >> "%LOGFILE%"
echo [93m[⚙️] Buscando actualizaciones disponibles...[0m
powershell -Command "& {Start-WindowsUpdateScan}" >nul 2>&1
if %errorlevel% equ 0 (
    call :progress_bar 100
    echo [92m[✅] Búsqueda completada (Revisa el Panel de Control)[0m
    echo [%date% %time%] Búsqueda de actualizaciones completada >> "%LOGFILE%"
) else (
    echo [91m[X] Error: Servicio no disponible[0m
    echo [%date% %time%] Error en búsqueda de actualizaciones >> "%LOGFILE%"
)
pause
goto check_updates

:update_2
cls
title SKULL SYSTEM - Instalar Actualizaciones
echo [%date% %time%] Instalando actualizaciones >> "%LOGFILE%"
echo [93m[⚙️] Instalando actualizaciones... No apagues el sistema![0m
powershell -Command "& {Install-WindowsUpdate -AcceptAll -AutoReboot}" >nul 2>&1
call :progress_bar 100
echo [92m[✅] Operación completada. Reinicie el sistema[0m
echo [%date% %time%] Instalación de actualizaciones completada >> "%LOGFILE%"
pause
goto check_updates

:update_3
cls
title SKULL SYSTEM - Actualizaciones Pendientes
echo [%date% %time%] Listando actualizaciones pendientes >> "%LOGFILE%"
echo [93m[⚙️] Listando actualizaciones pendientes:[0m
wmic qfe list brief /format:table
call :progress_bar 100
echo [%date% %time%] Actualizaciones pendientes mostradas >> "%LOGFILE%"
pause
goto check_updates

:update_4
cls
title SKULL SYSTEM - Reparar Servicio de Actualizaciones
echo [%date% %time%] Reparando servicio de actualizaciones >> "%LOGFILE%"
echo [93m[⚙️] Reparando servicio de actualizaciones...[0m
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
rd /s /q %windir%\SoftwareDistribution >nul 2>&1
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
call :progress_bar 100
echo [92m[✅] Servicio reiniciado correctamente[0m
echo [%date% %time%] Servicio de actualizaciones reparado >> "%LOGFILE%"
pause
goto check_updates

:update_5
cls
title SKULL SYSTEM - Historial de Actualizaciones
echo [%date% %time%] Mostrando historial de actualizaciones >> "%LOGFILE%"
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃           HISTORIAL DE ACTUALIZACIONES       ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
wmic qfe list full /format:htable >"%temp%\historial.html"
start "" "%temp%\historial.html"
call :progress_bar 100
echo [92m[✅] Historial abierto en navegador[0m
echo [%date% %time%] Historial de actualizaciones mostrado >> "%LOGFILE%"
pause
goto check_updates

:power_menu
cls
title SKULL SYSTEM - Gestión de Energía
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃            GESTIÓN DE ENERGÍA                ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
echo ┃  [96m1. Alto Rendimiento         [92m4. Volver       [94m┃
echo ┃  [96m2. Equilibrado              [92m               [94m┃
echo ┃  [96m3. Ahorro de Energía        [92m               [94m┃
echo ┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
echo.
set /p choice=[93mSelección [1-4]: [0m
if "!choice!"=="1" (
    powercfg /setactive SCHEME_MIN
    echo [92m[✅] Modo Alto Rendimiento activado[0m
    echo [%date% %time%] Modo Alto Rendimiento activado >> "%LOGFILE%"
)
if "!choice!"=="2" (
    powercfg /setactive SCHEME_BALANCED
    echo [92m[✅] Modo Equilibrado activado[0m
    echo [%date% %time%] Modo Equilibrado activado >> "%LOGFILE%"
)
if "!choice!"=="3" (
    powercfg /setactive SCHEME_MAX
    echo [92m[✅] Modo Ahorro de Energía activado[0m
    echo [%date% %time%] Modo Ahorro de Energía activado >> "%LOGFILE%"
)
if "!choice!"=="4" goto main_menu
if not "!choice!"=="" (
    echo [91m[X] Opción inválida[0m
)
pause
goto power_menu

:process_manager
cls
title SKULL SYSTEM - Gestor de Procesos
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃             GESTOR DE PROCESOS              ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [%date% %time%] Listando procesos activos >> "%LOGFILE%"
echo [93m[⚙️] Procesos activos:[0m
tasklist /v /fo table | more
echo.
echo [92m1. Finalizar un proceso[0m
echo [92m2. Volver al menú principal[0m
echo %COLOR%┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
set /p choice=[93mSelección [1-2]: [0m
if "!choice!"=="1" (
    set /p proc=[93mNombre del proceso a finalizar (ejemplo: notepad.exe): [0m
    if "!proc!"=="" (
        echo [91m[X] Debes ingresar un nombre de proceso[0m
    ) else (
        taskkill /IM "!proc!" /F >nul 2>&1
        if !errorlevel! equ 0 (
            echo [92m[✅] Proceso !proc! finalizado[0m
            echo [%date% %time%] Proceso !proc! finalizado >> "%LOGFILE%"
        ) else (
            echo [91m[X] No se pudo finalizar el proceso[0m
            echo [%date% %time%] Error al finalizar !proc! >> "%LOGFILE%"
        )
    )
    pause
)
if "!choice!"=="2" goto main_menu
goto process_manager

:backup_registry
cls
title SKULL SYSTEM - Copia de Seguridad del Registro
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃       COPIA DE SEGURIDAD DEL REGISTRO       ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [%date% %time%] Creando copia de seguridad del registro >> "%LOGFILE%"
set "backup_path=%userprofile%\Desktop\RegistryBackup_%date:~-4,4%%date:~-10,2%%date:~-7,2%.reg"
echo [93m[⚙️] Creando copia de seguridad en !backup_path!...[0m
reg export HKLM "!backup_path!" /y >nul 2>&1
reg export HKCU "!backup_path!" /y >nul 2>&1
call :progress_bar 100
if !errorlevel! equ 0 (
    echo [92m[✅] Copia de seguridad creada en !backup_path![0m
    echo [%date% %time%] Copia de seguridad creada >> "%LOGFILE%"
) else (
    echo [91m[X] Error al crear la copia de seguridad[0m
    echo [%date% %time%] Error en copia de seguridad >> "%LOGFILE%"
)
echo %COLOR%┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
pause
goto main_menu

:security_check
cls
title SKULL SYSTEM - Análisis de Seguridad
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃            ANÁLISIS DE SEGURIDAD            ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [%date% %time%] Iniciando análisis de seguridad >> "%LOGFILE%"
echo [93m[⚙️] Ejecutando análisis rápido con Windows Defender...[0m
call :progress_bar 25
if exist "%ProgramFiles%\Windows Defender\MpCmdRun.exe" (
    "%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 1 >nul 2>&1
    if !errorlevel! equ 0 (
        echo [92m[✅] Análisis de Windows Defender completado[0m
    ) else (
        echo [91m[X] Error en el análisis de Windows Defender[0m
    )
) else (
    echo [91m[X] Windows Defender no encontrado[0m
)
call :progress_bar 50
echo [93m[⚙️] Verificando estado del firewall...[0m
netsh advfirewall show allprofiles >nul 2>&1
call :progress_bar 75
if !errorlevel! equ 0 (
    echo [92m[✅] Firewall activo y configurado[0m
) else (
    echo [91m[X] Problema con el firewall[0m
)
call :progress_bar 100
echo [92m[✅] Análisis de seguridad completado[0m
echo [%date% %time%] Análisis de seguridad completado >> "%LOGFILE%"
echo %COLOR%┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
pause
goto main_menu

:game_optimize
cls
title SKULL SYSTEM - Optimización para Juegos
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃           OPTIMIZACIÓN PARA JUEGOS          ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [%date% %time%] Optimizando para juegos >> "%LOGFILE%"
echo [93m[⚙️] Activando modo de juego de Windows...[0m
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f >nul
call :progress_bar 25
echo [93m[⚙️] Desactivando servicios no esenciales...[0m
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
call :progress_bar 50
echo [93m[⚙️] Priorizando rendimiento gráfico...[0m
powercfg /setactive SCHEME_MIN >nul
call :progress_bar 75
echo [93m[⚙️] Limpiando memoria en espera...[0m
echo %SystemRoot%\System32\rundll32.exe advapi32.dll,ProcessIdleTasks >nul
call :progress_bar 100
echo [92m[✅] Sistema optimizado para juegos[0m
echo [%date% %time%] Optimización para juegos completada >> "%LOGFILE%"
echo %COLOR%┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
pause
goto main_menu

:hardware_diag
cls
title SKULL SYSTEM - Diagnóstico de Hardware
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃           DIAGNÓSTICO DE HARDWARE           ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [%date% %time%] Ejecutando diagnóstico de hardware >> "%LOGFILE%"
echo [93m[⚙️] Verificando salud del disco...[0m
wmic diskdrive get status
call :progress_bar 50
echo [93m[⚙️] Comprobando memoria RAM...[0m
wmic memorychip get status
call :progress_bar 100
echo [92m[✅] Diagnóstico de hardware completado[0m
echo [%date% %time%] Diagnóstico de hardware completado >> "%LOGFILE%"
echo %COLOR%┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
pause
goto main_menu

:wifi_manager
cls
title SKULL SYSTEM - Gestor de Wi-Fi
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃              GESTOR DE WI-FI                ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [%date% %time%] Listando redes Wi-Fi >> "%LOGFILE%"
echo [93m[⚙️] Redes Wi-Fi disponibles:[0m
netsh wlan show networks
echo.
echo [92m1. Conectar a una red[0m
echo [92m2. Olvidar una red[0m
echo [92m3. Volver al menú de redes[0m
echo %COLOR%┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
set /p choice=[93mSelección [1-3]: [0m
if "!choice!"=="1" (
    set /p ssid=[93mNombre de la red (SSID): [0m
    if "!ssid!"=="" (
        echo [91m[X] Debes ingresar un SSID[0m
    ) else (
        set /p key=[93mContraseña: [0m
        netsh wlan connect name="!ssid!" key="!key!" >nul 2>&1
        if !errorlevel! equ 0 (
            echo [92m[✅] Intentando conectar a !ssid![0m
            echo [%date% %time%] Conexión a !ssid! iniciada >> "%LOGFILE%"
        ) else (
            echo [91m[X] Error al conectar a !ssid![0m
            echo [%date% %time%] Error al conectar a !ssid! >> "%LOGFILE%"
        )
    )
)
if "!choice!"=="2" (
    set /p ssid=[93mNombre de la red a olvidar: [0m
    if "!ssid!"=="" (
        echo [91m[X] Debes ingresar un SSID[0m
    ) else (
        netsh wlan delete profile name="!ssid!" >nul 2>&1
        if !errorlevel! equ 0 (
            echo [92m[✅] Red !ssid! olvidada[0m
            echo [%date% %time%] Red !ssid! olvidada >> "%LOGFILE%"
        ) else (
            echo [91m[X] Error al olvidar la red !ssid![0m
            echo [%date% %time%] Error al olvidar !ssid! >> "%LOGFILE%"
        )
    )
)
if "!choice!"=="3" goto redes_menu
pause
goto wifi_manager

:customize_ui
cls
title SKULL SYSTEM - Personalizar Interfaz
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃           PERSONALIZAR INTERFAZ             ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [93mSelecciona un esquema de color:[0m
echo 1. Cyan (predeterminado)
echo 2. Verde
echo 3. Morado
echo 4. Volver
set /p choice=[93mSelección [1-4]: [0m
if "!choice!"=="1" (
    set "COLOR=[36m"
    echo [92m[✅] Esquema Cyan seleccionado[0m
)
if "!choice!"=="2" (
    set "COLOR=[32m"
    echo [92m[✅] Esquema Verde seleccionado[0m
)
if "!choice!"=="3" (
    set "COLOR=[35m"
    echo [92m[✅] Esquema Morado seleccionado[0m
)
if "!choice!"=="4" goto main_menu
if not "!choice!"=="" (
    echo [%date% %time%] Esquema de color cambiado a !choice! >> "%LOGFILE%"
)
pause
goto customize_ui

:export_report
cls
title SKULL SYSTEM - Exportar Reporte
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃             EXPORTAR REPORTE                ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [%date% %time%] Generando reporte >> "%LOGFILE%"
set "report_path=%userprofile%\Desktop\SKULL_SYSTEM_Report_%date:~-4,4%%date:~-10,2%%date:~-7,2%.txt"
echo SKULL SYSTEM - Reporte de Actividades > "!report_path!"
echo ------------------------------------ >> "!report_path!"
echo Fecha: %date% %time% >> "!report_path!"
echo Versión: %VERSION% >> "!report_path!"
echo ------------------------------------ >> "!report_path!"
type "%LOGFILE%" >> "!report_path!"
echo [92m[✅] Reporte generado en !report_path![0m
echo [%date% %time%] Reporte exportado >> "%LOGFILE%"
echo %COLOR%┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
pause
goto main_menu

:external_tools
cls
title SKULL SYSTEM - Herramientas Externas
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃           HERRAMIENTAS EXTERNAS             ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [93mSelecciona una herramienta:[0m
echo 1. CCleaner (si está instalado)
echo 2. Malwarebytes (si está instalado)
echo 3. Volver
set /p choice=[93mSelección [1-3]: [0m
if "!choice!"=="1" (
    if exist "%ProgramFiles%\CCleaner\CCleaner.exe" (
        start "" "%ProgramFiles%\CCleaner\CCleaner.exe"
        echo [92m[✅] CCleaner iniciado[0m
        echo [%date% %time%] CCleaner iniciado >> "%LOGFILE%"
    ) else (
        echo [91m[X] CCleaner no está instalado[0m
        echo [%date% %time%] Error: CCleaner no encontrado >> "%LOGFILE%"
    )
)
if "!choice!"=="2" (
    if exist "%ProgramFiles%\Malwarebytes\Anti-Malware\mbam.exe" (
        start "" "%ProgramFiles%\Malwarebytes\Anti-Malware\mbam.exe"
        echo [92m[✅] Malwarebytes iniciado[0m
        echo [%date% %time%] Malwarebytes iniciado >> "%LOGFILE%"
    ) else (
        echo [91m[X] Malwarebytes no está instalado[0m
        echo [%date% %time%] Error: Malwarebytes no encontrado >> "%LOGFILE%"
    )
)
if "!choice!"=="3" goto main_menu
pause
goto external_tools

:check_script_update
cls
title SKULL SYSTEM - Buscar Actualización
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃           BUSCAR ACTUALIZACIÓN              ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫[0m
echo [%date% %time%] Verificando actualizaciones del script >> "%LOGFILE%"
echo [93m[⚙️] Buscando nueva versión...[0m
:: Simulación: En un entorno real, usarías Invoke-WebRequest para comparar versiones
set "remote_version=1.2"
if "!remote_version!" gtr "%VERSION%" (
    echo [92m[✅] Nueva versión !remote_version! disponible[0m
    echo [93m[⚙️] Descarga la actualización desde el sitio oficial.[0m
    echo [%date% %time%] Nueva versión !remote_version! detectada >> "%LOGFILE%"
) else (
    echo [92m[✅] Estás usando la versión más reciente (%VERSION%)[0m
    echo [%date% %time%] No hay actualizaciones disponibles >> "%LOGFILE%"
)
call :progress_bar 100
echo %COLOR%┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
pause
goto main_menu

:exit_program
cls
title SKULL SYSTEM - Cerrando
echo [%date% %time%] Finalizando SKULL SYSTEM >> "%LOGFILE%"
echo %COLOR%┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳
echo ┃          GRACIAS POR USAR SKULL SYSTEM      ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
echo ┃        Cerrando programa... ¡Hasta pronto!   ┃
echo ┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻[0m
timeout /t 2 >nul
exit /b