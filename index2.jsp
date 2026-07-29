<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  request.setAttribute("pageTitle", "관리자 페이지");
  request.setAttribute("pageDesc", "이용할 기능을 선택하세요.");
  request.setAttribute("menuKey", "dashboard");
%>
<%@ include file="include/header.jsp" %>

<div class="entry-grid">
  <a class="entry-card" href="${pageContext.request.contextPath}/admin/ip-list.jsp">
    <div class="entry-card__icon">
      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><rect x="3" y="4" width="18" height="16" rx="2"/><path d="M3 9h18"/><path d="M7 14h5"/></svg>
    </div>
    <p class="entry-card__title">허용 IP 목록</p>
    <p class="entry-card__desc">관리자 페이지 접근을 허용할 IP를 조회하고 관리합니다.</p>
  </a>

  <a class="entry-card" href="${pageContext.request.contextPath}/admin/notice.jsp">
    <div class="entry-card__icon">
      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M4 5h13l3 3v11a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V6a1 1 0 0 1 1-1Z"/><path d="M8 10h8M8 14h5"/></svg>
    </div>
    <p class="entry-card__title">메시지/공지사항 관리</p>
    <p class="entry-card__desc">공지사항과 사용자 메시지를 등록하고 노출 여부를 관리합니다.</p>
  </a>

  <a class="entry-card" href="${pageContext.request.contextPath}/admin/skin.jsp">
    <div class="entry-card__icon">
      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><rect x="3" y="3" width="8" height="8" rx="1.5"/><rect x="13" y="3" width="8" height="8" rx="1.5"/><rect x="3" y="13" width="8" height="8" rx="1.5"/><rect x="13" y="13" width="8" height="8" rx="1.5"/></svg>
    </div>
    <p class="entry-card__title">스킨 관리</p>
    <p class="entry-card__desc">등록된 스킨을 미리보고 선택하여 사이트에 적용합니다.</p>
  </a>
</div>

<%@ include file="include/footer.jsp" %>
