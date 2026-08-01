@echo off
    for /f "delims=" %%i in ('where plume') do (
        set "plumePath=%%~dpi"
        goto :found
    )
    :found
    where git >nul 2>nul || (
        echo Quill requires git. Install git and add it to your PATH.
        exit /b 1
    )
    plume -i %~dp0\quill-data\init.plume --future-string --params %* --plumePath=%plumePath%
exit /b %errorlevel%