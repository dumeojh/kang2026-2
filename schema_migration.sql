-- 실시간 퀴즈 플랫폼: 교실(담당 교사/학급) 구분 기능을 위한 스키마 변경
-- Supabase 대시보드 > SQL Editor 에서 한 번만 실행하면 됩니다.

alter table live_problems
  add column if not exists teacher_id text,
  add column if not exists teacher_name text,
  add column if not exists target_scope text[],   -- 예: {'1-03','1-ALL'} (학년-반 토큰 배열)
  add column if not exists room_code text;         -- 4자리 입장코드 (예외 상황 진입용)

-- 학생 화면이 활성 문제를 빠르게 찾도록 인덱스 추가 (선택이지만 권장)
create index if not exists idx_live_problems_active on live_problems (is_active);
create index if not exists idx_live_problems_teacher on live_problems (teacher_id);
create index if not exists idx_live_problems_room_code on live_problems (room_code);

-- target_scope 배열 컬럼에 대해 overlaps(&&) 검색이 빠르게 되도록 GIN 인덱스 추가 (선택)
create index if not exists idx_live_problems_target_scope on live_problems using gin (target_scope);
