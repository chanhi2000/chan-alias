@echo off
::
:: 사용방법
::
:: - Win+R 입력 후 regedit실행
:: - 레지스트리에서 \HKEY_CURRENT_USER\SOFTWARE\Microsoft\Command Processor경로 이동
:: - 키 생성 (문자열)
::   - 이름: AutoRun
::   - 값: alias.cmd를 저장한 절대경로 (이 경로가 PATH_ALAIS_HOME값과 같아야 함)
::
:: REG ADD "HKCU\SOFTWARE\Microsoft\Command Processor" /v AutoRun /t REG_SZ /d D:\alias.cmd
::

:: 사용자 설정 경로 (필수)
REM SET PATh_ALAIS_HOME=%USERPROFILE%
SET ALIAS_FNAME=alias.cmd
SET PATH_ALAIS_HOME=D:\%ALIAS_FNAME%
SET PATH_ONNARA_ANDROID=D:\development\android\OnnaraMobileAndroid

:: alias 사용법 설명
ECHO.
ECHO.
ECHO ===================================================
ECHO                ENVIRONMENT VARIABLES
ECHO ===================================================
ECHO.
ECHO. [PATH_ALAIS_HOME]: %PATH_ALAIS_HOME%
ECHO. [PATH_ONNARA_ANDROID]: %PATH_ONNARA_ANDROID%
ECHO.
ECHO ===================================================
ECHO                      Aliases
ECHO ===================================================
ECHO.
ECHO [l] - list file(s) in the working directory
ECHO [ls] - list file(s) in the working directory (simple)
ECHO [pwd] - print working directory
ECHO [clear] - clear console screen
ECHO.
ECHO [g] - git
ECHO [gs] - git status
ECHO [gss] - git status --short
ECHO [ga] - git add ...
ECHO [gc] - git commit  ...
ECHO [gb] - git branch -vv ...
ECHO [gco] - git checkout ...
ECHO [gf] - git fetch  ...
ECHO [glg] - git log  ...
ECHO [gt] - git tag ...
ECHO [gp] - git push  ...
ECHO [gpl] - git pull  ...
ECHO. 
ECHO. 
ECHO [cdWHA] - change directory to OnnaraMobileAndroid ...
ECHO [codeWHAW1] - open VSCode for `onnara01\src\main\assets`
ECHO [codeWHAW2] - open VSCode for `onnara02\src\main\assets` 
ECHO.
ECHO. 
ECHO [scrcpyDefault] - run scrcpy with default settings
ECHO [scrcpyRec] - run scrcpy showing touches
ECHO [killTestbed] - kill testbed agent using adb
ECHO. 
ECHO. 
ECHO [alias] - alias configure
ECHO. 
ECHO.


:: Commands
@DOSKEY l=dir /O $*
@DOSKEY ls=dir /B $*
@DOSKEY pwd=echo %%cd%%
@DOSKEY clear=cls

:: git
@DOSKEY g=git $*
@DOSKEY gs=git status $*
@DOSKEY gss=git status --short $*
@DOSKEY ga=git add $*
@DOSKEY gc=git commit $*
@DOSKEY gb=git branch -vv $*
@DOSKEY gco=git checkout $*
@DOSKEY gf=git fetch $*
@DOSKEY glg=git log --abbrev-commit --graph --pretty=format:"%%Cred%%h%%Creset %%C(yellow)%%d%%Crest %%s %%Cgreen(%%cr) %%C(bold blue) %%an %%Creset" $*
@DOSKEY gt=git tag $*
@DOSKEY gp=git push $*
@DOSKEY gpl=git pull $*


:: 개발환경 구성
@DOSKEY cdWHA=D: ^&^& CD %PATH_ONNARA_ANDROID% $*
@DOSKEY codeWHAW1=code %PATH_ONNARA_ANDROID%\onnara01\src\main\assets $*
@DOSKEY codeWHAW2=code %PATH_ONNARA_ANDROID%\onnara02\src\main\assets $*


:: ADB 및 안드로이드 관련
@DOSKEY scrcpyDefault=scrcpy -m 1024 --always-on-top
@DOSKEY scrcpyRec=scrcpy -m 1024 --always-on-top --show-touches
@DOSKEY KillTestbed=adb shell am force-stop kr.go.mobile.testbed.iff


@DOSKEY alias=notepad %PATH_ALAIS_HOME%
