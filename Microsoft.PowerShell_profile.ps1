# Commands
Set-Alias sublime sublime_text
function alias()
{
    notepad $profile
}

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

# 개발환경 구성
function openWspHomeAndroidWeb1()
{
    code $env:WspHomeAndroidWeb1
}
function openWspHomeAndroidWeb2() 
{
    code $env:WspHomeAndroidWeb2
}

# 후처리
$env:PATH += ";$env:UserProfile\scoop\apps\oh-my-posh\current\bin"
oh-my-posh --init --shell pwsh --config "$env:UserProfile\scoop\apps\oh-my-posh\current\themes\agnoster.omp.json" | Invoke-Expression
Import-Module Terminal-Icons
neofetch