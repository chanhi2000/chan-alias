# chan-alias

๋ด alias ๊ตฌ์ฑ

---
## ๐ Setup

### Windows 10 or above

#### Alias์ค์  - `cmd`

`cmd`๋ฅผ ์คํ ํ  ๋ ๋ง๋ค ์๋์ ์ผ๋ก ์ ์ฉํ๋๋ก ๊ตฌ์ฑ

- <kbd>win</kbd> + <kbd>r</kbd> ๋๋ฅธ ํ `regedit` ์คํ
- `HKEY_CURRENT_USER\Software\Microsoft\Command Processor` ๊ฒฝ๋ก๋ก ์ด๋
- ์ฐฝ์ ๋ง์ฐ์ค ์ฐํด๋ฆญ ํ, ๋ฉ๋ด์์ `์๋ก๋ง๋ค๊ธฐ` > `๋ฌธ์์ด ๊ฐ` ์ ํ ํ ์๋ ๊ฐ ์๋ ฅ
    - Key: `AutoRun`
    - Value: `%USERPROFILE%\alias.cmd`
- ์์คํ ์ฌ์์

> `alias.cmd`ํ์ผ์ ํด๋น ์์น์ ๋ณต๋ถ


#### Alias์ค์  - `pwsh`

- <kbd>win</kbd> + <kbd>r</kbd> ๋๋ฅธ ํ `powershell` ์คํ
- ํ๋กฌํธ์์ ํ๋ก์ ํธ ๊ฒฝ๋ก๋ก ์ด๋
- `Copy-Item -Path .\Microsoft.PowerShell_profile.ps1 -Destination $profile` ์๋ ฅ

---
## ๐My Preference(s)

๋ด๊ฐ ์ ํ Alias๋ชฉ๋ก

|cmd|description|
|:---|:-----|	
|`ls`|ํ ๊ฒฝ๋ก์ ํ์ผ๋ชฉ๋ก ์ถ๋ ฅ
|`clear`|์ ์ฐฝ|
|`sublime`|Sublime Text ํธ์ถ|
|`scrcpyDefault`|๋ด๊ฐ ์ํ๋ ์ค์ ๊ฐ์ scrcpyํธ์ถ|
|`scrcpyRec`|ํ๋ฉด๋นํ์ฉ scrcpyํธ์ถ|
|||
|`killTestbed`|๋ชจ๋ฐ์ผ์ ์์ ๋ถ์ง์์ผํฐ Testbed์ธ์คํด์ค๋ฅผ ์ฃฝ์ธ๋ค|
|`openWspHomeAndroidWeb1`|์จ-๋๋ผ 1.0 ์นํ๋ก ํธ vscode๋ก ๊ฐ๋ฐํ๊ฒฝ ์ด๊ธฐ (ํ๊ฒฝ๋ณ์ `WspHomeAndroidWeb1` ๊ฒฝ๋ก ์ง์ ํ์)|
|`openWspHomeAndroidWeb2`|์จ-๋๋ผ 2.0 ์นํ๋ก ํธ vscode๋ก ๊ฐ๋ฐํ๊ฒฝ ์ด๊ธฐ (ํ๊ฒฝ๋ณ์ `WspHomeAndroidWeb2` ๊ฒฝ๋ก ์ง์ ํ์)|

---
## ๐Reference(s)

- [๐`behabit.tistory.com`: Windows alias/๋จ์ถ ์ปค๋งจ๋ ์ค์ ํ๊ธฐ][link01]

[link01]: https://behabit.tistory.com/m/entry/Windows-alias%EB%8B%A8%EC%B6%95-%EC%BB%A4%EB%A7%A8%EB%93%9C-%EC%84%A4%EC%A0%95%ED%95%98%EA%B8%B0