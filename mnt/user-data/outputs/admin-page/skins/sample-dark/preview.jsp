<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 스킨 실제 산출물 예시 페이지. 스킨 폴더 안에 실제 화면 jsp를 이렇게 배치합니다. --%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Dark 스킨 미리보기</title>
<style>
  body { margin:0; font-family:'Pretendard', -apple-system, sans-serif; background:#15171C; color:#E7E9EE; }
  .skin-header { padding:16px 20px; border-bottom:1px solid #262A33; font-weight:700; font-size:16px; }
  .skin-banner { height:120px; background:#1E212A; display:flex; align-items:center; justify-content:center; color:#7C8190; font-size:13px; }
  .skin-body { padding:20px; }
  .skin-body p { margin:0 0 10px; font-size:13px; color:#A9AEBA; }
  .skin-btn { display:inline-block; padding:8px 16px; background:#5B7FFF; color:#fff; border-radius:6px; font-size:13px; }
</style>
</head>
<body>
  <div class="skin-header">사이트 로고</div>
  <div class="skin-banner">메인 배너 영역</div>
  <div class="skin-body">
    <p>Dark 스킨은 어두운 배경과 대비를 강조한 레이아웃을 사용합니다.</p>
    <a class="skin-btn" href="#" onclick="return false;">자세히 보기</a>
  </div>
</body>
</html>
