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
$env:PATH_ONNARA_ANDROID = "D:\development\android\OnnaraMobileAndroid"
$env:GIT_LOG_FORMAT_DEFAULT = "%Cred%h%Creset %C(yellow)%d%Crest %s %Cgreen(%cr) %C(bold blue) %an %Creset"

Write-Host @"
===================================================
               ENVIRONMENT VARIABLES
===================================================

 [PATH_ONNARA_ANDROID]: $env:PATH_ONNARA_ANDROID
 [GIT_LOG_FORMAT_DEFAULT]: $env:GIT_LOG_FORMAT_DEFAULT

===================================================
                     Aliases
===================================================

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
 
 
[cdWHA] - change directory to OnnaraMobileAndroid ...
[codeHWAW1] - open VSCode for `onnara01\src\main\assets`
[codeHWAW2] - open VSCode for `onnara02\src\main\assets` 

 
[scrcpyDefault] - run scrcpy with default settings
[scrcpyRec] - run scrcpy showing touches
[killTestbed] - kill testbed agent using adb
 
 
[alias] - alias configure
"@

# git
function checkGit() {
    $Null = (git --version)
	if ($lastExitCode -ne "0") { throw "Can't execute 'git' - make sure Git is installed and available" }
}
function g() { git }
function gs() { git status }
function gss() { git status --short }
function ga() { 
    param([string] $target2Add="*")
    git add $target2Add
}
function gc() { 
    param([string] $flags)
    git commit $flags
}
function gb() { git branch -vv }
function gf() { 
    param([string] $targetRepo="origin")
    git fetch $targetRepo
}
function glg() { 
    git log --abbrev-commit --graph --pretty=format:$env:GIT_LOG_FORMAT_DEFAULT
}
function gp() { 
    param(
        [string] $targetRepo="origin", 
        [string] $targetBranch="main"
    )
    git push $targetRepo $targetBranch
}
function gpl() { 
     param(
        [string] $targetRepo="origin", 
        [string] $targetBranch="main"
    )
    git pull $targetRepo $targetBranch
}


# 개발환경 구성
function cdWHA() { cd $env:PATH_ONNARA_ANDROID }
function codeHWAW1() { code "$env:PATH_ONNARA_ANDROID\onnara01\src\main\assets" }
function codeHWAW2() { code "$env:PATH_ONNARA_ANDROID\onnara02\src\main\assets" }


# ADB 및 안드로이드 관련
function scrcpyDefault()
{
    scrcpy -m 1024 --always-on-top
}
function scrcpyRec() 
{
    scrcpy -m 1024 --always-on-top --show-touches
}
function killTestbed() 
{
    adb shell am force-stop kr.go.mobile.testbed.iff
}



function alias()
{
    notepad $profile
}

# 후처리
$env:PATH += ";$env:UserProfile\scoop\apps\oh-my-posh\current\bin"
oh-my-posh --init --shell pwsh --config "$env:UserProfile\scoop\apps\oh-my-posh\current\themes\agnoster.omp.json" | Invoke-Expression
Import-Module Terminal-Icons
# neofetch