# Ource Myapge

## 페이지 구성
>### Mypage 첫 페이지
#### mypage_main.jsp -> mypage 첫 화면, page import로 구성
#### page import
  * **mypage_top.jsp** -> 상단바
  * **mypage_profile.jsp** -> 프로필 이미지 
  
    * 이미지 수정 버튼 -> **mypage_profile_update.jsp**로 이동
    * **follow_ok.jsp** -> 팔로우 처리
    * **unfollow_ok.jsp** -> 팔로우 해제 처리
  * **mypage_user_friends.jsp** -> 친구 목록
  * **mypage_user_nav.jsp** -> 정보, 게시글, 친구목록 네비게이션 iframe으로 하위 구성
    * **mypage_user_info.jsp** -> 내 정보 출력
    * **mypage_contents.jsp** -> 내 게시글 출력
- - -
>### Mypage 이미지 수정 페이지
#### mypage_profile_update.jsp  -> 이미지 수정 페이지, page import로 구성
#### page import
  * **mypage_top.jsp** -> 상단바
  * **mypage_profile_update.jsp** -> 프로필 이미지 
  
    * 이미지 수정 버튼 완료 -> **mypage_change_img.jsp** 로 이동 후 -> **mypage_profile.jsp** 로 이동
  * **mypage_user_friends.jsp** -> 친구 목록
  * **mypage_user_nav.jsp** -> 정보, 게시글, 친구목록 네비게이션, **iframe**으로 하위 구성
  
    * **mypage_user_info.jsp** -> 내 정보 출력
    * **mypage_contents.jsp** -> 내 게시글 출력
- - -
>### CSS
#### CSS 목록
  * **bootstrap.css** -> **user_profile.jsp**에서  modal 사용 (Bootstrap v4.1.3)
  * **main.css** -> 중앙정렬 CSS
  * **top_nav.css** -> 상단바 CSS
  * **user_friends.css** -> 친구 목록 CSS
  * **user_info.css** -> 내정보 CSS
  * **user_nav.css** -> 네비게이션 CSS
  * **user_profile.css** -> 프로필 이미지 CSS
  - - -
>### Scprit
#### Scprit 목록
  * **bootstrap.js** -> **user_profile.jsp**에서  modal 사용 (Bootstrap v4.1.3)
  * **jquery.min.js** -> (jQuery v1.12.4)
  * **get_img.js** -> 프로필,배경 이미지 가져와서 보여주는 script
  * **user_info.js** -> **mypage_user_info.jsp**에서 더보기를 눌렀을때 이동하는 script
  * **user_nav.js** -> **user_nav.jsp** 클릭시 색상변경, 내정보, 게시글, 친구목록을 보여주는 script
  * **user_profile.js** -> **user_profile.jsp**에서  modal 사용, 프로필 이미지 수정, **follow** & **unfollow** script
  * **user_top.js** -> **user_top.jsp**에서 a tag 링크 제거
  
- - -
>### Image
#### Image 목록
  * **default_user_profile_img.png** -> 기본 프로필 이미지
  * **more1.png** -> **mypage_user_info.jsp** 에서의 더보기 버튼 이미지
  * **logo_background_transparent.png** -> **mypage_top.jsp**의 home으로 가기 버튼의 이미지
- - -
>### 그 외
#### git에 올라가 있는 목록
  * **login.jsp** -> 임시 로그인 페이지
  * **login_ok.jsp** -> session과 parameter를 구성하기 위한 파일
  * **mypage_main.html** -> mypage 구성시에 만든 최초의 틀
