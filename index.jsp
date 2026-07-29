<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  request.setAttribute("pageTitle", "대시보드");
  request.setAttribute("pageDesc", "관리자 페이지 현황을 한눈에 확인하세요.");
  request.setAttribute("menuKey", "dashboard");
%>
<%@ include file="include/header.jsp" %>

<%-- TODO: 아래 수치는 더미 데이터입니다. 실제 서비스 연동 시 controller/service 에서 내려주는 값으로 교체하세요. --%>
<div class="stat-grid">
  <div class="stat-card">
    <p class="stat-card__label">등록된 허용 IP</p>
    <p class="stat-card__value">12건</p>
    <p class="stat-card__foot">최근 등록 2026-07-20</p>
  </div>
  <div class="stat-card">
    <p class="stat-card__label">노출중인 공지사항</p>
    <p class="stat-card__value">4건</p>
    <p class="stat-card__foot">전체 18건 중</p>
  </div>
  <div class="stat-card">
    <p class="stat-card__label">현재 적용 스킨</p>
    <p class="stat-card__value">Basic</p>
    <p class="stat-card__foot">등록된 스킨 3종</p>
  </div>
</div>

<div class="card">
  <div class="card__header">
    <h3>바로가기</h3>
  </div>
  <div class="card__body">
    <table class="data-table">
      <thead>
        <tr>
          <th>기능</th>
          <th>설명</th>
          <th class="text-right">이동</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>허용 IP 목록</td>
          <td class="cell-muted">관리자 페이지 접근을 허용할 IP를 조회하고 관리합니다.</td>
          <td class="text-right"><a class="btn btn--sm" href="${pageContext.request.contextPath}/admin/ip-list.jsp">이동</a></td>
        </tr>
        <tr>
          <td>메시지/공지사항 관리</td>
          <td class="cell-muted">공지사항과 사용자 메시지를 등록하고 노출 여부를 관리합니다.</td>
          <td class="text-right"><a class="btn btn--sm" href="${pageContext.request.contextPath}/admin/notice.jsp">이동</a></td>
        </tr>
        <tr>
          <td>스킨 관리</td>
          <td class="cell-muted">등록된 스킨을 미리보고 선택하여 사이트에 적용합니다.</td>
          <td class="text-right"><a class="btn btn--sm" href="${pageContext.request.contextPath}/admin/skin.jsp">이동</a></td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

<%@ include file="include/footer.jsp" %>
