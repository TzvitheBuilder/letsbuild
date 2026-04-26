create table if not exists public.mentor_profiles (
  user_id uuid primary key,
  full_name text not null,
  headline text,
  expertise text,
  availability text,
  portfolio_url text,
  bio text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists public.mentor_requests (
  id uuid primary key default gen_random_uuid(),
  project_id uuid not null references public.projects(id) on delete cascade,
  student_id uuid not null,
  mentor_id uuid not null,
  message text,
  status text not null default 'pending',
  created_at timestamptz default now(),
  unique (project_id, mentor_id)
);

alter table public.mentor_profiles enable row level security;
alter table public.mentor_requests enable row level security;

create policy "Public can view mentor profiles"
on public.mentor_profiles
for select
to public
using (true);

create policy "Mentors can manage their own profiles"
on public.mentor_profiles
for all
to authenticated
using (user_id = auth.uid())
with check (user_id = auth.uid());

create policy "Mentors can create requests for themselves"
on public.mentor_requests
for insert
to authenticated
with check (mentor_id = auth.uid());

create policy "Mentors can view their own requests"
on public.mentor_requests
for select
to authenticated
using (mentor_id = auth.uid());

create policy "Students can view requests sent to their projects"
on public.mentor_requests
for select
to authenticated
using (student_id = auth.uid());
