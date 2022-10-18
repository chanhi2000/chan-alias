@echo off

:: Commands

DOSKEY ls=dir /B $*
DOSKEY sublime=sublime_text $*
    ::sublime_text.exe is name of the executable. By adding a temporary entry to system path, we don't have to write the whole directory anymore.
DOSKEY alias=notepad %USERPROFILE%\alias.cmd
:: ADB 및 안드로이드 관련
DOSKEY scrcpyDefault=scrcpy -m 1024 --always-on-top
DOSKEY KillTestbed=adb shell am force-stop kr.go.mobile.testbed.iff

:: 개발환경 구성
DOSKEY openWspAndroidWeb2=code %WspHomeAndroidWeb2%