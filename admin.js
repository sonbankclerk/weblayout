/*
 * 공통 스크립트 (최소한으로 유지)
 * - 삭제 등 파괴적인 액션에만 confirm 확인창 사용
 * - 화면 전환/애니메이션 효과는 넣지 않음
 */
function confirmDelete(message) {
  return window.confirm(message || '삭제하시겠습니까? 삭제 후에는 되돌릴 수 없습니다.');
}
