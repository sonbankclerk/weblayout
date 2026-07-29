<nav class="sidebar">
  <div class="sidebar__brand">관리자 콘솔</div>

  <div class="sidebar__section-label">메뉴</div>
  <ul class="sidebar__nav">
    <li>
      <a class="sidebar__link ${menuKey == 'dashboard' ? 'is-active' : ''}"
         href="${pageContext.request.contextPath}/admin/index.jsp">
        <svg class="sidebar__icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><rect x="3" y="3" width="7" height="9" rx="1.5"/><rect x="14" y="3" width="7" height="5" rx="1.5"/><rect x="14" y="12" width="7" height="9" rx="1.5"/><rect x="3" y="16" width="7" height="5" rx="1.5"/></svg>
        대시보드
      </a>
    </li>
    <li>
      <a class="sidebar__link ${menuKey == 'ip' ? 'is-active' : ''}"
         href="${pageContext.request.contextPath}/admin/ip-list.jsp">
        <svg class="sidebar__icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><rect x="3" y="4" width="18" height="16" rx="2"/><path d="M3 9h18"/><path d="M7 14h5"/></svg>
        허용 IP 목록
      </a>
    </li>
    <li>
      <a class="sidebar__link ${menuKey == 'notice' ? 'is-active' : ''}"
         href="${pageContext.request.contextPath}/admin/notice.jsp">
        <svg class="sidebar__icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M4 5h13l3 3v11a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V6a1 1 0 0 1 1-1Z"/><path d="M8 10h8M8 14h5"/></svg>
        메시지/공지사항 관리
      </a>
    </li>
    <li>
      <a class="sidebar__link ${menuKey == 'skin' ? 'is-active' : ''}"
         href="${pageContext.request.contextPath}/admin/skin.jsp">
        <svg class="sidebar__icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><rect x="3" y="3" width="8" height="8" rx="1.5"/><rect x="13" y="3" width="8" height="8" rx="1.5"/><rect x="3" y="13" width="8" height="8" rx="1.5"/><rect x="13" y="13" width="8" height="8" rx="1.5"/></svg>
        스킨 관리
      </a>
    </li>
  </ul>
</nav>
