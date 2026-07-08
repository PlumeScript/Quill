@echo off
    for /f "delims=" %%i in ('where plume') do (
        set "plumePath=%%~dpi"
        goto :found
    )
    :found
    plume -i %~dp0\quill-data\init.plume --future-string --params %* --plumePath=%plumePath%
exit /b %errorlevel%