<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setAttribute("pageTitle", "메시지/공지사항 관리");
  request.setAttribute("pageDesc", "공지사항과 사용자 메시지를 등록하고 노출 여부를 관리합니다.");
  request.setAttribute("menuKey", "notice");

  String type = request.getParameter("type");
  if (type == null) type = "all";
  request.setAttribute("type", type);

  /* TODO: 더미 데이터. 실제로는 조건(type)에 맞는 목록을 service 에서 조회하세요. */
  java.util.List<java.util.Map<String, String>> noticeList = new java.util.ArrayList<>();
  String[][] rows = {
    {"공지사항", "정기 점검 안내 (7/30 02:00~04:00)", "관리자", "2026-07-27", "노출"},
    {"메시지", "신규 가입자 환영 메시지 문구 변경", "관리자", "2026-07-25", "노출"},
    {"공지사항", "개인정보 처리방침 개정 안내", "관리자", "2026-07-20", "미노출"},
    {"메시지", "결제 오류 관련 안내 문구", "김담당", "2026-07-18", "노출"}
  };
  for (String[] r : rows) {
    java.util.Map<String, String> m = new java.util.HashMap<>();
    m.put("type", r[0]); m.put("title", r[1]); m.put("writer", r[2]); m.put("regDate", r[3]); m.put("visible", r[4]);
    noticeList.add(m);
  }
  request.setAttribute("noticeList", noticeList);
%>
<%@ include file="include/header.jsp" %>

<div class="page-head">
  <div>
    <h2 class="mt-0">메시지/공지사항 관리</h2>
    <p>등록된 공지사항과 메시지를 확인하고 노출 여부를 관리합니다.</p>
  </div>
</div>

<div class="toolbar">
  <div class="toolbar__left">
    <div class="filter-tabs">
      <a href="?type=all" class="${type == 'all' ? 'is-active' : ''}">전체</a>
      <a href="?type=notice" class="${type == 'notice' ? 'is-active' : ''}">공지사항</a>
      <a href="?type=message" class="${type == 'message' ? 'is-active' : ''}">메시지</a>
    </div>
    <form class="search-box" action="${pageContext.request.contextPath}/admin/notice.jsp" method="get">
      <svg class="search-box__icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><circle cx="11" cy="11" r="7"/><path d="m21 21-4.3-4.3"/></svg>
      <input type="text" name="keyword" class="input" placeholder="제목 검색">
    </form>
  </div>
  <div class="toolbar__right">
    <a class="btn btn--primary" href="${pageContext.request.contextPath}/admin/notice-form.jsp">
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 5v14M5 12h14"/></svg>
      새로 등록
    </a>
  </div>
</div>

<div class="card">
  <div class="table-wrap">
    <table class="data-table">
      <thead>
        <tr>
          <th style="width:48px">No</th>
          <th style="width:90px">구분</th>
          <th>제목</th>
          <th style="width:100px">작성자</th>
          <th style="width:110px">등록일</th>
          <th style="width:80px">노출</th>
          <th style="width:120px">관리</th>
        </tr>
      </thead>
      <tbody>
        <c:choose>
          <c:when test="${empty noticeList}">
            <tr>
              <td colspan="7">
                <div class="empty-state">
                  <div>등록된 게시물이 없습니다.</div>
                  <p>새로 등록 버튼으로 공지사항이나 메시지를 추가하세요.</p>
                </div>
              </td>
            </tr>
          </c:when>
          <c:otherwise>
            <c:forEach var="item" items="${noticeList}" varStatus="idx">
              <tr>
                <td class="cell-muted">${idx.count}</td>
                <td>
                  <c:choose>
                    <c:when test="${item.type == '공지사항'}">
                      <span class="badge badge--accent">공지</span>
                    </c:when>
                    <c:otherwise>
                      <span class="badge badge--muted">메시지</span>
                    </c:otherwise>
                  </c:choose>
                </td>
                <td>${item.title}</td>
                <td class="cell-muted">${item.writer}</td>
                <td class="cell-muted">${item.regDate}</td>
                <td>
                  <c:choose>
                    <c:when test="${item.visible == '노출'}">
                      <span class="badge badge--success">노출</span>
                    </c:when>
                    <c:otherwise>
                      <span class="badge badge--muted">미노출</span>
                    </c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <div class="row-actions">
                    <a class="btn btn--sm" href="${pageContext.request.contextPath}/admin/notice-form.jsp?id=${idx.count}">수정</a>
                    <form action="${pageContext.request.contextPath}/admin/notice-delete" method="post" onsubmit="return confirmDelete('해당 게시물을 삭제하시겠습니까?');">
                      <input type="hidden" name="id" value="${idx.count}">
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
