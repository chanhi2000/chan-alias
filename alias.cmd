@echo off
::
:: 사용방법
::
:: - Win+R 입력 후 regedit실행
:: - 레지스트리에서 \HKEY_CURRENT_USER\SOFTWARE\Microsoft\Command Processor경로 이동
:: - 키 생성 (문자열)
::   - 이름: AutoRun
::   - 값: alias.cmd를 저장한 절대경로 (이 경로가 PATH_ALIAS_HOME값과 같아야 함)
::
:: REG ADD "HKCU\SOFTWARE\Microsoft\Command Processor" /v AutoRun /t REG_SZ /d D:\alias.cmd
::

:: 사용자 설정 경로 (필수)
SET PATH_ALIAS_HOME=%USERPROFILE%
SET ALIAS_FNAME=alias.cmd

SET PATH_PUB=C:\Users\Public\Documents
SET PATH_DEV=C:\development
SET PATH_DEV_ITITCLOUD=%PATH_DEV%\ititcloud
SET PATH_DEV_RUTIL_VM=%PATH_DEV_ITITCLOUD%\rutil-vm
SET DOCKER_TAG_RUTIL_VM=ititcloud/rutil-vm
SET DOCKER_TAG_RUTIL_VM_API=ititcloud/rutil-vm-api
SET DOCKER_TAG_RUVIL_VM_API_VERSION=0.2.0-beta2
SET DOCKER_TAG_RUTIL_VM_CURRENT=%DOCKER_TAG_RUTIL_VM%:%DOCKER_TAG_RUVIL_VM_API_VERSION%
SET DOCKER_TAG_RUTIL_VM_API_CURRENT=%DOCKER_TAG_RUTIL_VM_API%:%DOCKER_TAG_RUVIL_VM_API_VERSION%

:: alias 사용법 설명
ECHO.
ECHO.
ECHO ===================================================
ECHO                ENVIRONMENT VARIABLES
ECHO ===================================================
ECHO.
ECHO. [PATH_ALIAS_HOME]: %PATH_ALIAS_HOME%
ECHO. [PATH_DEV]: %PATH_DEV%
ECHO. [DOCKER_TAG_RUTIL_VM]: %DOCKER_TAG_RUTIL_VM%
ECHO. [DOCKER_TAG_RUTIL_VM_API_CURRENT]: %DOCKER_TAG_RUTIL_VM_API_CURRENT%
ECHO.
ECHO ===================================================
ECHO                      Aliases
ECHO ===================================================
ECHO.
ECHO [cdd] - go to development directory
ECHO [l] - list file(s) in the working directory
ECHO [ls] - list file(s) in the working directory (simple)
ECHO [rm] - delete file(s)
ECHO [pwd] - print working directory
ECHO [clear] - clear console screen
ECHO [open] - open directory in Windows Explorer
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
ECHO [cddc] - change directory to `%PATH_DEV%\chanhi200` ....
ECHO [cddi] - change directory to `%PATH_DEV%\ititcloud`...
ECHO.
ECHO [scrcpyDefault] - run scrcpy with default settings
ECHO [scrcpyRec] - run scrcpy showing touches
ECHO [killTestbed] - kill testbed agent using adb
ECHO.
ECHO [di] - docker images
ECHO [drmi] - docker rmi rutil-vm-api 
ECHO [buildDk] - build rutil-vm-api
ECHO [saveDk] - save rutil-vm-api
ECHO.
ECHO [alias] - alias configure
ECHO.


:: Commands
@DOSKEY cdp=CD %PATH_PUB%
@DOSKEY cdd=CD %PATH_DEV%
@DOSKEY l=DIR /O $*
@DOSKEY ls=DIR /B $*
@DOSKEY rm=DEL /S $*
@DOSKEY pwd=ECHO %%cd%%
@DOSKEY clear=CLS
@DOSKEY open=EXPLORER $*

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
:: @DOSKEY cddc=CD %PATH_DEV%\chanhi2000 && EXPLORER . ^&^& $*
:: @DOSKEY cddi=CD %PATH_DEV%\ititcloud && EXPLORER . ^&^& $*
@DOSKEY cddc=CD %PATH_DEV%\chanhi2000
@DOSKEY cddi=CD %PATH_DEV_ITITCLOUD%
:: @DOSKEY cddi=code %DOCKER_TAG_RUTIL_VM%\onnara01\src\main\assets $*
@DOSKEY m3u8Get=ffmpeg -protocol_whitelist https,tls,tcp -allowed_extensions

:: ADB 및 안드로이드 관련
@DOSKEY scrcpyDefault=scrcpy -m 1024 --always-on-top
@DOSKEY scrcpyRec=scrcpy -m 1024 --always-on-top --show-touches
@DOSKEY KillTestbed=adb shell am force-stop kr.go.mobile.testbed.iff

:: RutilVM 프로젝트 관련
@DOSKEY di=docker images $*
@DOSKEY drmib=docker rmi %DOCKER_TAG_RUTIL_VM_API_CURRENT% $*
@DOSKEY buildDkb=docker build -t %DOCKER_TAG_RUTIL_VM_API_CURRENT% %PATH_DEV_RUTIL_VM%\back
@DOSKEY saveDkb=docker save -o api.tar %DOCKER_TAG_RUTIL_VM_API_CURRENT%

@DOSKEY drmif=docker rmi %DOCKER_TAG_RUTIL_VM_CURRENT% $*
@DOSKEY buildDkf=docker build -t %DOCKER_TAG_RUTIL_VM_CURRENT% %PATH_DEV_RUTIL_VM%\front
@DOSKEY saveDkf=docker save -o web.tar %DOCKER_TAG_RUTIL_VM_CURRENT%

@DOSKEY alias=notepad %PATH_ALIAS_HOME%
