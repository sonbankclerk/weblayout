# 관리자 페이지 레이아웃 (JSP)

레이아웃/구조 단계 산출물입니다. 색상·타이포는 확정 디자인이 아니라 "깔끔하고 요즘 느낌"의
기본 톤으로 잡아둔 것이며, `resources/css/admin.css` 상단 `:root` 변수만 바꾸면 전체 톤이 바뀝니다.

## 폴더 구조

```
admin/
  index.jsp            대시보드 (진입 페이지)
  ip-list.jsp           허용 IP 목록 조회
  notice.jsp            메시지/공지사항 관리 (목록)
  skin.jsp               스킨 관리 (스킨 선택/적용)
  include/
    header.jsp           공통 상단 + 레이아웃 시작 (사이드바 include 포함)
    sidebar.jsp          좌측 메뉴
    footer.jsp           공통 레이아웃 종료 + 공통 JS 로드
resources/
  css/admin.css          전체 레이아웃/컴포넌트 스타일 (토큰 기반)
  js/admin.js            최소 스크립트 (삭제 confirm 만 사용, 화면 전환 애니메이션 없음)
skins/
  sample-basic/preview.jsp   등록 스킨 예시 1 (실제 jsp 산출물)
  sample-dark/preview.jsp    등록 스킨 예시 2 (실제 jsp 산출물)
```

## 페이지 연결 방식

각 화면은 아래 3줄 패턴으로 공통 레이아웃을 불러옵니다.

```jsp
<%
  request.setAttribute("pageTitle", "화면 제목");
  request.setAttribute("pageDesc", "화면 설명 한 줄");
  request.setAttribute("menuKey", "ip"); // dashboard | ip | notice | skin
%>
<%@ include file="include/header.jsp" %>
... 내용 ...
<%@ include file="include/footer.jsp" %>
```

`menuKey` 값으로 좌측 메뉴의 활성 상태(강조 표시)가 자동으로 잡힙니다.

## 스킨 관리 - jsp 렌더링 방식

`skin.jsp`의 카드 미리보기는 정적 이미지가 아니라 `<iframe>`으로 각 스킨의
실제 `preview.jsp`를 그대로 렌더링합니다 (`skins/{스킨ID}/preview.jsp`).
따라서 스킨을 새로 추가할 때는 해당 스킨 폴더에 실제 화면 jsp를 넣고,
`skin.jsp`의 스킨 목록 데이터에 `previewUrl`만 연결하면 됩니다.
지금은 `skin.jsp` 내부에 더미 리스트로 넣어뒀고, 실제 연동 시 DB 조회 결과로 교체하면 됩니다.

## 현재 더미로 처리된 부분 (연동 필요)

- `ip-list.jsp` : IP 목록, 등록/수정 폼(`ip-form.jsp`), 삭제 처리(`/admin/ip-delete`)
- `notice.jsp` : 공지/메시지 목록, 등록/수정 폼(`notice-form.jsp`), 삭제 처리(`/admin/notice-delete`)
- `skin.jsp` : 스킨 목록, 적용 처리(`/admin/skin-apply`)

폼 페이지(등록/수정)와 실제 CRUD 컨트롤러/서블릿은 이번 단계 범위에 없어 만들지 않았습니다.
목록 → 등록 → 적용까지 흐름이 정해지면 이어서 만들면 됩니다.

## 전제

- JSTL core 태그(`c:if`, `c:forEach`, `c:choose`)를 사용합니다. `jstl-1.2.jar` (또는 프로젝트에서
  쓰는 JSTL 구현체)가 클래스패스에 있어야 합니다.
- 컨텍스트 경로는 `${pageContext.request.contextPath}`로 처리해 두어 배포 경로가 바뀌어도
  링크가 깨지지 않습니다.
- 폰트는 Pretendard(웹폰트 CDN)를 우선 사용하고, 로딩 실패 시 시스템 기본 폰트로 대체됩니다.
