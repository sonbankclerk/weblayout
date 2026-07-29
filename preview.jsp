<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 스킨 실제 산출물 예시 페이지. 스킨 폴더 안에 실제 화면 jsp를 이렇게 배치합니다. --%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Basic 스킨 미리보기</title>
<style>
  body { margin:0; font-family:'Pretendard', -apple-system, sans-serif; background:#FFFFFF; color:#222; }
  .skin-header { padding:16px 20px; border-bottom:1px solid #EEE; font-weight:700; font-size:16px; }
  .skin-banner { height:120px; background:#F2F4F8; display:flex; align-items:center; justify-content:center; color:#8A8F98; font-size:13px; }
  .skin-body { padding:20px; }
  .skin-body p { margin:0 0 10px; font-size:13px; color:#555; }
  .skin-btn { display:inline-block; padding:8px 16px; background:#4F63D8; color:#fff; border-radius:6px; font-size:13px; }
</style>
</head>
<body>
  <div class="skin-header">사이트 로고</div>
  <div class="skin-banner">메인 배너 영역</div>
  <div class="skin-body">
    <p>Basic 스킨은 밝은 배경과 정돈된 레이아웃을 사용합니다.</p>
    <a class="skin-btn" href="#" onclick="return false;">자세히 보기</a>
  </div>
</body>
</html>
