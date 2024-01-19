# chan-alias

내 alias 구성

---

## 🛠Setup

### Windows 10 or above

#### Alias설정 `cmd`

`cmd`를 실행 할 때 마다 자동적으로 적용하도록 구성

##### CLI사용

- <kbd>win</kbd>+<kbd>r</kbd> 누른 후 `cmd` 실행 (관리자 권한 추천)

```batch
REG ADD "HKCU\SOFTWARE\Microsoft\Command Processor" /v AutoRun /t REG_SZ /d <alias.cmd가 있는 절대경로 파일포함>
```

##### 수동

- <kbd>win</kbd>+<kbd>r</kbd> 누른 후 `regedit` 실행
- `HKEY_CURRENT_USER\Software\Microsoft\Command Processor` 경로로 이동
- 창에 마우스 우클릭 후, 메뉴에서 `새로만들기` > `문자열 값` 선택 후 아래 값 입력
  - Key: `AutoRun`
  - Value: `%USERPROFILE%\alias.cmd` 또는 기타 경로

> `alias.cmd` 파일을 📁`%USERPROFILE%` 경로 밑으로 복붙

#### Alias설정 `pwsh`

- <kbd>win</kbd>+<kbd>r</kbd> 누른 후 `powershell` 실행
- 프롬트에서 프로젝트 경로로 이동
- `Copy-Item -Path .\Microsoft.PowerShell_profile.ps1 -Destination $profile` 입력

---

## 😎My Preference(s)

내가 정한 Alias목록

| cmd | description |
| :--- | :---- |
| `ls` | 현 경로의 파일목록 출력 |
| `clear` | 새 창 |
| `pwd` |  현 경로 출력 |
|||
| `g` | `git` |
| `gs` | `git status` |
| `gss` | `git status --short` |
| `ga` | `git add` ... |
| `gc` | `git commit`  ... |
| `gb` | `git branch -vv` ... |
| `gco` | `git checkout` ... |
| `gf` | `git fetch`  ... |
| `glg` | `git log`  ... |
| `gt` | `git tag` ... |
| `gp` | `git push`  ... |
| `gpl` | `git pull`  ... |
|||
| `scrcpyDefault` | 내가 원하는 설정값의 scrcpy호출 |
| `scrcpyRec` | 화면녹화용 scrcpy호출 |
|||
| `killTestbed` | 모바일전자정부지원센터 Testbed인스턴스를 죽인다 |
| `codeHWAW1` | 온나라 1.0 웹프론트 vscode로 개발환경 열기 (환경변수 `PATH_ONNARA_ANDROID` 경로 지정필요) |
| `codeHWAW2` | 온나라 2.0 웹프론트 vscode로 개발환경 열기 (환경변수 `PATH_ONNARA_ANDROID` 경로 지정필요) |

---

## 📚Reference(s)

- [🌍`behabit.tistory.com`: Windows alias/단축 커맨드 설정하기](https://behabit.tistory.com/m/entry/Windows-alias%EB%8B%A8%EC%B6%95-%EC%BB%A4%EB%A7%A8%EB%93%9C-%EC%84%A4%EC%A0%95%ED%95%98%EA%B8%B0)