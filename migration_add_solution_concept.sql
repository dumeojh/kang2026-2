-- problem_bank.html 편집기에 풀이 / 기초개념 필드를 추가하면서 필요한 컬럼들
-- Supabase SQL Editor에서 한 번만 실행하세요.

alter table live_problem_bank
  add column if not exists solution_html text,
  add column if not exists concept_title text,
  add column if not exists concept_body text,
  add column if not exists practice_statement text,
  add column if not exists practice_answer text,
  add column if not exists practice_solution text;
