<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  layout.jsp = 레이아웃의 "도화지" 1개 파일
  헤더(상단바) + 왼쪽 사이드바 + 오른쪽 컨텐츠 + 푸터를 전부 여기서 그립니다.

  사용하는 쪽(index.jsp 등)은 아래 3개 request attribute만 세팅하고
  이 파일을 include 하면 됩니다.
    - pageTitle : 상단바 제목
    - pageDesc  : 상단바 설명 (선택)
    - menuKey   : 사이드바 활성 메뉴 (dashboard | ip | notice | skin)
    - bodyPage  : 오른쪽 컨텐츠 자리에 채워넣을 실제 내용 파일 경로 (admin/ 기준 상대경로)
--%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><c:if test="${not empty pageTitle}">${pageTitle} - </c:if>관리자 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
</head>
<body>
<div class="layout">

  <%-- 왼쪽 사이드바 --%>
  <%@ include file="include/sidebar.jsp" %>

  <div class="main">

    <%-- 위쪽 헤더(상단바) : 지금은 틀만, 로고/알림 등 실제 내용은 나중에 --%>
    <header class="topbar">
      <div>
        <div class="topbar__title">${pageTitle}</div>
        <c:if test="${not empty pageDesc}">
          <div class="topbar__breadcrumb">${pageDesc}</div>
        </c:if>
      </div>
      <div class="topbar__right">
        <%-- TODO: 헤더 우측 영역 (알림/관리자 정보 등) 추후 추가 --%>
      </div>
    </header>

    <%-- 오른쪽 컨텐츠 : 페이지별 내용이 여기에 끼워짐 --%>
    <main class="content">
      <jsp:include page="${bodyPage}" />
    </main>

    <%-- 아래쪽 푸터 : 지금은 틀만, 실제 내용은 나중에 --%>
    <footer class="footer">
      <%-- TODO: 저작권/버전 정보 등 추후 추가 --%>
    </footer>

  </div>
</div>

<script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
</body>
</html>
