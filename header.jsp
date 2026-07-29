<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  공통 헤더 include
  사용하는 페이지는 include 하기 전에 아래 request attribute 를 지정한다.
    - pageTitle   : 상단바에 표시할 페이지 제목 (필수)
    - pageDesc    : 페이지 설명 한 줄 (선택)
    - menuKey     : 사이드바 활성 메뉴 표시용 키 (dashboard | ip | notice | skin)
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

  <%@ include file="sidebar.jsp" %>

  <div class="main">
    <header class="topbar">
      <div>
        <div class="topbar__title">${pageTitle}</div>
        <c:if test="${not empty pageDesc}">
          <div class="topbar__breadcrumb">${pageDesc}</div>
        </c:if>
      </div>
      <div class="topbar__right">
        <div class="topbar__admin">
          <span class="topbar__avatar">A</span>
          <span>관리자님</span>
        </div>
      </div>
    </header>

    <main class="content">
