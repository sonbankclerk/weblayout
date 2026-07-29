<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setAttribute("pageTitle", "허용 IP 목록");
  request.setAttribute("pageDesc", "관리자 페이지 접근을 허용할 IP를 관리합니다.");
  request.setAttribute("menuKey", "ip");

  /* TODO: 더미 데이터. 실제로는 service/DAO 조회 결과(List<IpAllowVO> 등)를 request/model 로 내려주세요. */
  java.util.List<java.util.Map<String, String>> ipList = new java.util.ArrayList<>();
  java.util.Map<String, String> row1 = new java.util.HashMap<>();
  row1.put("ip", "121.128.10.15"); row1.put("desc", "본사 사무실"); row1.put("regDate", "2026-07-01"); row1.put("status", "사용");
  java.util.Map<String, String> row2 = new java.util.HashMap<>();
  row2.put("ip", "203.241.185.2"); row2.put("desc", "개발팀 VPN"); row2.put("regDate", "2026-07-12"); row2.put("status", "사용");
  java.util.Map<String, String> row3 = new java.util.HashMap<>();
  row3.put("ip", "58.229.14.220"); row3.put("desc", "외부 협력사"); row3.put("regDate", "2026-06-28"); row3.put("status", "중지");
  ipList.add(row1); ipList.add(row2); ipList.add(row3);
  request.setAttribute("ipList", ipList);
%>
<%@ include file="include/header.jsp" %>

<div class="page-head">
  <div>
    <h2 class="mt-0">허용 IP 목록</h2>
    <p>등록된 IP에서만 관리자 페이지에 접근할 수 있습니다.</p>
  </div>
</div>

<div class="toolbar">
  <div class="toolbar__left">
    <form class="search-box" action="${pageContext.request.contextPath}/admin/ip-list.jsp" method="get">
      <svg class="search-box__icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><circle cx="11" cy="11" r="7"/><path d="m21 21-4.3-4.3"/></svg>
      <input type="text" name="keyword" class="input" placeholder="IP 또는 설명 검색">
    </form>
  </div>
  <div class="toolbar__right">
    <a class="btn btn--primary" href="${pageContext.request.contextPath}/admin/ip-form.jsp">
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 5v14M5 12h14"/></svg>
      IP 추가
    </a>
  </div>
</div>

<div class="card">
  <div class="table-wrap">
    <table class="data-table">
      <thead>
        <tr>
          <th style="width:48px">No</th>
          <th>IP 주소</th>
          <th>설명</th>
          <th>등록일</th>
          <th>상태</th>
          <th style="width:120px">관리</th>
        </tr>
      </thead>
      <tbody>
        <c:choose>
          <c:when test="${empty ipList}">
            <tr>
              <td colspan="6">
                <div class="empty-state">
                  <div>등록된 IP가 없습니다.</div>
                  <p>우측 상단의 IP 추가 버튼으로 새 항목을 등록하세요.</p>
                </div>
              </td>
            </tr>
          </c:when>
          <c:otherwise>
            <c:forEach var="item" items="${ipList}" varStatus="idx">
              <tr>
                <td class="cell-muted">${idx.count}</td>
                <td>${item.ip}</td>
                <td>${item.desc}</td>
                <td class="cell-muted">${item.regDate}</td>
                <td>
                  <c:choose>
                    <c:when test="${item.status == '사용'}">
                      <span class="badge badge--success">사용</span>
                    </c:when>
                    <c:otherwise>
                      <span class="badge badge--muted">중지</span>
                    </c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <div class="row-actions">
                    <a class="btn btn--sm" href="${pageContext.request.contextPath}/admin/ip-form.jsp?ip=${item.ip}">수정</a>
                    <form action="${pageContext.request.contextPath}/admin/ip-delete" method="post" onsubmit="return confirmDelete('해당 IP를 삭제하시겠습니까?');">
                      <input type="hidden" name="ip" value="${item.ip}">
                      <button type="submit" class="btn btn--sm btn--danger">삭제</button>
                    </form>
                  </div>
                </td>
              </tr>
            </c:forEach>
          </c:otherwise>
        </c:choose>
      </tbody>
    </table>
  </div>
</div>

<div class="pagination">
  <span class="is-active">1</span>
</div>

<%@ include file="include/footer.jsp" %>
