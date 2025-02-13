<#
.SYNOPSIS
    Chan Powershell Profile
.DESCRIPTION
    Aliases 및 중요 파일경로 관리
.LINK
    https://github.com/chanhi2000/chan-alias
.NOTES
    Author: chanhi2000 | License: CC0
#>

# 사용자 설정 경로
$env:PATH_ALAIS_HOME = $profile

$env:PATH_PUB = "C:\Users\Public\Documents"
$env:PATH_DEV = "C:\development"
$env:PATH_DEV_ITITCLOUD = "$env:PATH_DEV/ititcloud"
$env:PATH_DEV_RUTIL_VM = "$env:PATH_DEV_ITITCLOUD/rutil-vm"
$env:DOCKER_TAG_RUTIL_VM = "ititcloud/rutil-vm"
$env:DOCKER_TAG_RUTIL_VM_API = "ititcloud/rutil-vm-api"
$env:DOCKER_TAG_RUVIL_VM_API_VERSION = "0.2.0-beta2"
$env:DOCKER_TAG_RUTIL_VM_CURRENT = "${env:DOCKER_TAG_RUTIL_VM}:${env:DOCKER_TAG_RUVIL_VM_API_VERSION}"
$env:DOCKER_TAG_RUTIL_VM_API_CURRENT = "${env:DOCKER_TAG_RUTIL_VM_API}:${env:DOCKER_TAG_RUVIL_VM_API_VERSION}"

$env:GIT_LOG_FORMAT_DEFAULT = "%Cred%h%Creset %C(yellow)%d%Crest %s %Cgreen(%cr) %C(bold blue) %an %Creset"

Write-Host @"
===================================================
               ENVIRONMENT VARIABLES
===================================================

[PATH_ALAIS_HOME]: $profile
[PATH_DEV]: $env:PATH_DEV
[DOCKER_TAG_RUTIL_VM_API]: $env:DOCKER_TAG_RUTIL_VM_API
[DOCKER_TAG_RUTIL_VM_API_CURRENT]: $env:DOCKER_TAG_RUTIL_VM_API_CURRENT


===================================================
                     Aliases
=================================================== 

[cdd] - go to development directory
[open] - open directory in Windows Explorer

[g] - git
[gs] - git status
[gss] - git status --short
[ga] - git add ...
[gc] - git commit  ...
[gb] - git branch -vv ...
[gf] - git fetch  ...
[glg] - git log  ...
[gp] - git push  ...
[gpl] - git pull  ...

[cddc] - change directory to $env:PATH_DEV\chanhi200 ....
[cddi] - change directory to $env:PATH_DEV\ititcloud ...

[m3u8Get <SOURCE> <OUTPUT>] - convert m3u8 to media output (*.avi, *.mp4, ...)

[chcl] - choco list
[chci] - choco install -y <PACKAGE_NAME>
[chcu] - choco upgrade -y <PACKAGE_NAME>

[scl] - scoop list
[sci] - scoop install -y <PACKAGE_NAME>
[scu] - scoop update <PACKAGE_NAME>

[scrcpyDefault] - run scrcpy with default settings
[scrcpyRec] - run scrcpy showing touches
[killTestbed] - kill testbed agent using adb
 
 
[alias] - alias configure
"@

# Dracula readline configuration. Requires version 2.0, if you have 1.2 convert to `Set-PSReadlineOption -TokenType`
Set-PSReadlineOption -Color @{
    "Command" = [ConsoleColor]::Green
    "Parameter" = [ConsoleColor]::Gray
    "Operator" = [ConsoleColor]::Magenta
    "Variable" = [ConsoleColor]::White
    "String" = [ConsoleColor]::Yellow
    "Number" = [ConsoleColor]::Blue
    "Type" = [ConsoleColor]::Cyan
    "Comment" = [ConsoleColor]::DarkCyan
}
# Dracula Prompt Configuration
Import-Module posh-git
$GitPromptSettings.DefaultPromptPrefix.Text = "$([char]0x2192) " # arrow unicode symbol
$GitPromptSettings.DefaultPromptPrefix.ForegroundColor = [ConsoleColor]::Green
$GitPromptSettings.DefaultPromptPath.ForegroundColor =[ConsoleColor]::Cyan
$GitPromptSettings.DefaultPromptSuffix.Text = "$([char]0x203A) " # chevron unicode symbol
$GitPromptSettings.DefaultPromptSuffix.ForegroundColor = [ConsoleColor]::Magenta
# Dracula Git Status Configuration
$GitPromptSettings.BeforeStatus.ForegroundColor = [ConsoleColor]::Blue
$GitPromptSettings.BranchColor.ForegroundColor = [ConsoleColor]::Blue
$GitPromptSettings.AfterStatus.ForegroundColor = [ConsoleColor]::Blue


# git
function checkGit() {
    $Null = (git --version)
    if ($lastExitCode -ne "0") { throw "Can't execute 'git' - make sure Git is installed and available" }
}
function g() { git }
function gs() { git status }
function gss() { git status --short }
function ga() 
{ 
    param([string] $target2Add="*")
    git add $target2Add
}
function gc() 
{ 
    param([string] $flags)
    git commit $flags
}
function gb() { git branch -vv }
function gf() 
{ 
    param([string] $targetRepo="origin")
    git fetch $targetRepo
}
function glg() 
{ 
    git log --abbrev-commit --graph --pretty=format:$env:GIT_LOG_FORMAT_DEFAULT
}
function gp() 
{ 
    param(
        [string] $targetRepo="origin", 
        [string] $targetBranch="main"
    )
    git push $targetRepo $targetBranch
}
function gpl() 
{ 
     param(
        [string] $targetRepo="origin", 
        [string] $targetBranch="main"
    )
    git pull $targetRepo $targetBranch
}


# 개발환경 구성
function cdp() { cd $env:PATH_PUB }
function cdd() { cd $env:PATH_DEV }
function open() { 
    param(
        [string] $location="."
    )
    explorer $param
}
function cddc() { cd "$env:PATH_DEV\chanhi2000"; }
function cddi() { cd "$env:PATH_DEV_ITITCLOUD"; }
function m3u8Get() {
    param(
        [string] $source=".",
        [string] $output="."
    )
    ffmpeg -protocol_whitelist https,tls,tcp -allowed_extensions ALL -i $source -bsf:a aac_adtstoasc -c copy $output
}
#
# choco 관련 aliases
#
function chcl() { choco list }
function chci() { 
    param(
        [string] $p=""
    )
    choco install -y $p
}
function chcu {
    param(
        [string] $p=""
    )
    choco upgrade -y $p
}
#
# scoop 관련 aliases
#
function scl() { scoop list }
function sci() {
    param(
        [string] $p=""
    )
    scoop install -y $p
}
function scu {
    param(
        [string] $p=""
    )
    scoop update $p
}
# ADB 및 안드로이드 관련
function scrcpyDefault() { scrcpy -m 1024 --always-on-top }
function scrcpyRec() { scrcpy -m 1024 --always-on-top --show-touches }
function killTestbed() { adb shell am force-stop kr.go.mobile.testbed.iff }

# RutilVM 프로젝트 관련
function di() { docker images }
function drmib { docker rmi $env:DOCKER_TAG_RUTIL_VM_API_CURRENT }
function buildDkb { docker build -t $env:DOCKER_TAG_RUTIL_VM_API_CURRENT $env:PATH_DEV_RUTIL_VM\back }
function saveDkb { docker save -o api.tar $env:DOCKER_TAG_RUTIL_VM_API_CURRENT }

function drmif { docker rmi $env:DOCKER_TAG_RUTIL_VM_CURRENT }
function buildDkf { docker build -t $env:DOCKER_TAG_RUTIL_VM_CURRENT $env:PATH_DEV_RUTIL_VM\front }
function saveDkf { docker save -o web.tar $env:DOCKER_TAG_RUTIL_VM_CURRENT }

function alias() { notepad $profile }

# 후처리
$env:PATH += ";$env:UserProfile\scoop\apps\oh-my-posh\current\bin"
oh-my-posh --init --shell pwsh --config "$env:UserProfile\scoop\apps\oh-my-posh\current\themes\agnoster.omp.json" | Invoke-Expression
fnm env --use-on-cd | Out-String | Invoke-Expression
Import-Module Terminal-Icons
fastfetch
