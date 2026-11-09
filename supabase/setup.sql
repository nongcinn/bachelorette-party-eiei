-- Belle's Bachelorette shared planner
-- This simple link-based setup lets anonymous visitors read and update the
-- shared responses. Anyone with the site link can view and change the data.

create table if not exists public.party_state (
  id integer primary key check (id = 1),
  state jsonb not null,
  updated_at timestamptz not null default now(),
  constraint party_state_max_eight_people check (
    case
      when jsonb_typeof(state -> 'people') = 'array'
      then jsonb_array_length(state -> 'people') <= 8
      else false
    end
  )
);

alter table public.party_state enable row level security;

grant select, insert, update on public.party_state to anon;

drop policy if exists "Anyone can read party planner" on public.party_state;
create policy "Anyone can read party planner"
  on public.party_state for select to anon
  using (id = 1);

drop policy if exists "Anyone can initialize party planner" on public.party_state;
create policy "Anyone can initialize party planner"
  on public.party_state for insert to anon
  with check (id = 1);

drop policy if exists "Anyone can update party planner" on public.party_state;
create policy "Anyone can update party planner"
  on public.party_state for update to anon
  using (id = 1)
  with check (id = 1);

do $$
begin
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime'
      and schemaname = 'public'
      and tablename = 'party_state'
  ) then
    alter publication supabase_realtime add table public.party_state;
  end if;
end
$$;
