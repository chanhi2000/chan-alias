# chan-alias

내 alias 구성

---
## 🛠Setup

### Windows 10 or above

#### Alias설정 - `cmd`

`cmd`를 실행 할 때 마다 자동적으로 적용하도록 구성

- <kbd>win</kbd> + <kbd>r</kbd> 누른 후 `regedit` 실행
- `HKEY_CURRENT_USER\Software\Microsoft\Command Processor` 경로로 이동
- 창에 마우스 우클릭 후, 메뉴에서 `새로만들기` > `문자열 값` 선택 후 아래 값 입력
    - Key: `AutoRun`
    - Value: `%USERPROFILE%\alias.cmd`
- 시스템 재시작

> `alias.cmd`파일을 해당 위치에 복붙


---
## 😎My Preference(s)

내가 정한 Alias목록

|cmd|description|
|:---|:-----|	
|`ls`|현 경로의 파일목록 출력|
|`sublime`|Sublime Text 호출|
|`scrcpyDefault`|내가 원하는 설정값의 scrcpy호출|
|`KillTestbed`|모바일전자정부지원센터 Testbed인스턴스를 죽인다|

---
## 📚Reference(s)

- (🌍`behabit.tistory.com`: Windows alias/단축 커맨드 설정하기)[link01]


[link01]: https://behabit.tistory.com/m/entry/Windows-alias%EB%8B%A8%EC%B6%95-%EC%BB%A4%EB%A7%A8%EB%93%9C-%EC%84%A4%EC%A0%95%ED%95%98%EA%B8%B0