<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setAttribute("pageTitle", "스킨 관리");
  request.setAttribute("pageDesc", "등록된 스킨을 미리보고 사이트에 적용합니다.");
  request.setAttribute("menuKey", "skin");

  /*
   * TODO: 더미 데이터. 실제로는 스킨 등록 테이블을 조회하여 내려주세요.
   * previewUrl 은 각 스킨 폴더의 실제 jsp 페이지 경로입니다.
   * (iframe 으로 그대로 렌더링되므로 화면 목록에는 실제 스킨 결과물이 보입니다.)
   */
  java.util.List<java.util.Map<String, String>> skinList = new java.util.ArrayList<>();

  java.util.Map<String, String> s1 = new java.util.HashMap<>();
  s1.put("id", "sample-basic"); s1.put("name", "Basic"); s1.put("desc", "기본 제공 스킨, 밝은 톤");
  s1.put("previewUrl", request.getContextPath() + "/skins/sample-basic/preview.jsp"); s1.put("current", "Y");
  skinList.add(s1);

  java.util.Map<String, String> s2 = new java.util.HashMap<>();
  s2.put("id", "sample-dark"); s2.put("name", "Dark"); s2.put("desc", "다크 톤 스킨");
  s2.put("previewUrl", request.getContextPath() + "/skins/sample-dark/preview.jsp"); s2.put("current", "N");
  skinList.add(s2);

  java.util.Map<String, String> s3 = new java.util.HashMap<>();
  s3.put("id", "sample-minimal"); s3.put("name", "Minimal"); s3.put("desc", "여백 위주의 미니멀 스킨");
  s3.put("previewUrl", request.getContextPath() + "/skins/sample-basic/preview.jsp"); s3.put("current", "N");
  skinList.add(s3);

  request.setAttribute("skinList", skinList);
%>
<%@ include file="include/header.jsp" %>

<div class="page-head">
  <div>
    <h2 class="mt-0">스킨 관리</h2>
    <p>미리보기는 등록된 스킨의 jsp 페이지를 그대로 렌더링합니다.</p>
  </div>
</div>

<c:choose>
  <c:when test="${empty skinList}">
    <div class="card">
      <div class="empty-state">
        <div>등록된 스킨이 없습니다.</div>
        <p>스킨 파일을 업로드하고 등록하면 이곳에 표시됩니다.</p>
      </div>
    </div>
  </c:when>
  <c:otherwise>
    <div class="skin-grid">
      <c:forEach var="skin" items="${skinList}">
        <div class="skin-card ${skin.current == 'Y' ? 'is-current' : ''}">
          <div class="skin-card__preview">
            <%-- 실제 스킨 jsp를 축소하여 그대로 렌더링 --%>
            <iframe src="${skin.previewUrl}" title="${skin.name} 미리보기" scrolling="no"></iframe>
          </div>
          <div class="skin-card__body">
            <p class="skin-card__name">${skin.name}</p>
            <p class="skin-card__desc">${skin.desc}</p>
            <div class="skin-card__foot">
              <c:choose>
                <c:when test="${skin.current == 'Y'}">
                  <span class="badge badge--success">현재 적용중</span>
                </c:when>
                <c:otherwise>
                  <form action="${pageContext.request.contextPath}/admin/skin-apply" method="post">
                    <input type="hidden" name="skinId" value="${skin.id}">
                    <button type="submit" class="btn btn--sm btn--primary">이 스킨 적용</button>
                  </form>
                </c:otherwise>
              </c:choose>
              <a class="btn btn--sm" href="${skin.previewUrl}" target="_blank">크게 보기</a>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </c:otherwise>
</c:choose>

<%@ include file="include/footer.jsp" %>
