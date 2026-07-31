<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>사내 관리자 - 채팅 스킨 설정</title>
    <style>
        /* ------------------------------------------------------------
           [기본 레이아웃 및 리셋]
           디자이너가 전체 폰트 및 배경색을 변경할 수 있는 영역입니다.
        ------------------------------------------------------------ */
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: 'Malgun Gothic', sans-serif; display: flex; height: 100vh; color: #333; background-color: #f5f6f8; }

        /* ------------------------------------------------------------
           [좌측 내비게이션 바]
           메뉴 변경 및 아이콘 디자인 영역입니다.
        ------------------------------------------------------------ */
        .sidebar { width: 260px; background-color: #ffffff; border-right: 1px solid #e0e2e7; padding: 24px; display: flex; flex-direction: column; gap: 20px; }
        .logo { font-size: 20px; font-weight: bold; margin-bottom: 20px; color: #1e293b; }
        .menu-list { list-style: none; display: flex; flex-direction: column; gap: 8px; }
        .menu-item { padding: 12px 16px; border-radius: 8px; color: #64748b; text-decoration: none; font-weight: 500; cursor: pointer; }
        .menu-item.active { background-color: #f1f5f9; color: #0f172a; font-weight: bold; }
        .menu-item:hover:not(.active) { background-color: #f8fafc; color: #0f172a; }

        /* ------------------------------------------------------------
           [우측 메인 콘텐츠 영역]
           기본 3단 분할 레이아웃 (설정 영역 2단 + 우측 섀도우돔 미리보기 1단)
        ------------------------------------------------------------ */
        .main-container { flex: 1; display: flex; flex-direction: column; overflow: hidden; }
        
        /* 상단 헤더 */
        .header { height: 60px; background-color: #ffffff; border-bottom: 1px solid #e0e2e7; display: flex; align-items: center; justify-content: space-between; padding: 0 32px; }
        .page-title { font-size: 22px; font-weight: bold; color: #0f172a; }
        .user-info { font-size: 14px; color: #64748b; }

        /* 콘텐츠 바디 (좌우 스플릿) */
        .content-body { flex: 1; display: flex; overflow-y: auto; padding: 32px; gap: 32px; }
        
        /* 왼쪽: 설정 영역 (채널 선택 + 스킨 카드) */
        .config-section { flex: 2; display: flex; flex-direction: column; gap: 32px; min-width: 500px; }
        .section-card { background: #ffffff; border: 1px solid #e2e8f0; border-radius: 12px; padding: 24px; }
        .section-title { font-size: 16px; font-weight: 600; margin-bottom: 16px; color: #334155; }

        /* ------------------------------------------------------------
           [기능 컴포넌트 스타일]
        ------------------------------------------------------------ */
        /* 1. 채널 선택 셀렉트박스 */
        .form-group { display: flex; flex-direction: column; gap: 8px; }
        .select-input { width: 100%; padding: 10px; border: 1px solid #cbd5e1; border-radius: 6px; font-size: 14px; background-color: #fff; }
        .info-tag { font-size: 12px; color: #64748b; margin-top: 4px; display: inline-block; }

        /* 2. 스킨 카드 격자(Grid) 배치 */
        .skin-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 16px; margin-top: 12px; }
        .skin-card { border: 2px solid #e2e8f0; border-radius: 8px; overflow: hidden; cursor: pointer; position: relative; transition: all 0.2s; }
        .skin-card.selected { border-color: #2563eb; background-color: #eff6ff; }
        .skin-thumbnail { width: 100%; height: 110px; background-color: #f8fafc; display: flex; align-items: center; justify-content: center; color: #94a3b8; border-bottom: 1px solid #e2e8f0; font-size: 13px; }
        /* 스킨별 더미 이미지 표현 */
        .skin-card:nth-child(1) .skin-thumbnail { background: linear-gradient(135deg, #e2e8f0 0%, #cbd5e1 100%); color: #475569; }
        .skin-card:nth-child(2) .skin-thumbnail { background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%); color: #94a3b8; }
        .skin-card:nth-child(3) .skin-thumbnail { background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%); color: #1e40af; }
        
        .skin-info { padding: 12px; }
        .skin-name { font-size: 14px; font-weight: 600; display: flex; align-items: center; gap: 8px; }
        .skin-path { font-size: 11px; color: #94a3b8; margin-top: 4px; font-family: monospace; }

        /* 하단 액션 버튼 */
        .btn-group { display: flex; gap: 12px; margin-top: 8px; }
        .btn { padding: 12px 24px; border-radius: 6px; border: none; font-size: 14px; font-weight: 600; cursor: pointer; }
        .btn-primary { background-color: #2563eb; color: #ffffff; }
        .btn-secondary { background-color: #e2e8f0; color: #475569; }

        /* ------------------------------------------------------------
           [오른쪽: 실시간 미리보기 스마트폰 목업 영역]
           디자이너가 모바일 프레임(디바이스)을 꾸밀 수 있는 공간입니다.
        ------------------------------------------------------------ */
        .preview-section { flex: 1.2; background: #ffffff; border: 1px solid #e2e8f0; border-radius: 12px; padding: 24px; display: flex; flex-direction: column; align-items: center; min-width: 360px; }
        
        /* 스마트폰 형태 디바이스 프레임 */
        .phone-mockup { width: 100%; max-width: 320px; height: 560px; border: 12px solid #1e293b; border-radius: 36px; padding: 10px; background-color: #fff; box-shadow: 0 10px 25px -5px rgba(0,0,0,0.1); display: flex; flex-direction: column; position: relative; }
        /* 스피커 홀 더미 */
        .phone-mockup::before { content: ''; position: absolute; top: 4px; left: 50%; transform: translateX(-50%); width: 60px; height: 4px; background-color: #475569; border-radius: 2px; }
        
        /* 섀도우 돔이 부착될 실제 영역 호스트 */
        #shadow-dom-host { flex: 1; border-radius: 20px; overflow: hidden; background-color: #ffffff; border: 1px solid #f1f5f9; }
    </style>
</head>
<body>

    <!-- 1. 좌측 메뉴바 -->
    <div class="sidebar">
        <div class="logo">Company Admin</div>
        <ul class="menu-list">
            <li><a class="menu-item">대시보드</a></li>
            <li><a class="menu-item">허용 IP 관리</a></li>
            <li><a class="menu-item active">채팅 스킨 설정</a></li>
            <li><a class="menu-item">메시지/공지 관리</a></li>
        </ul>
    </div>

    <!-- 2. 우측 메인 영역 -->
    <div class="main-container">
        <!-- 상단 헤더 -->
        <div class="header">
            <div class="page-title">채팅 스킨 설정 및 변경</div>
            <div class="user-info">관리자 계정 님</div>
        </div>

        <!-- 메인 바디 -->
        <div class="content-body">
            
            <!-- [왼쪽 영역] 설정 및 스킨 선택 (DB 정보 매핑 유스케이스) -->
            <div class="config-section">
                
                <!-- 1단계: 접근 채널 선택 -->
                <div class="section-card">
                    <div class="section-title">1. 접근 채널 선택 (IP & URL 매핑)</div>
                    <div class="form-group">
                        <select class="select-input">
                            <!-- 디자이너가 옵션 스타일링 영역 확인용 더미 데이터 -->
                            <option value="/chat/skins/default.jsp">영업본부 CS팀 채널 (/sales/chat)</option>
                            <option value="/chat/skins/dark.jsp">기술지원 핫라인 채널 (/tech/chat)</option>
                            <option value="/chat/skins/blue.jsp">해외 마케팅 채널 (/global/chat)</option>
                        </select>
                        <span class="info-tag">※ 선택한 채널에 연결된 스킨 정보(DB 매핑 주소)가 아래 활성화됩니다.</span>
                    </div>
                </div>

                <!-- 2단계: 스킨 선택 -->
                <div class="section-card">
                    <div class="section-title">2. 적용할 스킨 선택 (JSP 템플릿 목록)</div>
                    
                    <div class="skin-grid">
                        <!-- 스킨 카드 1 -->
                        <div class="skin-card selected" onclick="changePreview('default')">
                            <div class="skin-thumbnail">기본 스킨 미리보기 썸네일</div>
                            <div class="skin-info">
                                <div class="skin-name"><input type="radio" name="skin-select" checked> 기본 스킨</div>
                                <div class="skin-path">/chat/skins/default.jsp</div>
                            </div>
                        </div>

                        <!-- 스킨 카드 2 -->
                        <div class="skin-card" onclick="changePreview('dark')">
                            <div class="skin-thumbnail">다크 스킨 미리보기 썸네일</div>
                            <div class="skin-info">
                                <div class="skin-name"><input type="radio" name="skin-select"> 다크 모드 스킨</div>
                                <div class="skin-path">/chat/skins/dark.jsp</div>
                            </div>
                        </div>

                        <!-- 스킨 카드 3 -->
                        <div class="skin-card" onclick="changePreview('blue')">
                            <div class="skin-thumbnail">코퍼레이트 블루 썸네일</div>
                            <div class="skin-info">
                                <div class="skin-name"><input type="radio" name="skin-select"> 기업형 블루 스킨</div>
                                <div class="skin-path">/chat/skins/blue.jsp</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 저장/취소 버튼 세트 -->
                <div class="btn-group">
                    <button type="button" class="btn btn-primary">변경 사항 저장</button>
                    <button type="button" class="btn btn-secondary">취소</button>
                </div>
            </div>

            <!-- [오른쪽 영역] 섀도우 돔 임베디드 실시간 미리보기 -->
            <div class="preview-section">
                <div class="section-title" style="align-self: flex-start;">Live Preview (Shadow DOM)</div>
                
                <!-- 스마트폰 프레임 목업 -->
                <div class="phone-mockup">
                    <!-- 브라우저 CSS 간섭 없이 JSP 내부 스킨 HTML/CSS가 주입될 호스트 요소 -->
                    <div id="shadow-dom-host"></div>
                </div>
            </div>

        </div>
    </div>

    <!-- ------------------------------------------------------------
       [Shadow DOM 실시간 렌더링 스크립트]
       서버 사이드 로직(JSTL)을 타기 전 디자이너가 클릭 시 UI 변화를 
       체험할 수 있도록 프론트 단에서 섀도우 돔 주입 예시를 구현했습니다.
    ------------------------------------------------------------ -->
    <script>
        // 1. 섀도우 돔 호스트 엘리먼트 가져오기 및 생성
        const host = document.getElementById('shadow-dom-host');
        const shadowRoot = host.attachShadow({ mode: 'open' });

        // 2. 디자이너 확인용 더미 가상 JSP 스킨별 HTML/CSS 뭉치 정의
        const mockJspSkins = {
            default: `
                <style>
                    .chat-window { display: flex; flex-direction: column; height: 100%; font-family: sans-serif; background: #f0f2f5; }
                    .chat-header { background: #007bff; color: white; padding: 15px; font-weight: bold; text-align: center; }
                    .chat-messages { flex: 1; padding: 15px; display: flex; flex-direction: column; gap: 10px; }
                    .msg { background: white; padding: 10px; border-radius: 8px; max-width: 80%; font-size: 13px; box-shadow: 0 1px 2px rgba(0,0,0,0.1); }
                    .msg.system { background: #e3f2fd; align-self: center; color: #0d47a1; text-align: center; max-width: 100%; }
                    .chat-input { padding: 10px; background: white; border-top: 1px solid #ddd; display: flex; }
                    .chat-input input { flex: 1; border: 1px solid #ccc; padding: 8px; border-radius: 4px; font-size: 12px; }
                </style>
                <div class="chat-window">
                    <div class="chat-header">고객상담실 (기본형)</div>
                    <div class="chat-messages">
                        <div class="msg system">상담원과 연결 중입니다...</div>
                        <div class="msg">안녕하세요. 무엇을 도와드릴까요?</div>
                    </div>
                    <div class="chat-input"><input type="text" placeholder="메시지를 입력하세요..." disabled></div>
                </div>
            `,
            dark: `
                <style>
                    .chat-window { display: flex; flex-direction: column; height: 100%; font-family: sans-serif; background: #1e1e1e; color: #fff; }
                    .chat-header { background: #333333; color: #00ffcc; padding: 15px; font-weight: bold; text-align: center; border-bottom: 1px solid #444; }
                    .chat-messages { flex: 1; padding: 15px; display: flex; flex-direction: column; gap: 10px; }
                    .msg { background: #2d2d2d; color: #fff; padding: 10px; border-radius: 8px; max-width: 80%; font-size: 13px; border: 1px solid #444; }
                    .msg.system { background: #2a3a2a; align-self: center; color: #00ffcc; text-align: center; max-width: 100%; border: none; }
                    .chat-input { padding: 10px; background: #222; border-top: 1px solid #444; display: flex; }
                    .chat-input input { flex: 1; border: 1px solid #555; background: #333; color: white; padding: 8px; border-radius: 4px; font-size: 12px; }
                </style>
                <div class="chat-window">
                    <div class="chat-header">Tech Support (Dark)</div>
                    <div class="chat-messages">
                        <div class="msg system">Secure connection established.</div>
                        <div class="msg">Hello, engineer is on the way to help you.</div>
                    </div>
                    <div class="chat-input"><input type="text" placeholder="Type a message..." disabled></div>
                </div>
            `,
            blue: `
                <style>
                    .chat-window { display: flex; flex-direction: column; height: 100%; font-family: sans-serif; background: #f8fafc; }
                    .chat-header { background: #1e3a8a; color: white; padding: 15px; font-weight: 500; font-size: 14px; }
                    .chat-messages { flex: 1; padding: 15px; display: flex; flex-direction: column; gap: 12px; }
                    .msg { background: #ffffff; border: 1px solid #e2e8f0; padding: 12px; border-radius: 12px; max-width: 85%; font-size: 13px; line-height: 1.5; }
                    .msg.system { background: #f1f5f9; align-self: center; color: #475569; text-align: center; max-width: 100%; font-size: 11px; border: none; }
                    .chat-input { padding: 12px; background: #f1f5f9; display: flex; }
                    .chat-input input { flex: 1; border: 1px solid #cbd5e1; padding: 10px; border-radius: 8px; font-size: 13px; background: #fff; }
                </style>
                <div class="chat-window">
                    <div class="chat-header">Corporate Global Chat</div>
                    <div class="chat-messages">
                        <div class="msg system">Welcome to Global Marketing Channel.</div>
                        <div class="msg">Hello! Let us know how we can collaborate with your company.</div>
                    </div>
                    <div class="chat-input"><input type="text" placeholder="Enter your business inquiry..." disabled></div>
                </div>
            `
        };

        // 3. 스킨 변경 함수 (인터랙션 구현)
        function changePreview(skinKey) {
            // 카드 활성화 클래스 조절
            document.querySelectorAll('.skin-card').forEach(card => card.classList.remove('selected'));
            event.currentTarget.classList.add('selected');
            
            // 라디오 버튼 강제 체크 변경
            event.currentTarget.querySelector('input[type="radio"]').checked = true;

            // 섀도우 돔 루트 내부 콘텐츠를 통째로 갱신 (스타일 캡슐화 작동 검증)
            shadowRoot.innerHTML = mockJspSkins[skinKey];
        }

        // 초기 화면 구동 시 기본 스킨 로드
        shadowRoot.innerHTML = mockJspSkins['default'];
    </script>
</body>
</html>