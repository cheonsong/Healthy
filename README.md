# Healthy

진행기간: 2022/10/14 → 2022/12/20   
팀구성: 개인 프로젝트 ( 기획, 디자인, 개발 담당 )

## 프로젝트 설명

하루를 기록해 목표를 달성하고, 목표를 달성함으로써 건강해지자라는 취지로 개발한 서비스입니다.
일간, 월간 성취도를 확인할 수 있도록 했고, 개발자와 즉각적인 소통을 통해 고객센터도 존재합니다.

## 기술 스택

- MVVM + Coordinator + Clean Architecture
- Realm, RxSwift, SnapKit, Then, RxMoya
- Tuist, Fastlane, Localize
- Figma, Slack

## 화면별 설명

<details>
    <summary>시작</summary>
    <img src="https://user-images.githubusercontent.com/59193640/208603163-6346c464-6235-4261-b0aa-017c1a481166.png" width=150 height=266>
    <ul>
        <li>시작화면에서 Realm Database에 담긴 사용자 정보를 불러옵니다.</li>
        <li>데이터베이스에 해당 유저 정보가 있다면 바로 메인화면으로 이동합니다.</li>
        <li>사용자 정보가 존재하지 않는다면 시작하기 버튼을 눌렀을때 회원정보 입력 화면으로 이동합니다.</li>
    </ul>
</details>

<details>
    <summary>가입</summary>
    <img src="https://user-images.githubusercontent.com/59193640/208603235-e5d05bcd-1d92-4698-b6d0-7153ab1e0109.png" width=150 height=266>
    <ul>
        <li>이름, 나이, 성별, 키, 몸무게 총 다섯가지 정보를 입력 받습니다.</li>
        <li>입력받은 정보는 Realm DB파일에 저장됩니다.</li>
        <li>입력받은 정보를 기반으로 추천 음수량을 제공합니다.</li>
    </ul>
</details>

<details>
    <summary>메인</summary>
    <img src="https://user-images.githubusercontent.com/59193640/208603275-f3f49e6a-cb69-474e-8158-ed22fd326abe.png" width=150 height=266>
    <ul>
        <li>우상단 물음표 버튼을 누르면 앱 사용 가이드를 확인할 수 있습니다.</li>
        <li>메인페이지에서는 전체적인 목표 달성도를 한눈에 확인 할 수 있습니다.</li>
        <li>현재 한가지 기능밖에 없지만 총 세가지 기능(걸음, 수면, 음식)을 추가하는것을 목표로 하고있습니다.</li>
    </ul>
</details>
   
<details>
    <summary>음수량 확인</summary>
    <img src="https://user-images.githubusercontent.com/59193640/208603294-5173993a-2ac5-43a3-84e2-698109617441.png" width=150 height=266>
    <ul>
        <li>오늘의 음수량을 수치와, 프로그레스바를 통해 시각적으로 확인이 가능합니다.</li>
        <li>우상단의 설정버튼을 통해 목표 음수량을 수정 가능합니다.</li>
        <li>중단의 달력은 Github의 Commit그래프에서 영감을 받아 월별 달성도를 한눈에 확인 가능하도록 구성했습니다.</li>
        <li>하단 물마시기 버튼은 오늘 마신 물을 추가할 수 있는 기능입니다.</li>
    </ul>
</details>

<details>
    <summary>음수량 추가</summary>
    <img src="https://user-images.githubusercontent.com/59193640/208603340-98a59fa5-46d7-48b9-b9d8-2d193f16a96f.png" width=150 height=266>
    <ul>
        <li>따로 페이지를 분리하지는 않았고 모달형식으로 노출됩니다.</li>
        <li>물 한잔의 양은 기본적으로 200ml이며 물을 추가 및 삭제 할 수 있습니다.</li>
        <li>변경된 정보는 즉각 Realm DB파일에 기록되며, 정상적으로 기록됐다면 음수량 확인 화면의 정보도 즉각적으로 변경됩니다.</li>
    </ul>
</details>

<details>
    <summary>음수량 목표 설정</summary>
    <img src="https://user-images.githubusercontent.com/59193640/208603370-ee201a09-4eca-4b13-ad75-91fb9d91f53e.png" width=150 height=266>
    <ul>
        <li>기본값은 사용자 정보에 맞는 추천값입니다.</li>
        <li>추가하기와 동일하게 모달형식으로 노출됩니다.</li>
        <li>현재 하루 목표를 보여주며 사용자가 변경한 정보는 Realm DB에 저장됩니다.</li>
        <li>변경된 즉시 비율에 맞게 음수량확인화면의 프로그래스바가 변경됩니다.</li>
    </ul>
</details>

<details>
    <summary>고객센터</summary>
    <img src="https://user-images.githubusercontent.com/59193640/208603432-ff6e938f-56e1-43b8-b326-6bec89b9ecb5.png" width=150 height=266>
    <img src="https://user-images.githubusercontent.com/59193640/208603418-4b1f4561-970b-4209-8729-ff4c48042ec2.png" width=150 height=266>
    <ul>
        <li>사용자는 카테고리를 선택하고, 내용을 입력하여 전송하면 Slack API를 통해 미리 설정해둔 슬랙채널로 해당 메세지가 전송돼 개발자가 바로 확인이 가능합니다.</li>
        <li>최초배포에는 없던 기능이지만 필요성이 느껴져 업데이트한 기능입니다.</li>
    </ul>
</details>

## 시연 영상 (44초)

<img src="https://user-images.githubusercontent.com/59193640/208603464-14bbe489-1500-4788-ac5a-0f9c682d697c.mp4" width=150 height=266>


## 성과

- a to z 로 프로젝트 기획, 디자인 개발 외적인 부분부터, 프로젝트 아키텍쳐 설계, 기술스택 선정 및 활용까지 모든 부분을 담당
- MVVM패턴에서 ViewModel의 많은 책임을 줄이기 위해 Clean Architecture을 도입, 기능을 담당하는 Usecase, 통신을 담당하는 Repository로 책임을 분리해 ViewModel은 사용자의 입력을 받아 취해야 할 행동만 알고 있도록 개선
- Realm CRUD, REST CRUD 결과를 Completion Callback이 아닌 Rx Single객체로 리턴받도록 개선함으로써 코드가 훨씬 깔끔해지고, 비동기 처리 로직이 간단해짐
- 고객센터 기능을 통해 사용자에게 피드백을 받고 즉시 조치가 가능하도록 구현해 사용자와 커뮤니케이션이 활발해짐
- [UIBuilder](https://github.com/cheonsong/UIBuilder)와 DesignSystem을 이용해 개발 생산성을 높이고, UI 구현 로직을 깔끔하게 정리함 또한 사용자에게 일관된 사용자경험을 제공함
- xcconfig를 통해 debug, release용으로 API Key값을 분리하고, 공개 저장소에 Key값이 공개되는 위험을 방지함
- 한국어, 영어, 일본어 로컬라이징을 통해 세가지 언어를 지원하며, 로컬라이징 자동화를 구축해 개발 생산성을 향상함

## **회고**

- 첫 배포 후 지인들에게 테스트를 요청했는데, 알려주지 않아도 당연하게 사용 가능할것이라 생각했던 기능들을 잘 모르는 상황이 발생했다. 이때 사용자의 입장에서 더 깊게 고민하지 못한부분이 아쉬웠다.
→ **해당 상황을 해결하기 위해 바로 가이드를 추가했고, 이후 사용자와 커뮤니케이션을위해 고객센터 기능을 추가했다.**
- 초반 프로젝트를 설계하면서 UIKit과 SwiftUI에 대해 고민하다 UIKit기반 MVVM 패턴을 더 개선하고 발전하고싶어 Clean Architecture을 도입하는 방향으로 설계했는데 프로젝트를 진행하다보니 하나의 값이 바뀜에 따라 여러곳의 UI가 동시다발적으로 바뀌어야해서 SwiftUI로 했다면 이 부분에 대해서는 좀 더 편하게 깔끔하게 구현했을꺼라는 아쉬움이 남는다.
→ **Presentation계층에서 참조할 수 있는 State 싱글톤 객체를 생성하고, State 객체는 Observable객체를 프로퍼티로 갖는다. 모든 화면은 이 값을 구독하여 State 내부값이 변경되면 구독한 모든 화면이 동시에 바뀌게끔 구현했다.**

## Link

### **App Store**

[AppStore](https://apps.apple.com/kr/app/healthy/id1658676877)

### **Figma**

[Figma](https://www.figma.com/file/iknf6FjR7hxmCoM2jYFvBk/Healthy?node-id=0%3A1&t=vkg7VZZxKuUNyUDO-3)
